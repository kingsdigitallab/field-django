/*jshint esversion: 8 */
import {gameSettings, States} from "../cst.js";
import {gameState} from '../GameState.js';

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
            onboards: ["Tap the hospital to heal your sick cows (costs £5) or tap your house to skip\n\n"],
            start: ["BFree phase"],
            yes: ["Cows have been cured. Your herd is disease free"],
            no: ["Your herd may still have disease"]
        };
        this.highlights = {
            hospital: {
                colour: 0xffff00,
                alpha: 0.75,
            },
            playerHouse: {
                colour: 0xffff00,
                alpha: 0.75,
            }
        };


    }

    preload() {
        //this.load.scenePlugin('rexuiplugin', '/static/assets/game/plugins/vendor/rexuiplugin.min.js', 'rexUI', 'rexUI');
    }

    create() {
        this.gameScene = this.scene.get(gameSettings.SCENENAMES.GAMESCENENAME);
        this.uiScene = this.scene.get(gameSettings.SCENENAMES.UISCENENAME);
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

        //this.graphics.lineStyle(4, 0xff00ff, 1);
        let tileSize = this.gameScene.BOARD_TILE_SIZE;
        let hCoords = gameSettings.gameboardInfo.hospital.extent[0];
        let hSize = gameSettings.gameboardInfo.hospital.extent[1];
        let houseCoords = gameSettings.gameboardInfo.playerHouse[0];
        let houseSize = gameSettings.gameboardInfo.playerHouse[1];

        this.hospitalSprite = this.physics.add.sprite(
            hCoords[0] * tileSize + ((hSize[0] + 1) * tileSize / 2),
            hCoords[1] * tileSize + ((hSize[1] + 1) * tileSize / 2),
            'hospital'
        ).setVisible(false);
        this.hospitalSprite.setTintFill(0xffff00);
        this.hospitalSprite.setAlpha(0);

        this.playerHouseSprite = this.physics.add.sprite(
            houseCoords[0] * tileSize + ((houseSize[0] + 1) * tileSize / 2),
            houseCoords[1] * tileSize + ((houseSize[1] + 1) * tileSize / 2),
            'playerFarm'
        )
            .setVisible(false)
            .setTintFill(0xffff00)
            .setAlpha(0)
            .setInteractive();


        this.hospitalHighlightTween = this.tweens.add({
            targets: this.hospitalSprite,
            alpha: 0.75,
            ease: 'Cubic.easeOut',
            duration: 1000,
            repeat: -1,
            yoyo: true,
            paused: true,
        });
        this.houseHighlightTween = this.tweens.add({
            targets: this.playerHouseSprite,
            alpha: 0.75,
            ease: 'Cubic.easeOut',
            duration: 1000,
            repeat: -1,
            yoyo: true,
            paused: true
        });


    }

    /**
     * Toggle the tweens that highlight the hospital and player house as choices
     */
    toggleHighlightTweens() {
        if (this.hospitalHighlightTween.isPlaying() === true) {
            this.playerHouseSprite.setVisible(false);
            this.hospitalSprite.setVisible(false);
            this.hospitalHighlightTween.pause();
            this.houseHighlightTween.pause();
            this.hospitalHighlightTween.restart();
            this.houseHighlightTween.restart();
        } else {
            this.playerHouseSprite.setVisible(true);
            this.hospitalSprite.setVisible(true);
            this.hospitalHighlightTween.resume();
            this.houseHighlightTween.resume();

        }
    }

    /**
     *  Ask player if they wish to join the Bovifree scheme
     *  If so, set cows to bovifree and deduct fee
     */
    async bFreePhase() {
        console.log('BFree phase start');
        // Start text and onboarding if enabled
        gameState.currentState = States.BOVISTART;

        this.addListeners();
        this.uiScene.toggleDialogWindow();
        this.uiScene.togglePlayerWindow();

        this.toggleHighlightTweens();


        if (gameState.isOnBoarding) {
            this.uiScene.addTextAndStartDialog(this.bFreeDialogTexts.onboards);

        } else {
            this.uiScene.addTextAndStartDialog(this.bFreeDialogTexts.start);

        }

    }

    addListeners() {
        /* If we've chosen, once that's done and dialog over, go to next phase */
        eventsCenter.on(gameSettings.EVENTS.DIALOGFINISHED, function () {
            if (gameState.clickEnabled && gameState.currentState === States.BOVINO || gameState.currentState === States.BOVIYES) {
                setTimeout(function () {
                    eventsCenter.emit(gameSettings.EVENTS.BFREEPHASEEND);
                }, 1500);
            }

        }, this);

        this.gameScene.player.getPenZone().on('pointerup', function (pointer, localX, localY) {
            if (gameState.clickEnabled && gameState.currentState === States.BOVICHOOSE) {
                // If board is touchable, record touch
                eventsCenter.emit(gameSettings.EVENTS.PLAYERPENTOUCHED);
            }
        }, this);

        this.playerHouseSprite.on('pointerup', function (pointer, localX, localY) {
            if (gameState.clickEnabled) {
                eventsCenter.emit(gameSettings.EVENTS.PLAYERHOUSETOUCHED);
            }

        });

        eventsCenter.on(gameSettings.EVENTS.BFREEPHASEEND, this.endPhase, this);
        eventsCenter.on(gameSettings.EVENTS.HOSPITALTOUCHED, this.joinBFreeYes, this);
        eventsCenter.on(gameSettings.EVENTS.PLAYERHOUSETOUCHED, this.joinBFreeNo, this);

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
            movePromises.push(this.sendCowToHospital(myCows[c], 50, 50 * c))
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
            //let backHome = cow.movePath.slice().reverse();


            result = await cow.moveCowAlongPath(cowSpeed);
            if (result) {
                // Power Up!
                result = await cow.innoculationAnimation();
                if (result) {
                    // Back to pen using reverse of calculated path
                    /*await cow.calculateMovePath(cow.homePen.tileXY[0],
                        cow.homePen.tileXY[1]);
                    await cow.moveCowAlongPath(cowSpeed);*/
                    await cow.sendCowToHomePen();
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

    joinBFree(farmer) {
        let totalCost = gameSettings.gameRules.bfreeJoinCost; //+ farmer.infections;
        farmer.balance -= totalCost;
        // Remove infection from cattle
        gameState.infectionTotal -= farmer.infections;
        farmer.setBFree(true);
        // Update the scoreboard
        /*this.uiScene.scoreboard.updateScoreboardCell(
            farmer.slug, this.uiScene.scoreboard.cellKeys.infectedCell, 0
        );*/
        this.logBFreeTransaction(
            farmer,
            farmer.name + " joins BFree scheme  and pays " + totalCost
        );

        this.gameScene.coinAnimation(farmer.getPenCentre()[0], farmer.getPenCentre()[1],
            totalCost, false);
        eventsCenter.emit(gameSettings.EVENTS.PLAYERBALANCEUPDATED);
        eventsCenter.emit(gameSettings.EVENTS.BFREEJOINED);
        eventsCenter.emit(gameSettings.EVENTS.INFECTIONLEVELUPDATED);
    }

    async joinBFreeYes() {

        // Subtract the cost
        gameState.currentState = States.BOVIYES;
        //console.log("Joining Bovi Free");
        this.toggleHighlightTweens();
        this.uiScene.clearDialogWindow();
        this.joinBFree(this.gameScene.player);
        await this.innoculationAnimation(this.gameScene.player);
        await this.AIFarmersJoinBFree();
        this.uiScene.addTextAndStartDialog(this.bFreeDialogTexts.yes);
        return true;
    }

    async joinBFreeNo() {
        //console.log("Not joining Bovi Free");
        // Subtract the cost
        gameState.currentState = States.BOVINO;
        this.toggleHighlightTweens();
        this.uiScene.clearDialogWindow();
        this.uiScene.addTextAndStartDialog(this.bFreeDialogTexts.no);
        this.gameScene.player.setBFree(false);
        await this.AIFarmersJoinBFree();
        return true;
    }

    async AIFarmersJoinBFree() {
        let farmers = this.gameScene.AIFarmers;
        let innoculationPromises = [];
        for (let f = 0; f < farmers.length; f++) {
            if (this.scheme_choice(farmers[f]) === true) {
                if (gameSettings.DEBUG) {
                    //console.log(farmers[f].name + ' joined scheme');
                }
                this.joinBFree(farmers[f]);
                innoculationPromises.push(this.innoculationAnimation(farmers[f]));
            } else {
                farmers[f].setBFree(false);
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
        messageProps.event_type = gameSettings.TRANSACTIONEVENTTYPES.JoinBFree;
        this.gameScene.logTransaction(messageProps);
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
            (gameState.totalInfections >= farmer.threshold.global)
        ) {
            return true;
        }
        return false;
    }


    removeListeners() {
        this.gameScene.player.getPenZone().off('pointerup');
        this.playerHouseSprite.off('pointerup');

        eventsCenter.off(gameSettings.EVENTS.BFREEPHASEEND, this.endPhase);
        eventsCenter.off(gameSettings.EVENTS.HOSPITALTOUCHED, this.joinBFreeYes);
        eventsCenter.off(gameSettings.EVENTS.PLAYERHOUSETOUCHED, this.joinBFreeNo);

    }

    endPhase() {
        //console.log("Joining Bovi Free COMPLETE");
        this.removeListeners();
        this.scene.get(gameSettings.SCENENAMES.TRADINGSCENENAME).tradingPhase();
    }


}
