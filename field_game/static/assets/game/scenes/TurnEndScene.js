/*jshint esversion: 8 */
import {gameSettings} from "../cst.js";
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
        if (gameSettings.DEBUG) {
            console.log('Round End Start');
        }
        this.gameScene = this.scene.get(gameSettings.SCENENAMES.GAMESCENENAME);
        this.uiScene = this.scene.get(gameSettings.SCENENAMES.UISCENENAME);
        this.uiScene.scoreboard.updateScoreBoard();
        /*this.uiScene.scoreboard.scoreboardTickUp(
            this.gameScene.player,
            'infectedCell',
            0,
            10
        );*/
        //this.uiScene.scoreboard.scoreboardLines[this.gameScene.player]['rankCell'].x=50;
        this.roundEndPhase();
    }

    async updateFarmerIncome(farmer) {
        let income = (farmer.herdTotal - farmer.infections) * 10;
        await this.uiScene.scoreboard.scoreboardTickUp(
            farmer.slug, this.uiScene.scoreboard.cellKeys.balanceCell,
            farmer.balance, (farmer.balance + income)
        );
        farmer.balance += income;
    }

    /**
     * Do end of turn calculations and show it on the scoreboard
     */
    async roundEndPhase() {
        // For each farmer
        let farmers = this.gameScene.getAllFarmers();
        //let done = await new Promise((resolve, reject) => {

        // Get all the updates as promises so we can update
        // the scoreboard gradually
        let balancePromises = [];
        let infectionPromises = [];

        for (let f = 0; f < farmers.length; f++) {
            // Other housekeeping
            farmers[f].timeSinceLastSale += 1;
            // Calculate income and display
            balancePromises.push(this.updateFarmerIncome(farmers[f]));

        }
        let done = await Promise.all(balancePromises);
        // Calculates infection
        for (let f = 0; f < farmers.length; f++) {
                infectionPromises.push(this.updateInfection(farmers[f]));
        }
        await Promise.all(infectionPromises);


        eventsCenter.once(gameSettings.EVENTS.ADVANCEDIALOG, function () {
            // If last turn, go to game end
            this.uiScene.scoreboard.toggleScoreboard();
            //Otherwise start new turn
            if (this.gameScene.gameState.currentTurn >= gameSettings.gameRules.totalTurns){

            }

        }, this);
        this.uiScene.scoreboard.scoreboardPrompt.visible=true;

    }

    update(times, delta) {

    }

    /*
    For farm in {0,1,…,8}
        Use N = cows[farm] - infections[farm]
        p = β * infections[farm] ÷ Cows[farm]
    Select n from Binomial distribution B( N,p)
        Increase Infections[farm] by n
     */

    async updateInfection(farmer) {
        let newInfections = 0;
        if (farmer.bfree === false) {
            let infectionChance = gameSettings.gameRules.infectionBeta * farmer.infections / farmer.herdTotal;
            for (let c = 0; c < (farmer.herdTotal - farmer.infections); c++) {

                if (Math.random() <= infectionChance) {
                    newInfections += 1;
                }

                if ((farmer.infections + newInfections) >= farmer.herdTotal) {
                    break;

                }

            }
            if (newInfections > 0) {
                this.uiScene.scoreboard.scoreboardLines[farmer.slug][this.uiScene.scoreboard.cellKeys.infectedCell].setColor('red');
                await this.uiScene.scoreboard.scoreboardTickUp(
                    farmer.slug, this.uiScene.scoreboard.cellKeys.infectedCell,
                    farmer.infections, (farmer.infections + newInfections)
                );
            }
            farmer.infections += newInfections;

        }

    }


}
