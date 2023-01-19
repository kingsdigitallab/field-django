/*jshint esversion: 8 */
import {gameState} from '../GameState.js';
import {gameSettings, States} from "../cst.js";
import eventsCenter from "../scenes/EventsCenter.js";

/**
 * The scoreboard to dispaly player scores at round end
 *
 */
export default class ScoreBoard {
    constructor(scene) {
        this.scene = scene;
        this.scoreboard = null;
        this.scoreboardTitle = null;
        this.scoreboardLines = {};

        this.nameMinLength = 10;
        this.balanceMinLength = 5;
        this.cowsMinLength = 4;
        this.infectedMinLength = 8;
        this.scoreLinePadding = 1;

        // set properties for scoreboard
        // Nicked from dialogmodalplugin
        this.borderThickness = 3;
        this.borderColor = 0x907748;
        this.borderAlpha = 1;
        this.windowAlpha = 0.8;
        this.windowColor = 0x303030;
        this.defaultTextStyle = {fontFamily: 'PressStart2P', fontSize: '14px'};
        this.defaultColumnTitleTextStyle = {fontFamily: 'PressStart2P', fontSize: '14px'};
        this.defaultTitleTextStyle = {fontFamily: 'PressStart2P', fontSize: '24px'};
        this.defaultPromptTextStyle = {fontFamily: 'PressStart2P', fontSize: '24px'};

        this.columns = 4;
        this.cellWidth = 80;
        this.cellHeight = 64;

        // ms delay for scoreboard increases
        this.tickDelay = 100;
        this.cellKeys = {
            rankCell: 'rankCell',
            nameCell: 'nameCell',
            balanceCell: 'balanceCell',
            cowCell: 'cowCell',
            //infectedCell: 'infectedCell'
        };
        this.scoreFadeIn = null;
        this.scoreFadeOut = null;
        this.promptOffset = 50;

        this.visible = false;

    }

    toggleScoreboard() {
        this.scoreboardTitles.toggleVisible();
        this.scoreboardGroup.toggleVisible();
        if (this.visible === true) {
            this.scoreboardTitle.visible = false;
            this.scoreboardBackground.visible = false;
            this.scoreboardEdge.visible = false;
            // Check we're not mid update score
            if ((this.scoreFadeOut && this.scoreFadeOut.isPlaying()) || (this.scoreFadeIn && this.scoreFadeIn.isPlaying())) {
                this.scoreFadeOut.stop();
                this.scoreFadeIn.stop();
            }
        } else {
            this.scoreboardTitle.visible = true;
            //this.scoreboardPrompt.visible = true;
            this.scoreboardBackground.visible = true;
            this.scoreboardEdge.visible = true;
        }
        this.visible = !this.visible;
    }

    /**
     * Generate a line of cells for the scoreboard for round end
     *
     * @param farmer farmer who's score we're displayer
     *
     */
    createScoreLine(farmer, rank, x, y, alpha) {
        let lineTextStyle = this.defaultTextStyle;

        //if (farmer === this.)
        let rankCell = this.scene.add.text(
            x, y,
            rank, lineTextStyle
        ).setAlpha(alpha);
        //console.log(rankCell.displayWidth);
        let nameCell = this.scene.physics.add.sprite(
            x,
            y,
            gameSettings.CHARACTER_KEY,
            farmer.sprite.frame.name
        ).setScale(2).setAlpha(alpha);
        /*
        let nameCell = this.scene.add.text(
            x, y,
            farmer.name, lineTextStyle
        ).setAlpha(alpha);*/

        let balanceCell = this.scene.add.text(
            x, y,
            farmer.balance,
            lineTextStyle
        ).setAlpha(alpha);

        let cowCell = this.scene.add.text(
            x, y,
            farmer.herdTotal,
            lineTextStyle
        ).setAlpha(alpha);
        /*let infectedCell = this.scene.add.text(
            x, y,
            farmer.infections,
            lineTextStyle
        ).setAlpha(alpha);*/

        this.scoreboardLines[farmer.slug] = {
            'rankCell': rankCell,
            'nameCell': nameCell,
            'balanceCell': balanceCell,
            'cowCell': cowCell,
            //'infectedCell': infectedCell
        };
        return [rankCell, nameCell, balanceCell, cowCell];
    }

    /**
     * Headings for our scoreboard
     * Hidden by default
     */
    createGridTitles() {
        this.scoreboardTitles = this.scene.add.group({
            name: 'scoreboard_group',
            active: true,
        });
        this.columnHeadings = [
            this.scene.add.text(
                0, 0,
                'Rank',
                this.defaultColumnTitleTextStyle
            ).setVisible(false),
            this.scene.add.text(
                0, 0,
                'Player',
                this.defaultColumnTitleTextStyle
            ).setVisible(false),
            this.scene.add.text(
                0, 0,
                '£',
                this.defaultColumnTitleTextStyle
            ).setVisible(false),
            this.scene.add.text(
                0, 0,
                'Cows',
                this.defaultColumnTitleTextStyle
            ).setVisible(false),
            /*this.scene.add.text(
                0, 0,
                'Sick',
                this.defaultColumnTitleTextStyle
            ).setVisible(false),*/
        ];
        this.scoreboardTitles.addMultiple(this.columnHeadings);

    }

