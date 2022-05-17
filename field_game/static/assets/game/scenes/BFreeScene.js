/*jshint esversion: 8 */
import {GAMESCENENAME, UISCENENAME} from "../cst.js";

export default class BFreeScene extends Phaser.Scene {
    constructor() {
        super('BFreeScene');
        this.bFreeDialogTitles = {
            start: 'Join BoviFree?',
            yes: 'Bovifree joined!',
            no: 'Bovifree not joined!',
        };
        this.bFreeDialogTexts = {
            onboards: ["Click on the hospital to join BoviFree -£40\n\nAll your cows will be cured, and fetch a higher price in trading.  (Lasts one turn)", "Or touch your house to pass this turn \n\n Your cows will be worth less, and infections will grow."],
            start: "BFree phase",
            yes: "Cows have been cured.  Your herd is disease free",
            no: "No infection cured. Your herd may still have disease"
        };
        this.innoculationAnimationStart = false;


    }

    preload() {
        this.load.scenePlugin('rexuiplugin', '/static/assets/game/plugins/vendor/rexuiplugin.min.js', 'rexUI', 'rexUI');
    }

    create() {
        this.gameScene = this.scene.get(GAMESCENENAME);
        this.uiScene = this.scene.get(UISCENENAME);
        this.bFreePhase();
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
        /*if (this.gameScene.gameState.isOnBoarding) {
            this.uiScene.addDialogText(this.bFreeDialogTexts.onboards);
            eventsCenter.emit(EVENTS.ADVANCE);
        } else {
            this.uiScene.addDialogText(this.bFreeDialogTexts.start);
            eventsCenter.emit(EVENTS.ADVANCE);
        }*/



        this.innoculationAnimation(this.gameScene.player);


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
    }

    /**
     * Animation to... send cow to hospital
     */
    async sendCowToHospital(cow, cowSpeed) {

        // todo move to cow as function

        let result = await cow.calculateMovePath(
            this.gameScene.gameboardInfo.hospitalDoor[0],
            this.gameScene.gameboardInfo.hospitalDoor[1]
        );
        if (result) {
            //Move the Cow
            result = await cow.moveCowAlongPath(cowSpeed);
            if (result) {
                // Power Up!
                result = await cow.innoculationAnimation();
                if (result){
                    // Back to
                    result = await cow.owner.sendCowToPen(cow);
                }
                return true;
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
            // width: 40,
            // height: 40,

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

    joinBFree(decision) {
        let titleText = "";
        let contentText = "";
        if (decision === "Yes" && this.gameScene) {
            // Subtract the cost
            console.log("Joining Bovi Free");

            this.gameScene.player.balance -= this.gameScene.gameRules.bfreeJoinCost;
            // Remove infection from cattle
            this.gameScene.player.setBFree(true);
            titleText = this.bFreeDialogTitles.yes;
            contentText = this.bFreeDialogTexts.yes;
        } else {
            console.log("Not joining Bovi Free");
            titleText = this.bFreeDialogTitles.no;
        }
        this.boviDialog.visible = false;
        this.innoculationAnimation(this.gameScene.player);
    }

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
    }


}
