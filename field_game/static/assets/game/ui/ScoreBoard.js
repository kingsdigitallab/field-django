/*jshint esversion: 8 */

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
        this.defaultTextStyle = {fontFamily: 'PressStart2P', fontSize: '12px'};
        this.defaultColumnTitleTextStyle = {fontFamily: 'PressStart2P', fontSize: '14px'};
        this.defaultTitleTextStyle = {fontFamily: 'PressStart2P', fontSize: '24px'};
        this.defaultPromptTextStyle = {fontFamily: 'PressStart2P', fontSize: '16px'};

        this.columns = 5;
        this.cellWidth = 80;
        this.cellHeight = 64;

        // ms delay for scoreboard increases
        this.tickDelay = 100;
        this.cellKeys = {
            rankCell: 'rankCell',
            nameCell: 'nameCell',
            balanceCell: 'balanceCell',
            cowCell: 'cowCell',
            infectedCell: 'infectedCell'
        };

        this.visible = false;
    }

    toggleScoreboard() {
        this.scoreboardGroup.toggleVisible();
        if (this.visible === true) {
            this.scoreboardTitle.visible = false;
            this.scoreboardPrompt.visible = false;
            this.scoreboardBackground.visible = false;
            this.scoreboardEdge.visible = false;
        } else {
            this.scoreboardTitle.visible = true;
            this.scoreboardPrompt.visible = true;
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
    createScoreLine(farmer, rank, x, y) {

        let rankCell = this.scene.add.text(
            x, y,
            rank, this.defaultTextStyle
        );
        //console.log(rankCell.displayWidth);
        let nameCell = this.scene.add.text(
            x, y,
            farmer.name, this.defaultTextStyle
        );

        let balanceCell = this.scene.add.text(
            x, y,
            farmer.balance,
            this.defaultTextStyle
        );
        let cowCell = this.scene.add.text(
            x, y,
            farmer.herdTotal,
            this.defaultTextStyle
        );
        let infectedCell = this.scene.add.text(
            x, y,
            farmer.infections,
            this.defaultTextStyle
        );

        this.scoreboardLines[farmer.slug] = {
            'rankCell': rankCell,
            'nameCell': nameCell,
            'balanceCell': balanceCell,
            'cowCell': cowCell,
            'infectedCell': infectedCell
        };
        return [rankCell, nameCell, balanceCell, cowCell, infectedCell];
    }

    /**
     * Create text for the scoreboard at round end.
     *
     * Fixed char widths for easy reading below
     *
     * Name     £      Cows   Infected
     * 10       5       4         8
     *
     * 1 char padding
     *
     * Sort list by highest £, plyaer's in different colour
     */
    generateScoreGrid() {
        this.scoreboardGroup = this.scene.add.group({
            name: 'scoreboard_group',
            active: true,
        });
        this.columnHeadings = [
            this.scene.add.text(
                0, 0,
                'Rank',
                this.defaultColumnTitleTextStyle
            ),
            this.scene.add.text(
                0, 0,
                'Name',
                this.defaultColumnTitleTextStyle
            ),
            this.scene.add.text(
                0, 0,
                '£',
                this.defaultColumnTitleTextStyle
            ),
            this.scene.add.text(
                0, 0,
                'Cows',
                this.defaultColumnTitleTextStyle
            ),
            this.scene.add.text(
                0, 0,
                'Sick',
                this.defaultColumnTitleTextStyle
            ),
        ];
        this.scoreboardGroup.addMultiple(this.columnHeadings);

        let farmers = this.scene.gameScene.getAllFarmers();
        for (let f = 0; f < farmers.length; f++) {
            this.scoreboardGroup.addMultiple(this.createScoreLine(farmers[f], (f + 1), 0, 0));
        }

        this.scoreboardGrid = Phaser.Actions.GridAlign(this.scoreboardGroup.getChildren(), {
            width: 5,
            height: 10,
            cellWidth: this.cellWidth,
            cellHeight: this.cellHeight,
            position: Phaser.Display.Align.CENTER,
            x: this.rectCentreX - Math.round(((this.cellWidth * this.columns) / 2.5)),
            y: this.rectCentreY - ((this.cellHeight * 8) / 2)
        });

        return this.scoreboardGrid;
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

        /*if (currentValue < value) {
            // Add another tick
            this.scene.time.addEvent({
                delay: this.tickDelay,
                callback: this.scoreboardTickUp,
                args:[farmer_slug,cellKey,currentValue,value],
                callbackScope: this,
                loop: false
            });
        }*/
        return true;
    }

    createScoreBoard() {
        this.scoreboardGrid = this.generateScoreGrid();
        this.scoreboardGroup.toggleVisible();
    }

    updateScoreBoard() {
        //let scoreboardText = this.generateScoreTableText();
        this.scoreboardTitle.text = this.updateScoreboardTitleText();
        this.scoreboardTitle.x = this.rectCentreX - (this.scoreboardTitle.displayWidth / 2);

        this.scoreboardPrompt.x = this.rectCentreX - (this.scoreboardPrompt.displayWidth / 2);

    }

    updateScoreboardTitleText() {
        return "Turn " + this.scene.gameScene.gameState.currentTurn + " Scores";
    }

    /** Overall scoreboard for all players
     *
     */
    createScoreboard() {
        this.board_width = this.scene.GAME_WIDTH - (this.scene.GAME_WIDTH / 6);
        this.board_height = this.scene.GAME_HEIGHT - (this.scene.GAME_HEIGHT / 6);
        this.rectX = this.scene.GAME_WIDTH / 2 - (this.board_width / 2);
        this.rectY = this.scene.GAME_HEIGHT / 2 - (this.board_height / 2);
        this.rectCentreX = this.scene.GAME_WIDTH / 2;
        this.rectCentreY = this.scene.GAME_HEIGHT / 2;
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


        this.scoreboardPrompt = this.scene.add.text(
            this.rectCentreX, this.rectY + this.board_height - 50, 'Touch to continue',
            this.defaultPromptTextStyle
        );
        this.scoreboardPrompt.visible = false;
        this.scoreboardBackground.visible = false;
        this.scoreboardTitle.visible = false;
        this.scoreboardEdge.visisble = false;

    }
}
