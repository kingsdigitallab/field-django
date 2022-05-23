/*jshint esversion: 8 */
import {gameSettings} from "../cst.js";
import eventsCenter from "./EventsCenter.js";



/**
 * The scoreboard to dispaly player scores at round end
 *
 */
class ScoreBoard {
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
        this.borderThickness =  3;
        this.borderColor = 0x907748;
        this.borderAlpha = 1;
        this.windowAlpha = 0.8;
        this.windowColor = 0x303030;
        this.defaultTextStyle = {fontFamily: 'PressStart2P', fontSize:'14px'};

        this.cellWidth = 96;
        this.cellHeight = 64;

    }

    /**
     * Generate a line of cells for the scoreboard for round end
     *
     * @param farmer farmer who's score we're displayer
     *
     */
    createScoreLine(farmer, rank, x ,y) {

        let rankCell = this.scene.add.text(
            x,y,
            rank, this.defaultTextStyle
        );
        //console.log(rankCell.displayWidth);
        let nameCell = this.scene.add.text(
            x,y,
            farmer.name, this.defaultTextStyle
        );

        let balanceCell = this.scene.add.text(
            x,y,
            farmer.balance,
            this.defaultTextStyle
        );
        let cowCell = this.scene.add.text(
            x,y,
            farmer.herdTotal,
            this.defaultTextStyle
        );
        let infectedCell = this.scene.add.text(
            x,y,
            farmer.infections,
            this.defaultTextStyle
        );




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
        let scoreboardGroup = this.scene.add.group({
            name: 'scoreboard_group',
            active: true,
        });
        //scoreboardGroup.addMultiple(this.createScoreLine(this.scene.gameScene.player,1,0,0));

        let farmers = this.scene.gameScene.getAllFarmers();
        for (let f=0;f<farmers.length;f++){

            scoreboardGroup.addMultiple(this.createScoreLine(farmers[f],(f+1),0,0));
        }
        console.log(farmers);


        let scoreboardGrid = Phaser.Actions.GridAlign(scoreboardGroup.getChildren(), {
            width: 5,
            height: 10,
            cellWidth: this.cellWidth,
            cellHeight: this.cellHeight,
            x: this.rectCentreX,
            y: this.rectCentreY
        });

        return scoreboardGrid;
    }



    updateScoreBoard() {
        //let scoreboardText = this.generateScoreTableText();
        this.scoreboardTitle.text = this.updateScoreboardTitleText();
        this.scoreboardTitle.x = this.rectCentreX - (this.scoreboardTitle.displayWidth / 2);
        this.scoreboardGrid=this.generateScoreGrid();
    }

    updateScoreboardTitleText() {
        return "Turn " + this.scene.gameScene.gameState.currentTurn + " Scores";
    }

    /** Overall scoreboard for all players
     *
     */
    createScoreboard() {
        this.board_width = this.scene.GAME_WIDTH - (this.scene.GAME_WIDTH / 4);
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
        let scoreboardEdge = graphics.strokeRect(
            this.rectX, this.rectY, this.board_width, this.board_height
        );
        graphics.fillStyle(
            this.windowColor, this.windowAlpha
        );
        let scoreboardBackground = graphics.fillRect(
            this.rectX + 1, this.rectY + 1, this.board_width - 1, this.board_height - 1
        );
        let titleText = this.updateScoreboardTitleText();
        this.scoreboardTitle = this.scene.add.text(
            this.rectCentreX, this.rectY + 25, titleText, this.defaultTextStyle
        );



        // todo: Add list of scores using animated text effect in table
        // todo fix text sizes for each field for clean presentation
        console.log(this.rectCentreX);


    }
}

export default class UIScene extends Phaser.Scene {


    constructor() {
        super(gameSettings.SCENENAMES.UISCENENAME);
        this.COLOR_PRIMARY = 0x4e342e;
        this.COLOR_LIGHT = 0x7b5e57;
        this.COLOR_DARK = 0x260e04;
        this.balanceText = "£ ";
        this.herdText = "Cows: ";
        this.texts = [];//Queue for dialog text
        this.defaultTextStyle = {fontFamily: 'PressStart2P', fontSize:'64px'};

    }


    preload() {
        //this.load.scenePlugin('rexuiplugin', '/static/assets/game/plugins/rexuiplugin.min.js', 'rexUI', 'rexUI');
        //this.load.plugin('DialogModalPlugin', DialogModalPlugin, true);
    }

