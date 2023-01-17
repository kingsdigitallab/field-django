/*jshint esversion: 8 */
import {gameSettings, States} from "../cst.js";
import {gameState} from '../GameState.js';

import eventsCenter from "./EventsCenter.js";

/**
 * This phase:
 * -Calculates income
 * -Calculates infection
 * -Display the end of the round state on the scoreboard
 */
export default class TurnEndScene extends Phaser.Scene {
    constructor() {
        super(gameSettings.SCENENAMES.TURNENDSCENENAME);
    }

    create() {
        this.gameScene = this.scene.get(gameSettings.SCENENAMES.GAMESCENENAME);
        this.uiScene = this.scene.get(gameSettings.SCENENAMES.UISCENENAME);
        this.addListeners();
    }

    addListeners() {
        // Show the prompt once scoreboard update complete
        eventsCenter.on(gameSettings.EVENTS.SCOREBOARDFINISH, function () {
            if (gameState.currentState === States.TURNEND) {
                // Prompt for touch to continue
                // Move to final scores if last turn
                if (gameState.currentTurn < gameSettings.gameRules.totalTurns){
                    this.uiScene.scoreboard.setScoreboardPromptVisible(true);
                } else {
                    this.endTurn();
                }
                gameState.currentState = States.TURNENDFINISH;
            }
        }, this);

        // Prompt touched, end
        eventsCenter.on(gameSettings.EVENTS.TURNEND, function () {
            if (gameState.currentState === States.TURNENDFINISH){
                this.endTurn();
            }
        }, this);


    }

    /**
     * End our turn, and start a new one or end the game
     */
    endTurn() {

        // If last turn, go to game end
        //Otherwise start new turn
        if (gameState.currentTurn >= gameSettings.gameRules.totalTurns) {

            // Game over man
            //this.scene.get(gameSettings.SCENENAMES.GAMEENDSCENENAME).start();

            // Final scores

            // Set the winner
            let currentPlayers = this.sortPlayersByAssets();

            gameState.winnerSpriteKeyFrame = currentPlayers[0].sprite.frame.name;
            gameState.winner = currentPlayers[0];

            let scene = this.scene;
            this.add.tween({
                targets: this.uiScene.scoreboard.scoreboardTitle,
                alpha: 0,
                duration: 1000,
                onComplete: () => {
                    this.uiScene.scoreboard.scoreboardTitle.text = "Final Score";
                    // Recentre
                    this.uiScene.scoreboard.scoreboardTitle.x = this.uiScene.scoreboard.rectCentreX - (this.uiScene.scoreboard.scoreboardTitle.displayWidth / 2);
                    this.add.tween({
                        targets: this.uiScene.scoreboard.scoreboardTitle,
                        alpha: 1,
                        duration: 1000,
                        onComplete: () => {
                            console.log("Game end");
                            // Change continue button event and display
                            this.uiScene.scoreboard.scoreboardPrompt.off(
                                'pointerup',
                                this.uiScene.scoreboard.continueButton
                            );
                            this.uiScene.scoreboard.scoreboardPrompt.off(
                                'pointerup',
                                this.uiScene.scoreboard.continueButtonEndTurn
                            );
                            this.uiScene.scoreboard.scoreboardPrompt.on(
                                'pointerup',
                                this.uiScene.scoreboard.continueButtonEndGame
                            );
                            this.uiScene.scoreboard.setScoreboardPromptVisible(true);

                        }
                    }, this);
                }
            }, this);

        } else {
            this.uiScene.scoreboard.toggleScoreboard();
            this.uiScene.scoreboard.setScoreboardPromptVisible(false);
            this.resetBoard();

            // Update player info balance
            eventsCenter.emit(gameSettings.EVENTS.PLAYERBALANCEUPDATED);
            eventsCenter.emit(gameSettings.EVENTS.PLAYERHERDUPDATED);

            // Back to turn start
            this.gameScene.startTurn();
            //this.scene.sleep();
        }
    }

