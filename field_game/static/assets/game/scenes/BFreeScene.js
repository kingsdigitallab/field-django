/*jshint esversion: 8 */
import {gameSettings} from "../cst.js";
import eventsCenter from "./EventsCenter.js";

export default class BFreeScene extends Phaser.Scene {
    constructor() {
        super(gameSettings.SCENENAMES.BFREESCENENAME);
        this.bFreeDialogTitles = {
            start: 'Join BoviFree?',
            yes: 'Bovifree joined!',
            no: 'Bovifree not joined!',
        };
        this.bFreeDialogTexts = {
            onboards: ["Click on the hospital to join BoviFree -£40\n\nAll your cows will be cured, and fetch a higher price in trading.  (Lasts one turn)", "Or touch your pen to pass this turn \n\n Your cows will be worth less, and infections will grow."],
            start: ["BFree phase"],
            yes: ["Cows have been cured.","Your herd is disease free"],
            no: ["No infection cured.", "Your herd may still have disease"]
        };

    }

    preload() {
        //this.load.scenePlugin('rexuiplugin', '/static/assets/game/plugins/vendor/rexuiplugin.min.js', 'rexUI', 'rexUI');
    }

    create() {
        this.gameScene = this.scene.get(gameSettings.SCENENAMES.GAMESCENENAME);
        this.uiScene = this.scene.get(gameSettings.SCENENAMES.UISCENENAME);
        this.addListeners();
        //this.bFreePhase();
    }

    update(times, delta) {
        //this.gameScene.moveCows(delta);
    }

    /**
     *  Ask player if they wish to join the Bovifree scheme
     *  If so, set cows to bovifree and deduct fee
     */
    async bFreePhase() {
        console.log('BFree phase start');
        // Start text and onboarding if enabled
        if (this.gameScene.gameState.isOnBoarding) {
            this.uiScene.addTextAndStartDialog(this.bFreeDialogTexts.onboards);

        } else {
            this.uiScene.addTextAndStartDialog(this.bFreeDialogTexts.start);

        }
        eventsCenter.once(gameSettings.EVENTS.DIALOGFINISHED, function () {
            this.gameScene.setIsGameBoardActive(true);
            eventsCenter.once(gameSettings.EVENTS.HOSPITALTOUCHED, this.joinBFreeYes, this);
            eventsCenter.once(gameSettings.EVENTS.PLAYERPENTOUCHED, this.joinBFreeNo, this);
        }, this);
        //this.innoculationAnimation(this.gameScene.player);


    }

    addListeners() {
        eventsCenter.on(gameSettings.EVENTS.BFREEPHASEEND, this.endPhase, this);

    }

    /**
     * Our super cool animated sequence to show cows
     * joining the scheme
     * @param farmer
     */
    async innoculationAnimation(farmer) {
        // todo Zoom in a bit on the hospital

        // Move cows one by one there and back with animation
        let myCows = farmer.getCows(this.gameScene.herd);
        for (let c = 0; c < myCows.length; c++) {
           await this.sendCowToHospital(myCows[c], 50);
        }
        // todo Restore camera to default position
        return true;

    }

    /**
     * Animation to... send cow to hospital
     */
    async sendCowToHospital(cow, cowSpeed) {

        // todo move to cow as function

        let result = await cow.calculateMovePath(
            this.gameScene.gameboardInfo.hospital.door[0],
            this.gameScene.gameboardInfo.hospital.door[1]
        );
        if (result) {
            //Move the Cow
            result = await cow.moveCowAlongPath(cowSpeed);
            if (result) {
                // Power Up!
                result = await cow.innoculationAnimation();
                if (result) {
                    // Back to
                    result = await cow.owner.sendCowToPen(cow);
                    return true;
                }

            }
        } else {
            console.log("Error: No path for cow!");
        }
        console.log(result);
    }

    createButton(scene, text) {
        return scene.rexUI.add.label({
            width: 40,
            height: 40,
            background: scene.rexUI.add.roundRectangle(0, 0, 0, 0, 20, COLOR_LIGHT),
            text: scene.add.text(0, 0, text, {
                fontSize: 18,
                fontFamily: 'PressStart2P'
            }),
            space: {
                left: 10,
                right: 10,
            },
            align: 'center',
            name: text
        });
    }

    createLabel(scene, text) {
        return scene.rexUI.add.label({
            background: scene.rexUI.add.roundRectangle(0, 0, 0, 0, 20, 0x5e92f3),
            text: scene.add.text(0, 0, text, {
                fontSize: '24px'
            }),

            space: {
                left: 10,
                right: 10,
                top: 10,
                bottom: 10
            }
        });
    }

