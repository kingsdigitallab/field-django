/*jshint esversion: 8 */
import {gameSettings} from "../cst.js";
import eventsCenter from "./EventsCenter.js";
import ScoreBoard from "../ui/ScoreBoard.js";
import {gameState} from '../GameState.js';


export default class UIScene extends Phaser.Scene {


    constructor() {
        super(gameSettings.SCENENAMES.UISCENENAME);
        this.COLOR_PRIMARY = 0x4e342e;
        this.COLOR_LIGHT = 0x7b5e57;
        this.COLOR_DARK = 0x260e04;
        this.balanceText = "";
        this.herdText = "";
        this.texts = [];//Queue for dialog text
        this.defaultTextStyle = {fontFamily: 'PressStart2P', fontSize: '16px'};
        this.turnInfoTextStyle = {fontFamily: 'PressStart2P', fontSize: '18px'};
        this.titleTextStyle = {fontFamily: 'PressStart2P', fontSize: '64px'};
        // Width of ui infection display
        this.infectionBarWidth = 100;
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
        this.dialogWindow.eventEmitter = eventsCenter;
        this.dialogWindow.createWindow(this);


        this.scoreboard = new ScoreBoard(this);
        this.scoreboard.createScoreboard();


        //Start bottom windows hidden
        this.toggleDialogWindow();

        this.setupListeners();
        this.events.on(Phaser.Scenes.CREATE, () => {
            //console.log('created');
            eventsCenter.on(gameSettings.EVENTS.UICREATED);
        });
        this.events.on(Phaser.Scenes.Events.SHUTDOWN, () => {
            this.removeListeners();
        });

        var FKey = this.input.keyboard.addKey('F');

        FKey.on('down', function () {

            if (this.scale.isFullscreen) {
                //button.setFrame(0);
                this.scale.stopFullscreen();
            } else {
                //button.setFrame(1);
                this.scale.startFullscreen();
            }

        }, this);

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
        eventsCenter.on(gameSettings.EVENTS.ANIMATEDIALOGFINISHED, this.advanceDialogWindowSequence, this);
        // eventsCenter.on(gameSettings.EVENTS.DIALOGFINISHED, this.closeDialogWindow, this);
        eventsCenter.on(gameSettings.EVENTS.PLAYERHERDUPDATED, this.updatePlayerInfoHerd, this);
        eventsCenter.on(gameSettings.EVENTS.PLAYERBALANCEUPDATED, this.updatePlayerInfoBalance, this);
        eventsCenter.on(gameSettings.EVENTS.INFECTIONLEVELUPDATED, this.updateInfectionLevel, this);

        /*
        Handle click events that might relevant to the ui

        this.input.on('pointerup', function(){
            // Advance scrolling text
            if (gameState.textScrolling === true){
                eventsCenter.emit(gameSettings.EVENTS.ADVANCEDIALOG);
            }
        }, this);*/
    }

    removeListeners() {

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
        if (this.playerInfoContainer.visible) {
            this.playerInfoContainer.visible = false;
            /*this.playerInfoBalance.visible = false;
            this.playerInfoHerd.visible = false;
            this.playerPortrait.visible = false;*/
        } else {
            this.playerInfoContainer.visible = true;
            /*this.playerInfoBalance.visible = true;
            this.playerInfoHerd.visible = true;
            this.playerPortrait.visible = true;*/
        }
    }

    advanceDialogWindowSequence() {
        // Dialog in progress, dump buffer
        if (this.dialogWindow.eventCounter > 0) {
            //console.log('Text skip ->' + this.texts.length);
            this.dialogWindow.timedEvent.remove();

            if (this.dialogWindow.text && this.dialogWindow.dialog) {
                let bufferText = this.dialogWindow.dialog.slice(
                    this.dialogWindow.eventCounter, this.dialogWindow.dialog.length
                ).join('');
                this.dialogWindow.text.text = this.dialogWindow.text.text + bufferText;
            }
            this.dialogWindow.eventCounter = 0;
        } else if (this.texts && this.texts.length > 0) {
            gameState.textScrolling = true;
            // Queued text is available
            //console.log('Text advance ->' + this.texts.length);
            //Set the text
            this.dialogWindow.setText(this, this.texts[0], true);
            // Remove it from queue
            this.texts.shift();

        } else if (this.texts.length === 0) {
            // Queue empty, hide window
            //console.log('Text finished');
            eventsCenter.emit(gameSettings.EVENTS.DIALOGFINISHED);
            gameState.textScrolling = false;

        }
    }