    async updateFarmerIncome(farmer) {
        let income = (farmer.herdTotal - farmer.infections);
        await this.uiScene.scoreboard.scoreboardTickUp(
            farmer.slug, this.uiScene.scoreboard.cellKeys.balanceCell,
            farmer.balance, (farmer.balance + income)
        );
        farmer.balance += income;
    }

    updateHerdSize(farmer) {
        this.uiScene.scoreboard.updateScoreboardCell(farmer.slug, this.uiScene.scoreboard.cellKeys.cowCell, farmer.herdTotal);
    }

    /**
     * Do end of turn calculations and show it on the scoreboard
     */
    async turnEndPhase() {
        // For each farmer
        gameState.currentState = States.TURNEND;

        let farmers = this.gameScene.getAllFarmers();
        this.uiScene.scoreboard.updateScoreBoardTitles();

        this.uiScene.toggleDialogWindow();
        this.uiScene.togglePlayerWindow();

        this.uiScene.scoreboard.toggleScoreboard();
        await this.uiScene.sleep(1500);

        // Get all the updates as promises so we can update
        // the scoreboard gradually
        let balancePromises = [];
        let infectionPromises = [];

        for (let f = 0; f < farmers.length; f++) {
            // Other housekeeping
            farmers[f].timeSinceLastSale += 1;
            this.updateHerdSize(farmers[f]);
            // Calculate income and display
            balancePromises.push(this.updateFarmerIncome(farmers[f]));

        }
        let done = await Promise.all(balancePromises);
        // Calculates infection
        let oldInfectionTotal = gameState.infectionTotal;
        for (let f = 0; f < farmers.length; f++) {
            this.updateInfection(farmers[f]);
        }

        await this.uiScene.scoreboard.infectionTickUp(oldInfectionTotal, gameState.infectionTotal);
        eventsCenter.emit(gameSettings.EVENTS.INFECTIONLEVELUPDATED);

        //Give user a chance to read it
        await this.uiScene.sleep(1000);
        let currentPlayers = this.sortPlayersByAssets();
        this.uiScene.scoreboard.updateScoreBoardRanks(this, currentPlayers);
    }

    /**
     * Chores to get board ready for next turn:
     * -Remove tints on bfree cows
     */
    resetBoard() {
        // Remove tints on bfree
        for (let c = 0; c < this.gameScene.herd.length; c++) {
            if (this.gameScene.herd[c].sprite.isTinted) {
                this.gameScene.herd[c].sprite.clearTint();
            }
        }

    }

    /**
     * Sorting just by their current cash balance
     * @return sorted players
     */
    sortPlayersByBalance() {
        let players = this.gameScene.getAllFarmers();
        players.sort(function (a, b) {
            if (a.balance > b.balance) {
                return -1;
            } else if (b.balance < a.balance) {
                return 1;
            } else {
                return 0;
            }
        });
        return players;
    }

    /**
     * Sorting by cash plus assets e.g. cows
     * @return sorted players
     */
    sortPlayersByAssets() {
        let players = this.gameScene.getAllFarmers();
        players.sort(function (a, b) {
            if (a.getAssets() > b.getAssets()) {
                return -1;
            } else if (b.getAssets() < a.getAssets()) {
                return 1;
            } else {
                return 0;
            }
        });
        return players;
    }

    update(times, delta) {

    }


    /**
     *
     * Increase infection in farms that have infected cows.
     *
     * New simple beta version that doubles infection (if herd allows)
     *
     * @param farmer
     * @return {Promise<void>}
     */
    async updateInfection(farmer) {
        let newInfections = 0;
        if (farmer.bfree === false || farmer.infections === farmer.herdTotal) {
            if ((farmer.infections * 2) <= farmer.herdTotal) {
                newInfections = farmer.infections;
            } else {
                // Infect all the remaining cows
                newInfections = farmer.herdTotal - farmer.infections;
            }

            farmer.infections += newInfections;
            gameState.infectionTotal += newInfections;
        }
    }


}
