/*jshint esversion: 8 */
import {gameSettings} from "../cst.js";
import eventsCenter from "./EventsCenter.js";

export default class UIScene extends Phaser.Scene {


    constructor() {
        super(gameSettings.SCENENAMES.UISCENENAME);
        this.COLOR_PRIMARY = 0x4e342e;
        this.COLOR_LIGHT = 0x7b5e57;
        this.COLOR_DARK = 0x260e04;
        this.balanceText="£ ";
        this.herdText="Cows: ";
        this.texts=[];//Queue for dialog text
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
        // Round end scoreboard
        this.createScoreboard();

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
    setupListeners(){
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

    addListeners(){
        eventsCenter.on(gameSettings.EVENTS.ADVANCEDIALOG, this.advanceDialogWindowSequence, this);
    }

    removeListeners(){
        eventsCenter.off(gameSettings.EVENTS.ADVANCEDIALOG, this.advanceDialogWindowSequence, this);
    }

    toggleDialogWindow(){
        this.dialogWindow.toggleWindow();
    }

    advanceDialogWindowSequence(){
        // Queued text is available
        if (this.texts && this.texts.length > 0){
            // If text isn't visible, toggle window
            if (!this.dialogWindow.visible){
                this.toggleDialogWindow();
            }
            //Set the text
            this.dialogWindow.setText(this, this.texts[0], true);
            // Remove it from queue
            this.texts.shift();
        }else if (this.texts.length === 0 && this.dialogWindow.visible){
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
    addDialogText(moreText){
        this.texts.push(...moreText);
    }

    setDialogSpeed(speed){
        this.dialogWindow.dialogSpeed = speed;
    }

    setDialogWindowText(text){
        this.dialogWindow.setText(this,text, true);
    }

    updateBalance(balance){
        this.playerInfoBalance.setText(this.balanceText + balance);
        Phaser.Display.Align.To.BottomLeft(
            this.playerInfoBalance, this.playerInfoTitle
        );

    }

    updateHerd(herdTotal){
        this.playerInfoHerd.setText(this.herdText + herdTotal);
        Phaser.Display.Align.To.BottomLeft(
            this.playerInfoHerd, this.playerInfoBalance
        );
    }


    /**
     * Scoreboard with all player/AI totals
     */
    createPlayerInfo() {
        let board_width=this.GAME_WIDTH / 4;
        let board_height=this.GAME_HEIGHT / 8;
        this.playerInfoContainer = this.add.container(board_width, board_height);
        this.playerInfoBackground = this.add.rectangle(0, 0, board_width, board_height, 0x000000, 0.4);
        this.playerInfoTitle = this.add.text(0, 0, 'Player', {fontFamily: 'PressStart2P'});

        this.playerInfoBalance = this.add.text(0, 1, this.balanceText, {fontFamily: 'PressStart2P'});
        this.playerInfoHerd = this.add.text(0, 22, this.herdText, {fontFamily: 'PressStart2P'});
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

    /** Overall scoreboard for all players
     *
     */
    createScoreboard(){
        let board_width=this.GAME_WIDTH-(this.GAME_WIDTH/4);
        let board_height=this.GAME_HEIGHT-(this.GAME_HEIGHT/6);
        let rectX=this.GAME_WIDTH/2 - (board_width/2);
        let rectY=this.GAME_HEIGHT/2 - (board_height/2);
        let rectCentreX=this.GAME_WIDTH/2;
        let rectCentreY=this.GAME_HEIGHT/2;
        console.log(this.dialogWindow.borderThickness);
        // Nicked from the plugin
        let graphics = this.add.graphics();
        graphics.lineStyle(
            this.dialogWindow.borderThickness,
            this.dialogWindow.borderColor,
            this.dialogWindow.borderAlpha
        );
        let scoreboardEdge=graphics.strokeRect(rectX, rectY, board_width, board_height);
        graphics.fillStyle(this.dialogWindow.windowColor, this.dialogWindow.windowAlpha);
        let scoreboardBackground=graphics.fillRect(rectX + 1, rectY + 1, board_width-1, board_height-1);
        let titleText = "Turn "+this.gameScene.gameState.currentTurn+" Scores";
        let title = this.add.text(rectCentreX, rectY+25, titleText, {fontFamily: 'PressStart2P'});
        title.x=rectCentreX-(title.displayWidth/2);
        this.children.bringToTop(title);
        // todo: Add list of scores using animated text effect in table
        // todo fix text sizes for each field for clean presentation
        //
        /*this.scoreboardBackground = this.add.rectangle(x, y, board_width, board_height, 0x000000, 0.6);

let title = this.add.text(0, 0, 'Scores', {fontFamily: 'PressStart2P'});
        Phaser.Display.Align.In.TopCenter(
            title, this.scoreboardBackground
        );

        Phaser.Display.Align.In.TopCenter(
            title, this.scoreboardBackground
        );

        this.scoreboardContainer = this.add.container(0, 0, [this.scoreboardBackground, title]);*/

        //let dimensions = this.dialogWindow._calculateWindowDimensions(board_width, board_height);
        //this.dialogWindow._createOuterWindow(dimensions.x, dimensions.y, dimensions.rectWidth, dimensions.rectHeight);
        //this.dialogWindow._createInnerWindow(dimensions.x, dimensions.y, dimensions.rectWidth, dimensions.rectHeight);
        //this.scoreboardContainer.setVisible(false);
    }


}
