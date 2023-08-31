/*jshint esversion: 8 */
import {gameSettings} from "../cst.js";
import eventsCenter from "./EventsCenter.js";
import ScoreBoard from "../ui/ScoreBoard.js";
import HelpScreen from "../ui/HelpScreen.js";
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

    async turnSummaryScreen(titleText, income, infectedCows, oldInfectionTotal, newInfectionTotal) {
        let borderThickness = 3;
        let borderColor = 0x907748;
        let borderAlpha = 1;
        let windowAlpha = 0.8;
        let windowColor = 0x000000;
        let titleTextStyle = {fontFamily: 'PressStart2P', fontSize: '24px'};
        let defaultTextStyle = {fontFamily: 'PressStart2P', fontSize: '14px'};
        console.log('turn end');

        // set up modal
        let board_width = this.GAME_WIDTH - (this.GAME_WIDTH / 6);
        let board_height = this.GAME_HEIGHT - (this.GAME_HEIGHT / 6);
        let rectX = this.GAME_WIDTH / 2 - (board_width / 2);
        let rectY = this.GAME_HEIGHT / 2 - (board_height / 2);

        let rectCentreX = this.GAME_WIDTH / 2;
        let rectCentreY = this.GAME_HEIGHT / 2;

        //modalEdge.depth = 3;
        //modalBackground.depth = 3;

        let incomeTitle = this.add.text(
            rectCentreX, this.GAME_HEIGHT / 6,
            'Income',
            titleTextStyle
        );

        Phaser.Display.Align.To.BottomCenter(
            incomeTitle, titleText, 0, 100
        );

        // milk bottles
        let milkBottles = [];
        for (let i = 0; i < income; i++) {
            let bottle = this.add.image(rectCentreX, 0, 'milk_bottle').setScale(1.5);
            milkBottles.push(bottle);

        }

        let cellWidth = 16 * 2;
        let cellHeight = 16 * 2;

        Phaser.Actions.GridAlign(milkBottles, {
            width: milkBottles.length,
            height: 1,
            cellWidth: cellWidth,
            cellHeight: cellHeight,
            position: Phaser.Display.Align.CENTER,
            x: incomeTitle.x, //rectCentreX - ((cellWidth /2) * milkBottles.length / 2),
            y: incomeTitle.y + 50
        });

        let incomeText = this.add.text(
            rectCentreX, this.GAME_HEIGHT / 6,
            'You made ' + income + ' coins from milk',
            defaultTextStyle
        );
        let infectionReport = '';
        if (infectedCows ==0){
            infectionReport = "All cows are healthy"
        } else{
            infectionReport= infectedCows+' infected cows produced no milk';
        }
        let infectionText = this.add.text(
            rectCentreX, this.GAME_HEIGHT / 6,
            infectionReport,
            defaultTextStyle
        );
        Phaser.Display.Align.To.BottomCenter(
            incomeText, incomeTitle, 0, 50
        );
        Phaser.Display.Align.To.BottomCenter(
            infectionText, incomeText, 0, 10
        );

        let infectionTitle = this.add.text(
            rectCentreX, this.GAME_HEIGHT / 6,
            'Total Infection',
            titleTextStyle
        );
        Phaser.Display.Align.To.BottomCenter(
            infectionTitle, infectionText, 0, 100
        );

        let infectionLevelBackground = this.add.rectangle(0, 0, 100, 16, 0xffffff, 1);
        let infectionLevel = this.add.rectangle(
            0, 0,
            this.infectionBarWidth * (oldInfectionTotal / gameSettings.gameRules.startHerdSize),
            16, 0xff0000, 1);

        Phaser.Display.Align.To.BottomCenter(
            infectionLevelBackground, infectionTitle, 0, 50
        );
        Phaser.Display.Align.To.LeftCenter(
            infectionLevel, infectionLevelBackground, 0, 0
        );

        this.tweens.add({
            targets: infectionLevel,
            width: {
                value: this.infectionBarWidth * (newInfectionTotal / gameSettings.gameRules.startHerdSize),
                duration: 1000,
                ease: 'Power1'
            },

        });
        await this.sleep(5000);
        this.tweens.add({
            targets: milkBottles.concat([
                infectionLevel,
                infectionLevelBackground,
                incomeText,
                incomeTitle,
                infectionTitle,
                infectionText,
            ]),
            alpha: 0,
            ease: 'Cubic.easeOut',
            duration: 1000,
            onComplete: function () {
                // Destroy
                infectionLevel.destroy();
                infectionLevelBackground.destroy();
                incomeText.destroy();
                incomeTitle.destroy();
                infectionTitle.destroy();
                infectionText.destroy();
                milkBottles.forEach(function (bottle) {
                    bottle.destroy();
                });
            }

        });

        await this.sleep(1200);
        return true;

    }

    // The info modal is a combined background used for:
    // Help screen, turn end summaries and the scoreboard
    createInfoModal() {
        this.infoModal_width = this.GAME_WIDTH - (this.GAME_WIDTH / 12);
        this.infoModal_height = this.GAME_HEIGHT - (this.GAME_HEIGHT / 10);
        this.modalRectX = this.GAME_WIDTH / 2 - (this.infoModal_width / 2);
        this.modalRectY = this.GAME_HEIGHT / 2 - (this.infoModal_height / 2);
        //this.modalRectCentreX = this.scale.width / 2;
        //this.modalRectCentreY = this.scale.height / 2;
        // Nicked from the plugin
        let graphics = this.add.graphics();
        graphics.lineStyle(
            this.borderThickness,
            this.borderColor,
            this.borderAlpha
        );
        this.infoModalEdge = graphics.strokeRect(
            this.modalRectX, this.modalRectY, this.infoModal_width, this.infoModal_height
        );
        graphics.fillStyle(
            this.windowColor, this.windowAlpha
        );
        this.infoModalBackground = graphics.fillRect(
            this.modalRectX + 1, this.modalRectY + 1,
            this.infoModal_width - 1, this.infoModal_height - 1
        );

        // Screen title


        this.defaultTextStyle = {fontFamily: 'PressStart2P', fontSize: '16px'};

        this.infoModalBackground.depth = 3;
        this.infoModalEdge.depth = 3;

        // Hidden by default
        this.infoModalBackground.visible = false;
        this.infoModalEdge.visisble = false;
    }

    /*
    showInfoModal(){
        this.infoModalBackground.visible = true;
        this.infoModalEdge.visisble = true;
    }

    hideInfoModal(){
        this.infoModalBackground.visible = false;
        this.infoModalEdge.visisble = false;
    }*/

    create() {
        this.GAME_WIDTH = this.scale.width;
        this.GAME_HEIGHT = this.scale.height;
        this.gameScene = this.scene.get(gameSettings.SCENENAMES.GAMESCENENAME);
        this.createTitle();
        // Set up main dialog window on the bottom of the screen
        this.dialogWindow.eventEmitter = eventsCenter;
        this.dialogWindow.createWindow(this);

        // this.createInfoModal();

        this.scoreboard = new ScoreBoard(this);
        this.scoreboard.createScoreboard();

        // Help screen overlay
        this.helpScreen = new HelpScreen(this);
        this.helpScreen.createHelpScreen(
            this.modalRectX, this.modalRectY
        );

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
            if (gameState.infection_visible == 1) {
                this.hideInfectionInformation();
            }
        } else {
            this.playerInfoContainer.visible = true;
            if (gameState.infection_visible == 1) {
                this.showInfectionInformation();
            }

        }
    }

    async toggleHelpScreen() {
        //
        this.helpScreen.toggleHelpScreen();
        await this.sleep(500);
        return true;
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
    clearDialogWindow() {
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
        this.turnDisplay.text = "Turn " + gameState.currentTurn;
        this.turnDisplay.x = this.playerInfoBackground.width / 2 - (this.turnDisplay.width / 2);
        this.turnDisplay.y = this.playerInfoBackground.height / 2 - (this.turnDisplay.height / 2);
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
        this.graphics.lineStyle(this.dialogWindow.borderThickness,
            this.dialogWindow.borderColor, this.dialogWindow.borderAlpha
        );
        this.graphics.strokeRect(0, 0, board_width, board_height);*/

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
        this.helpIcon = this.add.image(
            0,
            0,
            'help_icon',
            0
        ).setScale(1).setInteractive();

        // Add click event to toggle help
        this.helpIcon.on('pointerdown', function () {
            this.toggleHelpScreen();
        }.bind(this));
        // Infection

        //this.infectionTitle = this.add.text(0, 1, 'Infection', this.defaultTextStyle);
        this.infectionLevelBackground = this.add.rectangle(0, 0, 100, 16, 0xffffff, 1);
        this.infectionLevel = this.add.rectangle(0, 0, this.infectionBarWidth * this.getInfectionLevel(), 16, 0xff0000, 1);


        this.playerInfoContainer.add(this.playerInfoBackground);
        //this.playerInfoContainer.add(this.playerPortrait);
        this.playerInfoContainer.add(this.coinIcon);
        this.playerInfoContainer.add(this.cowIcon);
        this.playerInfoContainer.add(this.sickCowIcon);
        this.playerInfoContainer.add(this.playerInfoBalance);
        this.playerInfoContainer.add(this.playerInfoHerd);
        this.playerInfoContainer.add(this.helpIcon);

        //this.playerInfoContainer.add(turnLabel);
        this.playerInfoContainer.add(this.turnDisplay);


        //console.log('Control: '+gameState.control_group + ' :: '+gameState.gamesPlayed + ' ' +(gameState.control_group == 0 && gameState.gamesPlayed == 0));
        if (gameState.infection_visible == 1) {
            //console.log('show');
            this.playerInfoContainer.add(this.infectionLevelBackground);
            this.playerInfoContainer.add(this.infectionLevel);
        }

        eventsCenter.emit(gameSettings.EVENTS.PLAYERBALANCEUPDATED);
        eventsCenter.emit(gameSettings.EVENTS.PLAYERHERDUPDATED);

        Phaser.Display.Align.In.RightCenter(
            this.infectionLevelBackground,
            this.playerInfoBackground,
            -50, 0
        );

        Phaser.Display.Align.In.RightCenter(
            this.helpIcon,
            this.playerInfoBackground,
            0, 0
        );

        Phaser.Display.Align.To.LeftCenter(
            this.sickCowIcon, this.infectionLevelBackground,
            10, 0
        );
        Phaser.Display.Align.In.LeftCenter(
            this.infectionLevel, this.infectionLevelBackground, 0, 0
        );


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


        this.sickCowIcon.visible = false;
        this.infectionLevel.visible = false;
        this.infectionLevelBackground.visible = false;

        this.togglePlayerWindow();

    }

    /** Show infection info on top if control
     */
    showInfectionInformation() {
        this.sickCowIcon.visible = true;
        this.infectionLevel.visible = true;
        this.infectionLevelBackground.visible = true;
    }

    hideInfectionInformation() {
        this.sickCowIcon.visible = false;
        this.infectionLevel.visible = false;
        this.infectionLevelBackground.visible = false;
    }

    createInfectionInfo() {
        this.infectionInfoContainer = this.add.container(
            this.scale.width / 2, this.scale.height / 2
        );
        this.infectionInfoBackground = this.add.rectangle(0, 0, 192, 144, 0x000000, 0.4);
        this.infectionTitle = this.add.text(0, 1, 'Total Infection', this.defaultTextStyle);
        this.infectionLevelBackground = this.add.rectangle(0, 0, 100, 16, 0xffffff, 1);
        this.infectionLevel = this.add.rectangle(0, 0, this.infectionBarWidth * this.getInfectionLevel(), 16, 0xff0000, 1);

        this.infectionInfoContainer.add(this.infectionInfoBackground);
        this.infectionInfoContainer.add(this.infectionTitle);
        //this.infectionInfoContainer.add(this.infectionIcon);
        this.infectionInfoContainer.add(this.infectionLevelBackground);
        this.infectionInfoContainer.add(this.infectionLevel);


    }

    /** When cows are cured or infections increase, change the bar in the UI
     *
     */
    updateInfectionLevel() {
        this.infectionLevel.width = this.infectionBarWidth * this.getInfectionLevel();
    }

    getInfectionLevel() {
        //console.log(gameState.infectionTotal + '::' + gameSettings.gameRules.startHerdSize);
        return gameState.infectionTotal / gameSettings.gameRules.startHerdSize;
    }

}
