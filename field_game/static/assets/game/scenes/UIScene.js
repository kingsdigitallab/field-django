/*jshint esversion: 8 */
import {BFREESCENENAME, GAMESCENENAME, UISCENENAME, EVENTS} from "../cst.js";
import eventsCenter from "./EventsCenter.js";

export default class UIScene extends Phaser.Scene {


    constructor() {
        super('UIScene');
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
        this.gameScene = this.scene.get(GAMESCENENAME);
        // Main dialogue
        this.createPlayerInfo();
        this.createScoreboard();
        // Set up main dialog window on the bottom of the screen
        this.dialogWindow.createWindow(this);
        //Start hidden
        this.toggleDialogWindow();
        this.setupListeners();
        //this.dialogWindow.setText(this,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', true);

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
        eventsCenter.on(EVENTS.ADVANCEDIALOG, this.advanceDialogWindowSequence, this);
    }

    removeListeners(){
        eventsCenter.off(EVENTS.ADVANCEDIALOG, this.advanceDialogWindowSequence, this);
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
            eventsCenter.emit(EVENTS.DIALOGFINISHED);
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

        this.scoreboardBackground = this.add.rectangle(this.GAME_WIDTH/2, this.GAME_HEIGHT/2, board_width, board_height, 0x000000, 0.6);


        let title = this.add.text(0, 0, 'Scores', {fontFamily: 'PressStart2P'});
        Phaser.Display.Align.In.TopCenter(
            title, this.scoreboardBackground
        );

        this.scoreboardContainer = this.add.container(0, 0, [this.scoreboardBackground, title]);

        this.scoreboardContainer.setVisible(false);
    }


}
