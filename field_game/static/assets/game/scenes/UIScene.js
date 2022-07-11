/*jshint esversion: 8 */
import {gameSettings} from "../cst.js";
import eventsCenter from "./EventsCenter.js";
import ScoreBoard from "../ui/ScoreBoard.js";


export default class UIScene extends Phaser.Scene {


    constructor() {
        super(gameSettings.SCENENAMES.UISCENENAME);
        this.COLOR_PRIMARY = 0x4e342e;
        this.COLOR_LIGHT = 0x7b5e57;
        this.COLOR_DARK = 0x260e04;
        this.balanceText = "£ ";
        this.herdText = "Cows: ";
        this.texts = [];//Queue for dialog text
        this.defaultTextStyle = {fontFamily: 'PressStart2P', fontSize: '16px'};
        this.titleTextStyle = {fontFamily: 'PressStart2P', fontSize: '54px'};
    }


    preload() {
        //this.load.scenePlugin('rexuiplugin', '/static/assets/game/plugins/rexuiplugin.min.js', 'rexUI', 'rexUI');
        //this.load.plugin('DialogModalPlugin', DialogModalPlugin, true);
    }

    create() {
        this.GAME_WIDTH = this.scale.width;
        this.GAME_HEIGHT = this.scale.height;
        this.gameScene = this.scene.get(gameSettings.SCENENAMES.GAMESCENENAME);
        this.createTitle();
        // Set up main dialog window on the bottom of the screen
        this.dialogWindow.createWindow(this);
        // Player display
        this.createPlayerInfo();

        this.scoreboard = new ScoreBoard(this);
        this.scoreboard.createScoreboard();

        //Start bottom windows hidden
        this.toggleDialogWindow();
        this.togglePlayerWindow();
        this.setupListeners();

        this.events.on(Phaser.Scenes.Events.SHUTDOWN, () => {
            this.removeListeners();
        });

    }

    sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }


    /**
     * Add listeners, plus controls to on/off based on puse/resume of scene
     * And finally remove on shutdown
     */
    setupListeners() {
        this.addListeners();
        this.events.on(Phaser.Scenes.Events.SHUTDOWN, () => {
            this.removeListeners();
        });
    }

    addListeners() {
        eventsCenter.on(gameSettings.EVENTS.STARTDIALOG, this.openDialogWindow, this);
        eventsCenter.on(gameSettings.EVENTS.ADVANCEDIALOG, this.advanceDialogWindowSequence, this);
        // eventsCenter.on(gameSettings.EVENTS.DIALOGFINISHED, this.closeDialogWindow, this);
        eventsCenter.on(gameSettings.EVENTS.PLAYERHERDUPDATED, this.updatePlayerInfoHerd, this);
        eventsCenter.on(gameSettings.EVENTS.PLAYERBALANCEUPDATED, this.updatePlayerInfoBalance, this);
    }

    removeListeners() {
        console.log('listener removed');
        eventsCenter.off(gameSettings.EVENTS.ADVANCEDIALOG, this.advanceDialogWindowSequence, this);
    }

    toggleDialogWindow() {
        this.dialogWindow.toggleWindow();
    }

    openDialogWindow() {
        this.dialogWindow.openDialogWindow();
    }


    closeDialogWindow() {
        this.dialogWindow.closeDialogWindow();
    }

    togglePlayerWindow() {

        if (this.playerInfoContainer.visible){
            this.playerInfoContainer.visible = false;
            this.playerInfoBalance.visible = false;
            this.playerInfoHerd.visible = false;
            this.playerInfoTitle.visible = false;
        }else{
            this.playerInfoContainer.visible = true;
            this.playerInfoBalance.visible = true;
            this.playerInfoHerd.visible = true;
            this.playerInfoTitle.visible = true;
        }


    }

    advanceDialogWindowSequence() {
        // Dialog in progress, dump buffer
        if (this.dialogWindow.eventCounter > 0){
            this.dialogWindow.timedEvent.remove();

            if (this.dialogWindow.text && this.dialogWindow.dialog){
                let bufferText = this.dialogWindow.dialog.slice(
                    this.dialogWindow.eventCounter, this.dialogWindow.dialog.length
                ).join('');
                this.dialogWindow.text.text=this.dialogWindow.text.text+bufferText;
            }
            this.dialogWindow.eventCounter = 0;
        }else if (this.texts && this.texts.length > 0) {
            // Queued text is available
            //Set the text
            this.dialogWindow.setText(this, this.texts[0], true);
            // Remove it from queue
            this.texts.shift();

        } else if (this.texts.length === 0) {
            // Queue empty, hide window
            eventsCenter.emit(gameSettings.EVENTS.DIALOGFINISHED);

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

    addTextAndStartDialog(moreText) {
        this.texts.push(...moreText);
        eventsCenter.emit(gameSettings.EVENTS.ADVANCEDIALOG);
        eventsCenter.emit(gameSettings.EVENTS.STARTDIALOG);
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
     * Display titles like turn and phase start
     * Uses the ADVANCEDIALOG to signal display complete
     * for tweens and delays
     */
    updateTitleDisplay(text, complete) {
        this.gameTitle.text = text;
        this.gameTitle.x = (this.GAME_WIDTH / 2) - (this.gameTitle.displayWidth / 2);
        this.tweens.add({
            targets: this.gameTitle,
            alpha: {value: 1, duration: 2000, ease: 'Power1'},
            yoyo: true,
            onComplete: complete
        });
    }

    /** Turn start title display
     *
     */
    displayTurn() {
        this.updateTitleDisplay("Turn " + this.gameScene.gameState.currentTurn, function () {
            eventsCenter.emit(gameSettings.EVENTS.TURNSTART);
        });
    }

    /** Title for phase and turn starts
     *
     */
    createTitle() {
        this.gameTitle = this.add.text(
            this.GAME_WIDTH / 2, this.GAME_HEIGHT / 2,
            '',
            this.titleTextStyle
        ).setAlpha(0);
    }

    updatePlayerInfoHerd() {
        this.playerInfoHerd.text = this.herdText + this.gameScene.player.herdTotal;
    }

    /** Update UI to show new player balance
     *
     */
    updatePlayerInfoBalance() {
        this.playerInfoBalance.text = this.balanceText + this.gameScene.player.balance;
    }


    /**
     * Scoreboard with all player/AI totals
     */
    createPlayerInfo() {
        let board_width = this.dialogWindow.padding * 2;
        let board_height = this.dialogWindow.windowHeight; //this.GAME_HEIGHT / 8;
        this.playerInfoContainer = this.add.container(board_width, board_height);
        this.playerInfoBackground = this.add.rectangle(0, 0, board_width, board_height, 0x000000, 0.4);
        this.playerInfoTitle = this.add.text(0, 0, 'Player', this.defaultTextStyle);

        this.playerInfoBalance = this.add.text(0, 1, this.balanceText, this.defaultTextStyle);
        this.playerInfoHerd = this.add.text(0, 22, this.herdText, this.defaultTextStyle);
        this.playerInfoHerd.setOrigin(0, 0);
        this.playerInfoBalance.setOrigin(0, 0);
        this.playerInfoTitle.setOrigin(0.5, 0);

        this.playerInfoContainer.add(this.playerInfoBackground);
        this.playerInfoContainer.add(this.playerInfoTitle);
        this.playerInfoContainer.add(this.playerInfoBalance);
        this.playerInfoContainer.add(this.playerInfoHerd);

        Phaser.Display.Align.In.Center(
            this.playerInfoTitle, this.playerInfoBackground,0,-30
        );
        Phaser.Display.Align.To.BottomLeft(
            this.playerInfoBalance, this.playerInfoTitle,0,5
        );
        Phaser.Display.Align.To.BottomLeft(
            this.playerInfoHerd, this.playerInfoBalance,0,5
        );

        this.playerInfoContainer.x = this.dialogWindow.padding;
        this.playerInfoContainer.y = this.scale.height - this.dialogWindow.windowHeight + (board_height/2);//board_height / 2 + 10;

        // Start hidden
        this.playerInfoContainer.setVisible(true);
    }


}