    async joinBFreeYes() {
        // Remove no listener
        eventsCenter.off(gameSettings.EVENTS.PLAYERPENTOUCHED, this.joinBFreeNo, this);
        this.gameScene.setIsGameBoardActive(false);
        // Subtract the cost
        console.log("Joining Bovi Free");
        this.joinBFree(this.gameScene.player);
        await this.innoculationAnimation(this.gameScene.player);
        this.AIFarmersJoinBFree();
        this.uiScene.addTextAndStartDialog(this.bFreeDialogTexts.yes);

        eventsCenter.once(gameSettings.EVENTS.DIALOGFINISHED, function () {
            eventsCenter.emit(gameSettings.EVENTS.BFREEPHASEEND);
        }, this);
    }

    AIFarmersJoinBFree(){
        let farmers = this.gameScene.AIFarmers;
        for (let f=0;f<farmers.length; f++){
            if (this.scheme_choice(farmers[f]) === true){
                if (gameSettings.DEBUG){
                    console.log(farmers[f].name +' joined scheme');
                }
                this.joinBFree(farmers[f]);
            }
        }
    }

    joinBFree(farmer){
        farmer.balance -= gameSettings.gameRules.bfreeJoinCost;
        // Remove infection from cattle
        farmer.setBFree(true);
        // Update the scoreboard
        this.uiScene.scoreboard.updateScoreboardCell(
            farmer.slug, this.uiScene.scoreboard.cellKeys.infectedCell, 0
        );
        eventsCenter.emit(gameSettings.EVENTS.BFREEJOINED);
    }

    scheme_choice(farmer){
        let joinChance = farmer.timeSinceLastSale / gameSettings.gameRules.bfreeTrigger;
        if (Math.random() <= joinChance) {
                    return true;
        }
        return false;
    }

    joinBFreeNo() {
        console.log("Not joining Bovi Free");
        this.gameScene.setIsGameBoardActive(false);
        eventsCenter.off(gameSettings.EVENTS.HOSPITALTOUCHED, this.joinBFreeYes, this);
        this.uiScene.addTextAndStartDialog(this.bFreeDialogTexts.no);

        eventsCenter.once(gameSettings.EVENTS.DIALOGFINISHED, function () {
            this.AIFarmersJoinBFree();
            eventsCenter.emit(gameSettings.EVENTS.BFREEPHASEEND);
        }, this);
    }

    endPhase(){
        console.log("Joining Bovi Free COMPLETE");
        this.scene.get(gameSettings.SCENENAMES.TRADINGSCENENAME).tradingPhase();
    }



    /*
    DEPRECATED
    createBoviDialog() {

        this.boviDialog = this.createYesNoDialog(
            this.bFreeDialogTitles.start,
            this.bFreeDialogTexts.start,
            [this.createLabel(this, 'Yes'),
                this.createLabel(this, 'No')]
        );
        let scene = this;

        this.boviDialog
            .on('button.click', function (button, groupName, index) {
                let decision = button.text;
                scene.joinBFree.apply(scene, [decision]);
                // Todo info before nicer close
                //this.boviDialog.visible = false;
            })
            .on('button.over', function (button, groupName, index) {
                button.getElement('background').setStrokeStyle(1, 0xffffff);
            })
            .on('button.out', function (button, groupName, index) {
                button.getElement('background').setStrokeStyle();
            });
    }

    createYesNoDialog(title, text, buttons) {
        const w = this.scale.width;
        const h = this.scale.height;
        let dialog = this.rexUI.add.dialog({
            background: this.rexUI.add.roundRectangle(0, 0, 100, 100, 20, 0x1565c0),

            title: this.rexUI.add.label({
                background: this.rexUI.add.roundRectangle(0, 0, 100, 40, 20, 0x003c8f),
                text: this.add.text(0, 0, title, {
                    fontSize: '24px'
                }),
                space: {
                    left: 15,
                    right: 15,
                    top: 10,
                    bottom: 10
                }
            }),
            anchor: {

                centerX: 'center',
                centerY: 'center',

            },

            content: this.add.text(0, 0, text, {
                fontSize: '18px'
            }),

            actions: [this.createLabel(this, 'Yes'),
                this.createLabel(this, 'No')],

            space: {
                title: 25,
                content: 25,
                action: 15,

                left: 20,
                right: 20,
                top: 20,
                bottom: 20,
            },

            align: {
                actions: 'right', // 'center'|'left'|'right'
            },

            expand: {
                content: false, // Content is a pure text object
            }
        })
            .layout()
            // .drawBounds(this.add.graphics(), 0xff0000)
            .popUp(1000);

        return dialog;
    }*/


}