    /** Stop dialog and clear the window
     *
     */
    clearDialogWindow(){
        this.dialogWindow.eventCounter = 0;
        this.dialogWindow.dialog = '';
        this.dialogWindow.timedEvent.remove();
        this.dialogWindow.text.destroy();
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
        this.playerInfoBalance.setText(balance);
        Phaser.Display.Align.To.BottomLeft(
            this.playerInfoBalance, this.playerInfoTitle
        );

    }

    updateHerd(herdTotal) {
        this.playerInfoHerd.setText(herdTotal);
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
        this.gameTitle.y = (this.GAME_HEIGHT / 2) - (this.gameTitle.displayHeight / 2);
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
        this.turnDisplay.text = "Turn " +gameState.currentTurn;
        this.turnDisplay.x = this.playerInfoBackground.width / 2 - (this.turnDisplay.width /2);
        this.turnDisplay.y = this.playerInfoBackground.height / 2 - (this.turnDisplay.height /2);
        this.updateTitleDisplay("Turn " + gameState.currentTurn, function () {
            eventsCenter.emit(gameSettings.EVENTS.TURNSTART);
        }, this);
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
        this.playerInfoHerd.text = this.gameScene.player.herdTotal;
    }

    /** Update UI to show new player balance
     *
     */
    updatePlayerInfoBalance() {
        this.playerInfoBalance.text = this.gameScene.player.balance;
    }


    /**
     * Scoreboard with all player/AI totals
     */
    createPlayerInfo() {
        let board_width = this.scale.width;
        let board_height = 3 * 16;//this.dialogWindow.windowHeight;
        this.playerInfoContainer = this.add.container(0, 0);
        this.playerInfoBackground = this.add.rectangle(board_width / 2, board_height / 2,
            board_width, board_height, 0x000000, 0.4);

        /*
        graphics = this.add.graphics({x: 0, y: 0});
        this.scene.graphics.lineStyle(this.dialogWindow.borderThickness,
            this.dialogWindow.borderColor, this.dialogWindow.borderAlpha
        );
        this.scene.graphics.strokeRect(0, 0, board_width, board_height);*/

        this.playerInfoBalance = this.add.text(0, 1, this.balanceText, this.defaultTextStyle);
        this.playerInfoHerd = this.add.text(0, 22, this.herdText, this.defaultTextStyle);
        this.playerInfoHerd.setOrigin(0, 0);
        this.playerInfoBalance.setOrigin(0, 0);

        this.coinIcon = this.add.image(
            0,
            0,
            'coin',
            0
        ).setScale(0.75);

        this.cowIcon = this.add.image(
            0,
            0,
            'cow_1',
            12
        ).setScale(1.25);
        this.sickCowIcon = this.add.image(
            0,
            0,
            'cow_1',
            12
        ).setScale(1.25);
        this.sickCowIcon.setTint(0x00ff00);

        //let turnLabel = this.add.text(0, 0, " Turn ", this.turnInfoTextStyle);
        this.turnDisplay = this.add.text(0, 0, gameState.currentTurn, this.turnInfoTextStyle);

        // Infection

        //this.infectionTitle = this.add.text(0, 1, 'Infection', this.defaultTextStyle);
        this.infectionLevelBackground = this.add.rectangle(0, 0, 100, 16, 0xffffff, 1);
        this.infectionLevel = this.add.rectangle(0, 0, this.infectionBarWidth * this.getInfectionLevel() , 16, 0xff0000, 1);


        this.playerInfoContainer.add(this.playerInfoBackground);
        //this.playerInfoContainer.add(this.playerPortrait);
        this.playerInfoContainer.add(this.coinIcon);
        this.playerInfoContainer.add(this.cowIcon);
        this.playerInfoContainer.add(this.sickCowIcon);
        this.playerInfoContainer.add(this.playerInfoBalance);
        this.playerInfoContainer.add(this.playerInfoHerd);

        //this.playerInfoContainer.add(turnLabel);
        this.playerInfoContainer.add(this.turnDisplay);



        if (gameState.control_group){
            this.playerInfoContainer.add(this.infectionLevelBackground);
            this.playerInfoContainer.add(this.infectionLevel);
        }

        eventsCenter.emit(gameSettings.EVENTS.PLAYERBALANCEUPDATED);
        eventsCenter.emit(gameSettings.EVENTS.PLAYERHERDUPDATED);

        Phaser.Display.Align.In.RightCenter(
            this.infectionLevelBackground,
            this.playerInfoBackground,
            -10,0
        );

        Phaser.Display.Align.To.LeftCenter(
            this.sickCowIcon, this.infectionLevelBackground,
            10,0
        );
        Phaser.Display.Align.In.LeftCenter(
            this.infectionLevel, this.infectionLevelBackground, 0, 0
        );

        /*Phaser.Display.Align.In.TopCenter(
            turnLabel,
            this.playerInfoBackground,
            turnLabel.width / 2 * -1, turnLabel.height / 2 * -1
        );

        Phaser.Display.Align.In.TopCenter(
            this.turnDisplay,
            this.playerInfoBackground,
            this.turnDisplay.width /2 * -1, this.turnDisplay.height / 2 * -1
        );*/


        /*
        Phaser.Display.Align.In.TopLeft(
            this.playerPortrait,
            this.playerInfoBackground,
            this.playerPortrait.width / 2 * -1,0
        );
        Phaser.Display.Align.To.RightCenter(
            this.coinIcon, this.playerPortrait,
            10,0
        );

        Phaser.Display.Align.To.RightCenter(
            this.playerInfoBalance, this.coinIcon,
            10,0
        );

        Phaser.Display.Align.To.RightCenter(
            this.cowIcon, this.playerInfoBalance,
            10, this.cowIcon.height /2 * -1 + 5
        );
        Phaser.Display.Align.To.RightCenter(
            this.playerInfoHerd, this.cowIcon ,0,5
        );

        this.add.text(0, 0, " ", this.defaultTextStyle),
            turnLabel, this.turnDisplay,
        */
        let cellWidth = 16 * 3;
        let cellHeight = 16 * 3;
        this.infoCells = [
            this.coinIcon, this.playerInfoBalance, this.cowIcon, this.playerInfoHerd,
        ];
        Phaser.Actions.GridAlign(this.infoCells, {
            width: this.infoCells.length,
            height: 1,
            cellWidth: cellWidth,
            cellHeight: cellHeight,
            position: Phaser.Display.Align.CENTER,
            /* offset by half width / height of first cell
             */
            x: cellWidth / 2,
            y: cellHeight / 2
        });


        //this.playerInfoContainer.x = board_width/2;
        //this.playerInfoContainer.y = board_height /2;

        if (gameState.control_group === false) {
            this.sickCowIcon.visible = false;
            this.infectionLevel.visible = false;
            this.infectionLevelBackground.visible = false;
        }

        this.togglePlayerWindow();

    }

