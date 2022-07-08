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
            onboards: ["Click on the hospital to join BoviFree (Lasts one turn)\n\nAll your cows will be cured for £1 + £1 per infected cow, and you'll be certified Boviflu free.\nOr touch your house to skip."],
            start: ["BFree phase"],
            yes: ["Cows have been cured. Your herd is disease free"],
            no: ["No infection cured.\nYour herd may still have disease"]
        };
        this.highlights = {
            hospital:{
                colour:0x6666ff,
                alpha: 0.6,
            },
            playerPen:{
                colour:0x6666ff,
                alpha: 0.6,
            }
        };


    }

    preload() {
        //this.load.scenePlugin('rexuiplugin', '/static/assets/game/plugins/vendor/rexuiplugin.min.js', 'rexUI', 'rexUI');
    }

    create() {
        this.gameScene = this.scene.get(gameSettings.SCENENAMES.GAMESCENENAME);
        this.uiScene = this.scene.get(gameSettings.SCENENAMES.UISCENENAME);
        this.addListeners();
        this.createHighlightGraphics();
    }

    update(times, delta) {
        //this.gameScene.moveCows(delta);
    }

    /**
     * Create simple graphics to highlight touchable parts of the screen
     * Start hidden by default
     */
    createHighlightGraphics() {
        this.hospitalHighlight = this.add.graphics();
        //this.graphics.lineStyle(4, 0xff00ff, 1);
        let tileSize = this.gameScene.BOARD_TILE_SIZE;
        let hCoords = gameSettings.gameboardInfo.hospital.extent[0];
        let hSize = gameSettings.gameboardInfo.hospital.extent[1];
        this.hospitalHighlight.fillStyle(
            this.highlights.hospital.colour, this.highlights.hospital.alpha
        );
        this.hospitalHighlight.fillRect(
            hCoords[0] * tileSize, hCoords[1] * tileSize,
            (hSize[0] + 1) * tileSize, (hSize[1] + 1) * tileSize
        );
        this.playerHouseHighlight = this.add.graphics();

        this.playerHouseHighlight.fillStyle(
            this.highlights.playerPen.colour, this.highlights.playerPen.alpha
        );

        let penCoords = gameSettings.gameboardInfo.playerHouse[0];
        let penSize = gameSettings.gameboardInfo.playerHouse[1];
        this.playerHouseHighlight.fillRect(
            penCoords[0] * tileSize, penCoords[1] * tileSize,
            (penSize[0] + 1) * tileSize, (penSize[1] + 1) * tileSize
        );

        //this.hospitalHighlight.visible = false;
    /*
        //YOYO EFFECT ON BORDER
        let tween = this.tweens.add({
            targets: hospitalHighlight,
            alpha: 0.2,
            yoyo: true,
            repeat: -1,
            ease: 'Sine.easeInOut'
        });*/

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
        let movePromises = [];
        for (let c = 0; c < myCows.length; c++) {
            movePromises.push(this.sendCowToHospital(myCows[c], 50, 50 *c ))
        }
        // todo Restore camera to default position
        await Promise.all(movePromises);
        return true;

    }

    /**
     * Animation to... send cow to hospital
     */
    async sendCowToHospital(cow, cowSpeed, startDelay) {
        let result = await cow.calculateMovePath(
            this.gameScene.gameboardInfo.hospital.door[0],
            this.gameScene.gameboardInfo.hospital.door[1]
        );
        if (result) {
            // Sleep for startDelay, then begin moving
            await new Promise(resolve => setTimeout(resolve, startDelay));
            //Move the Cow
            let backHome = cow.movePath.slice().reverse();
            result = await cow.moveCowAlongPath(cowSpeed);
            if (result) {
                // Power Up!
                result = await cow.innoculationAnimation();
                if (result) {
                    // Back to pen using reverse of calculated path
                    cow.movePath = backHome;
                    await cow.moveCowAlongPath(cowSpeed);
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
        await this.AIFarmersJoinBFree();
        this.uiScene.addTextAndStartDialog(this.bFreeDialogTexts.yes);

        eventsCenter.once(gameSettings.EVENTS.DIALOGFINISHED, function () {
            eventsCenter.emit(gameSettings.EVENTS.BFREEPHASEEND);
        }, this);
    }

    async AIFarmersJoinBFree() {
        let farmers = this.gameScene.AIFarmers;
        let innoculationPromises = [];
        for (let f = 0; f < farmers.length; f++) {
            if (this.scheme_choice(farmers[f]) === true) {
                if (gameSettings.DEBUG) {
                    console.log(farmers[f].name + ' joined scheme');
                }
                this.joinBFree(farmers[f]);
                innoculationPromises.push(this.innoculationAnimation(farmers[f]));
            }
        }
        await Promise.all(innoculationPromises);
        return true;
    }

    /** Send a record of the bfree join to the log api
     *
     * @param farmerA farmer joining the scheme, player or AI
     * @param description event description
     */
    logBFreeTransaction(farmerA, description) {
        let messageProps = {
            farmerA: farmerA.name,
            description: description
        };
        messageProps.eventType = gameSettings.TRANSACTIONEVENTTYPES.JoinBFree;
        this.gameScene.logTransaction(messageProps);
    }

    joinBFree(farmer) {
        let totalCost = gameSettings.gameRules.bfreeJoinCost + farmer.infections;
        farmer.balance -= totalCost;
        // Remove infection from cattle
        this.gameScene.gameState.infectionTotal -= farmer.infections;
        farmer.setBFree(true);
        // Update the scoreboard
        this.uiScene.scoreboard.updateScoreboardCell(
            farmer.slug, this.uiScene.scoreboard.cellKeys.infectedCell, 0
        );
        this.logBFreeTransaction(
            farmer,
            farmer.name + " joins BFree scheme  and pays " + totalCost
        );
        eventsCenter.emit(gameSettings.EVENTS.BFREEJOINED);
    }

    /**
     * Decide if farmer joins the bfree scheme this turn.
     *
     * Now based on Beta rules with thresholds
     *
     * @param farmer
     * @return {boolean}
     */
    scheme_choice(farmer) {
        if (
            (farmer.infections >= farmer.threshold.local) ||
            (this.gameScene.gameState.totalInfections >= farmer.threshold.global)
        ) {
            return true;
        }
        return false;
    }

    joinBFreeNo() {
        console.log("Not joining Bovi Free");
        this.gameScene.setIsGameBoardActive(false);
        eventsCenter.off(gameSettings.EVENTS.HOSPITALTOUCHED, this.joinBFreeYes, this);
        this.uiScene.addTextAndStartDialog(this.bFreeDialogTexts.no);

        eventsCenter.once(gameSettings.EVENTS.DIALOGFINISHED, async function () {
            await this.AIFarmersJoinBFree();
            eventsCenter.emit(gameSettings.EVENTS.BFREEPHASEEND);
        }, this);
    }

    endPhase() {
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
