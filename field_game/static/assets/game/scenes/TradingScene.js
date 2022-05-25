/*jshint esversion: 8 */
import {gameSettings} from "../cst.js";
import eventsCenter from "./EventsCenter.js";

/**
 * Field BoviFree trading game - Trading Scene
 * Elliott Hall for KDL, 18/5/2022
 *
 * Previous phase: BFree
 *
 * During this phase:
 * -Player chooses which farm to purchase cow from
 * -AI Farmers all buy one cow, from each other and/or the player
 *
 * Next phase: RoundEnd
 */
export default class TradingScene extends Phaser.Scene {
    constructor() {
        super(gameSettings.SCENENAMES.TRADINGSCENENAME);
        this.dialogTexts = {
            onboards: [
                "Trading phase",
                "Buy a cow from a player by touching their pen.", "Bfree cows cost £" + gameSettings.gameRules.bfreeCowPrice + ", others £" + gameSettings.gameRules.normalCowPrice,
                "Warning! Non-BFree cows may be infected"
            ],
            start: ["Trading phase"],

        };
    }

    preload() {
        //this.load.scenePlugin('rexuiplugin', '/static/assets/game/plugins/vendor/rexuiplugin.min.js', 'rexUI', 'rexUI');
    }

    create() {

        this.gameScene = this.scene.get(gameSettings.SCENENAMES.GAMESCENENAME);
        this.uiScene = this.scene.get(gameSettings.SCENENAMES.UISCENENAME);
        this.addListeners();

        //Start text
        if (this.gameScene.gameState.isOnBoarding === true) {
            this.uiScene.addDialogText(this.dialogTexts.onboards);
            eventsCenter.emit(gameSettings.EVENTS.ADVANCEDIALOG);
        } else {
            this.uiScene.addDialogText(this.dialogTexts.start);
            eventsCenter.emit(gameSettings.EVENTS.ADVANCEDIALOG);
        }
        // Player trading phase

        eventsCenter.once(gameSettings.EVENTS.DIALOGFINISHED, function () {
            this.playerTrade();
        }, this);

    }

    addListeners() {

    }

    update(times, delta) {

    }

    async playerTrade() {
        this.gameScene.setIsGameBoardActive(true);
        // On pen touched
        eventsCenter.once(gameSettings.EVENTS.AIFARMERPENTOUCHED, this.playerPurchaseCow, this);

    }

    /**
     * This phase has two parts:
     *
     * 1. Player chooses which farm to purchase cow from
     * 2. AI farmers purchase cows from player and/or each other
     * Resolve all cow trades between players
     * Display results in dialog window as we go
     */
    async AITrade() {
        if (gameSettings.DEBUG) {
            console.log('AI Trading phase start');
        }
        // Computer trading
        let tradingSummary = '';
        let summary = '';
        let boughtCow = null;
        let sellers = this.gameScene.getAllFarmers();
        let boughtHerd = [];


        // Do all the trades
        // Write results in one big text bloc for speed

        for (let x = 0; x < this.gameScene.AIFarmers.length; x++) {
            [summary, boughtCow] = this.purchaseCow(this.gameScene.AIFarmers[x], sellers);
            if (summary && summary.length >0){
                tradingSummary += summary + "\n";
            }
            if (boughtCow){
                boughtHerd.push(boughtCow);
            }
        }
        this.uiScene.setDialogSpeed(gameSettings.DIALOGSPEEDS.fast);
        this.uiScene.addDialogText([tradingSummary]);
        eventsCenter.emit(gameSettings.EVENTS.ADVANCEDIALOG);

        // Unleash the cows!
        await this.gameScene.sendHerdToPens(boughtHerd);
        eventsCenter.once(gameSettings.EVENTS.DIALOGFINISHED, function () {
                if (this.scene.isSleeping(gameSettings.SCENENAMES.TURNENDSCENENAME)){
                    this.scene.switch(gameSettings.SCENENAMES.TURNENDSCENENAME);
                }else{
                    this.scene.launch(gameSettings.SCENENAMES.TURNENDSCENENAME);
                }
            }, this);


    }

    async playerPurchaseCow(seller) {

        if (seller) {
             this.gameScene.setIsGameBoardActive(false);
            let [summary, boughtCow] = this.transaction(this.gameScene.player, seller);
            // Send cow to player pen
            this.uiScene.addDialogText([summary]);
            eventsCenter.emit(gameSettings.EVENTS.ADVANCEDIALOG);
            await this.gameScene.player.sendCowToPen(boughtCow);
            this.AITrade();

        }
    }

    /**
     * Buy a cow from another AI or the player
     * If the player has the money
     *
     * @param farmers
     * @return summary of transactions
     */
    purchaseCow(buyer, sellers) {
        let summary = '';
        let boughtCow = null;
        if (buyer.balance >= gameSettings.gameRules.bfreeCowPricee) {
            this.transaction(buyer, buyer.calculatePurchaseChoice(sellers));
        } else if (buyer.balance >= gameSettings.gameRules.normalCowPrice) {
            // Player can't afford premium cows, only buy from nonbfree
            let normalSellers = [];

            for (let s = 0; s < sellers.length; s++) {

                if (!sellers[s].isBFree()) {
                    normalSellers.push(sellers[s]);
                }
            }
            [summary, boughtCow] = this.transaction(buyer, buyer.calculatePurchaseChoice(normalSellers));
        } else {
            summary = buyer.name + " can't afford to buy a cow";
        }

        this.gameScene.gameLog(summary);
        return [summary, boughtCow];
    }

    /**
     * A sale of a cow between buyer and seller
     * If the cow is not part of the bfree game it may be infected
     *
     * @param buyer of cow
     * @param seller of cow
     */
    transaction(buyer, seller) {
        let cowType = '';
        let price = 0;
        let boughtCow = null;
        if (buyer && seller) {
            if (seller.isBFree()) {
                // Bovi free, pay premium, no infection
                cowType = 'Premium';
                seller.balance += gameSettings.gameRules.bfreeCowPrice;
                buyer.balance -= gameSettings.gameRules.bfreeCowPrice;
                price = gameSettings.gameRules.bfreeCowPrice;
            } else {
                // Normal, pay normal, increase infection
                cowType = 'Normal';
                price = gameSettings.gameRules.normalCowPrice;
                seller.balance += gameSettings.gameRules.normalCowPrice;
                buyer.balance -= gameSettings.gameRules.normalCowPrice;
                // is the cow infected?
                // todo tie break?
                if (Math.random() < (seller.infections / seller.herdTotal)) {
                    // Buyer bought an infected cow!
                    buyer.infections += 1;
                    seller.infections -= 1;
                    cowType = "Infected";
                }

            }
            buyer.herdTotal += 1;
            seller.herdTotal -= 1;
            // Set the ownership of cow to seller
            for (let c = 0; c < this.gameScene.herd.length; c++) {
                if (this.gameScene.herd[c].owner === seller) {
                    boughtCow = this.gameScene.herd[c];
                    this.gameScene.herd[c].owner = buyer;
                    let penTile = buyer.findRandomPenTile();
                    break;
                }

            }
            // Reset time since last sale for seller
            seller.timeSinceLastSale = -1;
            let summary = cowType + ' cow bought by ' + buyer.name + ' from ' + seller.name + ' for £' + price;
            this.gameScene.gameLog(summary);
            return [summary, boughtCow];

        }
        return ['', null];

    }

}