    createInfectionInfo() {
        this.infectionInfoContainer = this.add.container(
            this.scale.width / 2, this.scale.height / 2
        );
        this.infectionInfoBackground = this.add.rectangle(0, 0, 192, 144, 0x000000, 0.4);
        this.infectionTitle = this.add.text(0, 1, 'Total Infection', this.defaultTextStyle);
        this.infectionLevelBackground = this.add.rectangle(0, 0, 100, 16, 0xffffff, 1);
        this.infectionLevel = this.add.rectangle(0, 0, this.infectionBarWidth * this.getInfectionLevel(), 16, 0xff0000, 1);
        /*this.infectionIcon = this.add.image(
            0,
            0,
            'cow_1',
            12
        ).setScale(2);*/
        this.infectionInfoContainer.add(this.infectionInfoBackground);
        this.infectionInfoContainer.add(this.infectionTitle);
        //this.infectionInfoContainer.add(this.infectionIcon);
        this.infectionInfoContainer.add(this.infectionLevelBackground);
        this.infectionInfoContainer.add(this.infectionLevel);



        /*
        Phaser.Display.Align.In.TopCenter(
            this.infectionTitle, this.infectionInfoBackground, 0, -10
        );

        Phaser.Display.Align.To.BottomCenter(
            this.infectionIcon, this.infectionTitle, 0, 0
        );

        Phaser.Display.Align.To.BottomCenter(
            this.infectionLevelBackground, this.infectionIcon, 0, 20
        );
        Phaser.Display.Align.In.LeftCenter(
            this.infectionLevel, this.infectionLevelBackground, 0, 0
        );*/

    }

    /** When cows are cured or infections increase, change the bar in the UI
     *
     */
    updateInfectionLevel() {
        this.infectionLevel.width = this.infectionBarWidth * this.getInfectionLevel();
    }

    getInfectionLevel() {
        console.log(gameState.infectionTotal + '::' + gameSettings.gameRules.startHerdSize);
        return gameState.infectionTotal / gameSettings.gameRules.startHerdSize;
    }

}