    /**
     * Create text for the scoreboard at round end.
     *
     * Fixed char widths for easy reading below
     *
     * Name     £      Cows
     * 10       5       4
     *
     * 1 char padding
     *
     * Sort list by highest £, plyaer's in different colour
     * @param players Farmer objects to display on scoreboard
     * @param alpha starting alpha so we can create hidden for updates
     */
    generateScoreGrid(players, alpha) {
        this.scoreboardGroup = this.scene.add.group({
            name: 'scoreboard_group',
            active: true,
        });
        for (let f = 0; f < players.length; f++) {
            this.scoreboardGroup.addMultiple(this.createScoreLine(players[f], (f + 1), 0, 0, alpha));
        }

        return this.scoreboardGroup;

    }

    arrangeScoreGrid() {
        let scoreGrid = [];
        if (this.scoreboardTitles && this.scoreboardGroup) {
            scoreGrid.push(...this.scoreboardTitles.getChildren());
            scoreGrid.push(...this.scoreboardGroup.getChildren());
            Phaser.Actions.GridAlign(scoreGrid, {
                width: this.columns,
                height: 7,
                cellWidth: this.cellWidth,
                cellHeight: this.cellHeight,
                position: Phaser.Display.Align.CENTER,
                /* An example of the craziness of aligning things in phaser.  This is:
                Total widths of screen - half the total width of the grid
                BUT because the x,y in grid align is marked for the first cell in the grid
                AND (this was the annoying bit) it's the CENTER x,y of that first cell
                we offset by half its width as well
                 */
                x: this.rectCentreX - ((this.cellWidth * this.columns) / 2) + (this.cellWidth / 2),
                y: this.rectCentreY - ((this.cellHeight * 7) / 2)
            });


        }

    }


    updateScoreboardCell(farmer_slug, cellKey, value) {
        if (farmer_slug && this.scoreboardLines[farmer_slug]) {
            this.scoreboardLines[farmer_slug][cellKey].text = value;
        }
    }

    sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }

    /**
     * Use a timer to progressively increase a number on the scoreboard
     */
    async scoreboardTickUp(farmer_slug, cellKey, currentValue, value) {
        // Update the scoreboard one tick
        if (currentValue < value) {
            while (currentValue < value) {
                currentValue += 1;
                this.updateScoreboardCell(farmer_slug, cellKey, currentValue);
                await this.sleep(this.tickDelay);
            }

        }
        return true;
    }

    async infectionTickUp(currentValue, value) {
        if (currentValue < value) {
            while (currentValue < value) {
                currentValue += 1;
                await this.sleep(this.tickDelay);
            }

        }
        return true;
    }

    fillScoreBoard(players) {
        this.generateScoreGrid(players, 1);
        this.arrangeScoreGrid();
        this.scoreboardGroup.toggleVisible();

    }

    updateScoreBoardTitles() {
        //let scoreboardText = this.generateScoreTableText();
        this.scoreboardTitle.text = this.updateScoreboardTitleText();
        this.scoreboardTitle.x = this.rectCentreX - (this.scoreboardTitle.displayWidth / 2);

        this.scoreboardPrompt.x = this.rectCentreX - (this.scoreboardPrompt.displayWidth / 2);

    }

    addPlayerHighlightBox() {
        let playerLine = this.scoreboardLines.Player;
        console.log(playerLine.rankCell.x);
        console.log(this.rectCentreX - ((this.cellWidth * this.columns) / 2) + (this.cellWidth / 2));
        this.playerHighlight = this.scene.add.rectangle(
            this.rectCentreX,
            playerLine.rankCell.y + this.cellHeight / 4,
            this.columns * this.cellWidth,
            this.cellHeight
        );
        this.playerHighlight.setStrokeStyle(2, 0xefc53f);
        this.playerHighlightTween = this.scene.tweens.add({
            targets: this.playerHighlight,
            alpha: 0.2,
            yoyo: true,
            repeat: -1,
            ease: 'Sine.easeInOut'
        });


    }

    /**
     * sort on passed cell
     * Play tween animations to fade out
     * rearrange, applying rank numbers
     * fade in
     */
    updateScoreBoardRanks(scene, players) {

        //Fade
        let scoreboard = this;
        let group = this.scoreboardGroup;
        let fadeOut = this.scoreFadeOut;
        fadeOut = scene.tweens.createTimeline();
        let fadeIn = this.scoreFadeIn;
        group.getChildren().forEach(function (child) {
            fadeOut.add({
                targets: child,
                alpha: {value: 0, duration: 50, ease: 'Power1'},

            });
        });
        fadeOut.setCallback('onComplete', function () {

            group.destroy(true);
            let rankedGroup = scoreboard.generateScoreGrid(players, 0);
            scoreboard.arrangeScoreGrid();
            fadeIn = scene.tweens.createTimeline();
            fadeIn.setCallback('onComplete', function () {
                if (gameState.currentState === States.TURNEND) {
                    scoreboard.addPlayerHighlightBox();
                    eventsCenter.emit(gameSettings.EVENTS.SCOREBOARDFINISH);
                }
            });
            rankedGroup.getChildren().forEach(function (child) {
                fadeIn.add({
                    targets: child,
                    alpha: {value: 1, duration: 100, ease: 'Power1'},
                });
            });
            fadeIn.play();
        }, this);
        fadeOut.play();

    }

    updateScoreboardTitleText() {
        return "Turn " + gameState.currentTurn + " Scores";
    }

    setScoreboardPromptVisible(visibility) {
        if (visibility === true) {
            this.scoreboardPrompt.x = this.scoreboardTitle.x + this.scoreboardTitle.displayWidth / 2;
            //this.scoreboardPrompt.y = this.scoreboardBackground.y + this.scoreboardBackground.displayHeight - (this.scoreboardPrompt.displayHeight /2);
            this.scoreboardPrompt.visible = true;
            this.promptBackground.visible = true;
        } else {
            this.scoreboardPrompt.visible = false;
            this.promptBackground.visible = false;
        }
    }

    continueButtonEndTurn() {
        //console.log('End clicked');
        if (gameState.currentState === States.TURNENDFINISH) {
            this.playerHighlight.visible = false;
            this.playerHighlightTween.stop();
            eventsCenter.emit(gameSettings.EVENTS.TURNEND);
        }
    }

    continueButtonEndGame() {
        // Start the end game sequence
        this.playerHighlight.visible = false;
        this.playerHighlightTween.stop();
        this.scene.scene.start(gameSettings.SCENENAMES.GAMEENDSCENENAME);
    }

    /** Overall scoreboard for all players
     *
     */
    createScoreboard() {
        this.board_width = this.scene.GAME_WIDTH - (this.scene.GAME_WIDTH / 6);
        this.board_height = this.scene.GAME_HEIGHT - (this.scene.GAME_HEIGHT / 6);
        this.rectX = this.scene.GAME_WIDTH / 2 - (this.board_width / 2);
        this.rectY = this.scene.GAME_HEIGHT / 2 - (this.board_height / 2);
        this.rectCentreX = this.scene.scale.width / 2;
        this.rectCentreY = this.scene.scale.height / 2;
        // Nicked from the plugin
        let graphics = this.scene.add.graphics();
        graphics.lineStyle(
            this.borderThickness,
            this.borderColor,
            this.borderAlpha
        );
        this.scoreboardEdge = graphics.strokeRect(
            this.rectX, this.rectY, this.board_width, this.board_height
        );
        graphics.fillStyle(
            this.windowColor, this.windowAlpha
        );
        this.scoreboardBackground = graphics.fillRect(
            this.rectX + 1, this.rectY + 1,
            this.board_width - 1, this.board_height - 1
        );

        let titleText = this.updateScoreboardTitleText();
        this.scoreboardTitle = this.scene.add.text(
            this.rectCentreX, this.rectY + 25, titleText,
            this.defaultTitleTextStyle
        );
        this.createGridTitles();

        // Continue button
        let promptWidth = 250;
        let promptHeight = 90;
        this.promptBackground = this.scene.add.graphics();

        this.scoreboardPrompt = this.scene.add.text(
            this.rectCentreX,
            this.board_height,
            'Continue', this.defaultPromptTextStyle
        )
            .setOrigin(0.5)
            .setPadding(25)
            .setStyle({backgroundColor: '#111'});
        this.scoreboardPrompt.y -= this.scoreboardPrompt.displayHeight / 2;
        this.scoreboardPrompt.setInteractive();
        this.scoreboardPrompt.on('pointerup', this.continueButtonEndTurn, this);

        this.promptBackground.strokeRect(
            this.scoreboardPrompt.x - (this.scoreboardPrompt.displayWidth / 2) - 1,
            this.scoreboardPrompt.y - (this.scoreboardPrompt.displayHeight / 2) - 1,
            this.scoreboardPrompt.displayWidth + 2,
            this.scoreboardPrompt.displayHeight + 1
        )
            .lineStyle(
                this.borderThickness,
                this.borderColor,
                this.borderAlpha
            )
            .fillStyle(
                this.windowColor, this.windowAlpha
            );

        this.promptBackground.visible = false;
        this.scoreboardPrompt.visible = false;
        this.scoreboardBackground.visible = false;
        this.scoreboardTitle.visible = false;
        this.scoreboardEdge.visisble = false;

    }
}
