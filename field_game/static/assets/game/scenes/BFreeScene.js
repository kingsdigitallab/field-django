/*jshint esversion: 6 */
import {GAMESCENENAME, UISCENENAME, BFREESCENENAME, TRADINGSCENENAME} from "../cst.js";

export default class BFreeScene extends Phaser.Scene {
    constructor() {
        super('BFreeScene');
        this.bFreeDialogTitles = {
            start: 'Join BoviFree?',
            yes: 'Bovifree joined!',
            no: 'Bovifree not joined!',
        };
        this.bFreeDialogTexts = {
            start: '£40 to innoculate your herd this turn',
            yes: " cows have been cured.  Your herd is disease free",
            no: "No infection cured. Your herd may still have disease"
        };



    }

    preload() {
        this.load.scenePlugin('rexuiplugin', '/static/assets/game/plugins/rexuiplugin.min.js', 'rexUI', 'rexUI');
    }

    create() {
        this.gameScene=this.scene.get(GAMESCENENAME);
        console.log(this.scene);
        this.bFreePhase();
    }

    /**
     *  Ask player if they wish to join the Bovifree scheme
     *  If so, set cows to bovifree and deduct fee
     */
    bFreePhase() {
        this.createBoviDialog();
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

        console.log(gameScene);
        if (decision === "Yes" && gameScene) {
            // Subtract the cost
            console.log("Joining Bovi Free");

            this.gameScene.player.balance -= this.gameScene.gameRules.bfreeJoinCost;
            // Remove infection from cattle
            this.gameScene.setBFree(true);
            this.boviDialog.title.text = this.bFreeDialogTitles.yes;
        } else{
            this.boviDialog.title.text = this.bFreeDialogTitles.no;
        }

    }

    createBoviDialog() {

        this.boviDialog = this.createDialog(
            this.bFreeDialogTitles.start,
            this.bFreeDialogTexts.start,
            [this.createLabel(this, 'Yes'),
                this.createLabel(this, 'No')]
        );
        let scene=this;

        this.boviDialog
            .on('button.click', function (button, groupName, index) {
                let decision = button.text;
                scene.joinBFree.apply(scene,[decision]);
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

    createDialog(title, text, buttons) {
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
                fontSize: '24px'
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

    createButton(scene, text) {
        return scene.rexUI.add.label({
            width: 40,
            height: 40,
            background: scene.rexUI.add.roundRectangle(0, 0, 0, 0, 20, this.COLOR_LIGHT),
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
}
