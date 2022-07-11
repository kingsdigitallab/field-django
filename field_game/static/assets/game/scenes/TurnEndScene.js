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
        this.events.on('wake', this.turnEndPhase);


    }

    async updateFarmerIncome(farmer) {
        let income = (farmer.herdTotal - farmer.infections);
        await this.uiScene.scoreboard.scoreboardTickUp(
            farmer.slug, this.uiScene.scoreboard.cellKeys.balanceCell,
            farmer.balance, (farmer.balance + income)
        );
        farmer.balance += income;
    }

    updateHerdSize(farmer){
        this.uiScene.scoreboard.updateScoreboardCell(farmer.slug, this.uiScene.scoreboard.cellKeys.cowCell, farmer.herdTotal);
    }

    /**
     * Do end of turn calculations and show it on the scoreboard
     */
    async turnEndPhase() {
        // For each farmer
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
        for (let f = 0; f < farmers.length; f++) {
                infectionPromises.push(this.updateInfection(farmers[f]));
        }
        await Promise.all(infectionPromises);

        //Give user a chance to read it
        await this.uiScene.sleep(1000);

        this.uiScene.scoreboard.updateScoreBoardRanks(this, this.sortPlayersByAssets());

        eventsCenter.once(gameSettings.EVENTS.ADVANCEDIALOG, function () {
            this.uiScene.scoreboard.toggleScoreboard();
            this.uiScene.scoreboard.scoreboardPrompt.visible=false;

            // If last turn, go to game end
            //Otherwise start new turn
            if (this.gameScene.gameState.currentTurn >= gameSettings.gameRules.totalTurns){
                // Game over man
                this.scene.switch(gameSettings.SCENENAMES.GAMEENDSCENENAME);
            }else{
                //
                this.resetBoard();
                // Back to turn start
                this.gameScene.startTurn();
                //this.scene.sleep();
            }

        }, this);
        this.uiScene.scoreboard.scoreboardPrompt.visible=true;

    }

    /**
     * Chores to get board ready for next turn:
     * -Remove tints on bfree cows
     */
    resetBoard(){
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
    sortPlayersByBalance(){
        let players = this.gameScene.getAllFarmers();
        players.sort(function(a,b){
            if (a.balance > b.balance){
                return -1;
            }else if (b.balance< a.balance){
                return 1;
            }else{
                return 0;
            }
        });
        return players;
    }

    /**
     * Sorting by cash plus assets e.g. cows
     * @return sorted players
     */
    sortPlayersByAssets(){
        let players = this.gameScene.getAllFarmers();
        players.sort(function(a,b){
            if (a.getAssets() > b.getAssets()){
                return -1;
            }else if (b.getAssets()< a.getAssets()){
                return 1;
            }else{
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
            if ((farmer.infections * 2) <= farmer.herdTotal){
                newInfections = farmer.infections;
            } else{
                // Infect all the remaining cows
                newInfections = farmer.herdTotal - farmer.infections;
            }
            if (newInfections > 0) {
                this.uiScene.scoreboard.scoreboardLines[farmer.slug][this.uiScene.scoreboard.cellKeys.infectedCell].setColor('red');
                await this.uiScene.scoreboard.scoreboardTickUp(
                    farmer.slug, this.uiScene.scoreboard.cellKeys.infectedCell,
                    farmer.infections, (farmer.infections + newInfections)
                );
            }
            farmer.infections += newInfections;
            this.gameScene.gameState.infectionTotal += newInfections;
        }
    }

}
