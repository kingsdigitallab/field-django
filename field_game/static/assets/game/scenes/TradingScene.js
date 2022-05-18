/*jshint esversion: 8 */
import {EVENTS, GAMESCENENAME, UISCENENAME, DEBUG, gameRules} from "../cst.js";
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
        super('TradingScene');
        this.dialogTexts = {
            onboards: [
                "Trading phase",
                "Buy a cow from a player by touching their pen.","Bfree cows cost £"+gameRules.bfreeCowPrice+", others £"+gameRules.normalCowPrice,
                "Warning! Non-BFree cows may be infected"
            ],
            start: ["Trading phase"],

        };
    }

    preload() {
        //this.load.scenePlugin('rexuiplugin', '/static/assets/game/plugins/vendor/rexuiplugin.min.js', 'rexUI', 'rexUI');
    }

    create() {

        this.gameScene = this.scene.get(GAMESCENENAME);
        this.uiScene = this.scene.get(UISCENENAME);
        this.addListeners();
        this.tradingPhase();
    }

    addListeners(){

    }

    update(times, delta) {

    }

    /**
     * This phase has two parts:
     *
     * 1. Player chooses which farm to purchase cow from
     * 2. AI farmers purchase cows from player and/or each other
     * Resolve all cow trades between players
     * Display results in dialog window as we go
     */
    tradingPhase(){
        if (DEBUG) {
            console.log('Trading phase start');
        }
        //Start text
        if (this.gameScene.gameState.isOnBoarding) {
            this.uiScene.addDialogText(this.dialogTexts.onboards);
            eventsCenter.emit(EVENTS.ADVANCEDIALOG);
        } else {
            this.uiScene.addDialogText(this.dialogTexts.start);
            eventsCenter.emit(EVENTS.ADVANCEDIALOG);
        }
        // Player trading phase

        // Show explanation dialog
        // Listener for input

        // Computer trading
        let tradingSummary='';
        let sellers = this.gameScene.getAllFarmers();

        // Do all the trades
        // Write results in one big text bloc for speed

        for (let x = 0; x < this.gameScene.AIFarmers.length; x++) {
            tradingSummary+=this.purchaseCow(this.gameScene.AIFarmers[x], sellers) +"\n";
        }
        console.log(tradingSummary);

        // Unleash the cows!

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
        if (buyer.balance >= gameRules.bfreeCowPricee) {
            this.transaction(buyer, buyer.calculatePurchaseChoice(sellers));
        } else if (buyer.balance >= gameRules.normalCowPrice) {
            // Player can't afford premium cows, only buy from nonbfree
            let normalSellers = [];

            for (let s = 0; s < sellers.length; s++) {

                if (!sellers[s].isBFree()) {
                    normalSellers.push(sellers[s]);
                }
            }
            summary = this.transaction(buyer, buyer.calculatePurchaseChoice(normalSellers));
        }else {
            summary = buyer.name + " can't afford to buy a cow";
        }

        this.gameScene.gameLog(summary);
        return summary;
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
        console.log(seller);
        if (seller.isBFree()) {
            // Bovi free, pay premium, no infection
            cowType = 'Premium';
            seller.balance += gameRules.bfreeCowPrice;
            buyer.balance -= gameRules.bfreeCowPrice;
            price = gameRules.bfreeCowPrice;
        } else {
            // Normal, pay normal, increase infection
            cowType = 'Normal';
            price = gameRules.normalCowPrice;
            seller.balance += gameRules.normalCowPrice;
            buyer.balance -= gameRules.normalCowPrice;
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
        // Set the ownership of cow to seller and calculate move
        for (let c = 0; c < this.gameScene.herd.length; c++) {
            if (this.gameScene.herd[c].owner === seller) {
                this.gameScene.herd[c].owner = buyer;
                let penTile = buyer.findRandomPenTile();
                this.gameScene.herd[c].calculateMovePath(penTile[0],penTile[1]);
                break;
            }

        }
        // Reset time since last sale for seller
        seller.timeSinceLastSale = -1;
        let summary = cowType + ' cow bought by ' + buyer.name + ' from ' + seller.name+' for £'+price;
        this.gameScene.gameLog(summary);
        return summary;
    }

}