    create() {
        this.GAME_WIDTH = this.scale.width;
        this.GAME_HEIGHT = this.scale.height;
        this.gameScene = this.scene.get(gameSettings.SCENENAMES.GAMESCENENAME);
        // Set up main dialog window on the bottom of the screen
        this.dialogWindow.createWindow(this);
        // Player display
        //this.createPlayerInfo();
        this.scoreboard = new ScoreBoard(this);
        this.scoreboard.createScoreboard();


        //Start hidden
        this.toggleDialogWindow();
        this.setupListeners();

        this.events.on(Phaser.Scenes.Events.SHUTDOWN, () => {
            this.removeListeners();
        });

    }

    /**
     * Add listeners, plus controls to on/off based on puse/resume of scene
     * And finally remove on shutdown
     */
    setupListeners() {
        this.addListeners();
        this.events.on(Phaser.Scenes.Events.RESUME, () => {
            this.addListeners();
        });
        this.events.on(Phaser.Scenes.Events.PAUSE, () => {
            this.removeListeners();
        });
        this.events.on(Phaser.Scenes.Events.SHUTDOWN, () => {
            this.removeListeners();
        });
    }

    addListeners() {
        eventsCenter.on(gameSettings.EVENTS.ADVANCEDIALOG, this.advanceDialogWindowSequence, this);
    }

    removeListeners() {
        eventsCenter.off(gameSettings.EVENTS.ADVANCEDIALOG, this.advanceDialogWindowSequence, this);
    }

    toggleDialogWindow() {
        this.dialogWindow.toggleWindow();
    }

    advanceDialogWindowSequence() {
        // Queued text is available
        if (this.texts && this.texts.length > 0) {
            // If text isn't visible, toggle window
            if (!this.dialogWindow.visible) {
                this.toggleDialogWindow();
            }
            //Set the text
            this.dialogWindow.setText(this, this.texts[0], true);
            // Remove it from queue
            this.texts.shift();
        } else if (this.texts.length === 0 && this.dialogWindow.visible) {
            // Queue empty, hide window
            eventsCenter.emit(gameSettings.EVENTS.DIALOGFINISHED);
            this.toggleDialogWindow();
        }
    }

    /**
     * Add text to the main dialog window queue.
     * Remember to call Advance to start!
     * @param moreText array of text
     */
    addDialogText(moreText) {
        this.texts.push(...moreText);
    }

    setDialogSpeed(speed) {
        this.dialogWindow.dialogSpeed = speed;
    }

    setDialogWindowText(text) {
        this.dialogWindow.setText(this, text, true);
    }

    updateBalance(balance) {
        this.playerInfoBalance.setText(this.balanceText + balance);
        Phaser.Display.Align.To.BottomLeft(
            this.playerInfoBalance, this.playerInfoTitle
        );

    }

    updateHerd(herdTotal) {
        this.playerInfoHerd.setText(this.herdText + herdTotal);
        Phaser.Display.Align.To.BottomLeft(
            this.playerInfoHerd, this.playerInfoBalance
        );
    }


    /**
     * Scoreboard with all player/AI totals
     */
    createPlayerInfo() {
        let board_width = this.GAME_WIDTH / 4;
        let board_height = this.GAME_HEIGHT / 8;
        this.playerInfoContainer = this.add.container(board_width, board_height);
        this.playerInfoBackground = this.add.rectangle(0, 0, board_width, board_height, 0x000000, 0.4);
        this.playerInfoTitle = this.add.text(0, 0, 'Player', this.defaultTextStyle);

        this.playerInfoBalance = this.add.text(0, 1, this.balanceText, this.defaultTextStyle);
        this.playerInfoHerd = this.add.text(0, 22, this.herdText, this.defaultTextStyle);
        this.playerInfoHerd.setOrigin(0, 0);
        this.playerInfoBalance.setOrigin(0.5, 0);
        this.playerInfoTitle.setOrigin(0.5, 0);

        this.playerInfoContainer.add(this.playerInfoBackground);
        this.playerInfoContainer.add(this.playerInfoTitle);
        this.playerInfoContainer.add(this.playerInfoBalance);
        this.playerInfoContainer.add(this.playerInfoHerd);

        Phaser.Display.Align.In.TopCenter(
            this.playerInfoTitle, this.playerInfoBackground
        );
        Phaser.Display.Align.To.BottomLeft(
            this.playerInfoBalance, this.playerInfoTitle
        );
        Phaser.Display.Align.To.BottomLeft(
            this.playerInfoHerd, this.playerInfoBalance
        );

        this.playerInfoContainer.x = this.GAME_WIDTH / 2;
        this.playerInfoContainer.y = board_height / 2 + 10;

        // Start hidden
        this.playerInfoContainer.setVisible(false);
    }




}
