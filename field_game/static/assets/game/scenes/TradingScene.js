/*jshint esversion: 8 */
import {gameSettings, States} from "../cst.js";
import {gameState} from '../GameState.js';
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
                "Trading phase\n" +
                "Buy a cow from a player by tapping their pen. Cows cost £"+ gameSettings.gameRules.normalCowPrice +". ",
                "You can only buy cows that have been treated",
                "You can only buy cows that have not been treated"
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

    }

    addListeners() {
        // Add listeners for On pen touched
        for (let p = 0; p < this.gameScene.AIFarmers.length; p++) {
            this.gameScene.AIFarmers[p].getPenZone().on('pointerup',
                function (pointer, localX, localY) {
                    if (gameState.currentState === States.TRADINGCHOOSE) {
                        // If board is touchable, record touch
                        //console.log('touched');
                        eventsCenter.emit(gameSettings.EVENTS.AIFARMERPENTOUCHED, this);

                    }
                }, this.gameScene.AIFarmers[p]);
        }

        eventsCenter.on(gameSettings.EVENTS.AIFARMERPENTOUCHED, this.playerPurchaseCow, this);
    }

    tradingPhase() {
        if (gameSettings.DEBUG) {
            console.log("Trading Phase Start");
        }
        this.addListeners();
        gameState.currentState = States.TRADINGSTART;
        //Start text
        if (gameState.isOnBoarding === true) {
            if (this.gameScene.player.isBFree()){
                this.uiScene.addTextAndStartDialog(
                    [this.dialogTexts.onboards[0]+" "+this.dialogTexts.onboards[1]]
                );

            } else{
                this.uiScene.addTextAndStartDialog(
                    [this.dialogTexts.onboards[0]+" "+this.dialogTexts.onboards[2]]
                );
            }

        } else {
            this.uiScene.addTextAndStartDialog(this.dialogTexts.start);
        }
        this.highlightTradingChoices(this);
        this.playerTrade();
    }

    /** Highlight available farms that the player can purchase from.
     *
     */
    highlightTradingChoices(scene) {
        for (let x = 0; x < this.gameScene.AIFarmers.length; x++) {
            if (this.gameScene.player.isBFree() == this.gameScene.AIFarmers[x].isBFree()) {
                // this.penZone.x + this.penZone.width / 2, this.penZone.y + this.penZone.height / 2
                this.gameScene.AIFarmers[x].penZoneHighlightTween.resume();
                this.gameScene.AIFarmers[x].penZoneHighlightTween.restart();

            }
        }
    }

    unhighlightTradingChoices(scene) {
        for (let x = 0; x < this.gameScene.AIFarmers.length; x++) {
            if (
                this.gameScene.AIFarmers[x].penZoneHighlightTween &&
                this.gameScene.AIFarmers[x].penZoneHighlightTween.isPlaying()
            ) {
                this.gameScene.AIFarmers[x].penZoneHighlight.setAlpha(0);
                this.gameScene.AIFarmers[x].penZoneHighlightTween.pause();
            }

        }
    }


    async playerTrade() {
        gameState.currentState = States.TRADINGCHOOSE;
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
        gameState.currentState = States.TRADINGAI;
        if (gameSettings.DEBUG) {
            console.log('AI Trading phase start');
        }
        // Computer trading
        let tradingSummary = '';
        let summary = '';
        let boughtCow = null;
        let uncertifiedSellers = [];
        let boughtHerd = [];
        let certifiedSellers = [];
        for (let s = 0; s < this.gameScene.getAllFarmers().length; s++) {
            let farmer = this.gameScene.getAllFarmers()[s];
            if (farmer.herdTotal > 0) {
                if (farmer.isBFree()) {
                    certifiedSellers.push(farmer);
                } else {
                    uncertifiedSellers.push(farmer);
                }
            }
        }

        // Do all the trades
        // Write results in one big text bloc for speed

        for (let x = 0; x < this.gameScene.AIFarmers.length; x++) {
            if (this.gameScene.AIFarmers[x].isBFree()) {
                [summary, boughtCow] = this.purchaseCow(
                    this.gameScene.AIFarmers[x], certifiedSellers
                );
            } else {
                [summary, boughtCow] = this.purchaseCow(
                    this.gameScene.AIFarmers[x], uncertifiedSellers
                );
            }

            if (summary && summary.length > 0) {
                tradingSummary += summary + "\n";
            }
            if (boughtCow) {
                boughtHerd.push(boughtCow);
            }
        }
        this.uiScene.setDialogSpeed(gameSettings.DIALOGSPEEDS.fast);
        // Simplified so there's less text
        //this.uiScene.addTextAndStartDialog([tradingSummary]);


        // Unleash the cows!
        await this.gameScene.sendHerdToHomePen(boughtHerd);
        this.resetCows();
        this.finishPhase();

    }

    /**
     * Do any housekeeping and move on to next part of turn
     */
    async finishPhase() {
        gameState.currentState = States.TRADINGFINISH;
        this.removeListeners();
        // Short delay before next phase
        await new Promise(resolve => setTimeout(resolve, 1500));
        this.scene.get(gameSettings.SCENENAMES.TURNENDSCENENAME).turnEndPhase();
    }

    removeListeners() {
        //eventsCenter.off(gameSettings.EVENTS.AIFARMERPENTOUCHED, this.playerPurchaseCow, this);
        for (let p = 0; p < this.gameScene.AIFarmers.length; p++) {
            this.gameScene.AIFarmers[p].getPenZone().off('pointerup');
        }
    }

    resetCows() {
        for (let x = 0; x < this.gameScene.herd.length; x++) {
            this.gameScene.herd[x].isTrading = false;
        }
    }

    async playerPurchaseCow(seller) {

        if (gameState.currentState === States.TRADINGCHOOSE) {
            if (seller && (seller.isBFree() === this.gameScene.player.isBFree())) {
                this.uiScene.clearDialogWindow();
                eventsCenter.off(gameSettings.EVENTS.AIFARMERPENTOUCHED, this.playerPurchaseCow);
                let [summary, boughtCow] = this.transaction(this.gameScene.player, seller);
                // Send cow to player pen

                this.uiScene.addTextAndStartDialog([
                    summary.replace('Player', 'You')]);
                if (boughtCow) {
                    this.unhighlightTradingChoices();
                    eventsCenter.emit(gameSettings.EVENTS.PLAYERBALANCEUPDATED);
                    eventsCenter.emit(gameSettings.EVENTS.PLAYERHERDUPDATED);
                }
                //await this.gameScene.player.sendCowToPen(boughtCow);
                await boughtCow.sendCowToHomePen();
                this.AITrade();
            } else {

                //this.uiScene.clearDialogWindow();
                if (this.gameScene.player.isBFree()) {
                    this.uiScene.addDialogText(['Choose a BFree farm']);
                } else {

                    this.uiScene.addDialogText(['Choose a non-BFree farm']);
                }
                this.uiScene.advanceDialogWindowSequence();

            }
        }
    }

    /**
     * Buy a cow from another AI or the player
     * BETA: certified buyers ONLY but from certified sellers
     *
     * Uncertified from uncertified
     *
     * @param farmers
     * @return summary of transactions
     */
    purchaseCow(buyer, sellers) {
        let summary = '';
        let boughtCow = null;

        if (buyer.balance >= gameSettings.gameRules.normalCowPrice) {
            const pIndex = sellers.indexOf(buyer);
            let potentialSellers = [...sellers];
            potentialSellers.splice(pIndex, 1);
            [summary, boughtCow] = this.transaction(
                buyer, this.calculatePurchaseChoice(potentialSellers)
            );
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
            let transactionMessageProps = {
                "farmerA": buyer.name,
                "farmerB": seller.name,
                "event_type": gameSettings.TRANSACTIONEVENTTYPES.Trade
            };

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
                if (this.gameScene.seededRandom() < (seller.infections / seller.herdTotal)) {
                    // Buyer bought an infected cow!
                    buyer.infections += 1;
                    seller.infections -= 1;
                    cowType = "Infected";
                    transactionMessageProps.infected_cow = true;
                }

            }

            // Coins

            this.gameScene.coinAnimation(
                seller.getPenCentre()[0],
                seller.getPenCentre()[1],
                price,
                true
            );
            this.gameScene.coinAnimation(
                buyer.getPenCentre()[0],
                buyer.getPenCentre()[1],
                price,
                false
            );


            buyer.herdTotal += 1;
            seller.herdTotal -= 1;
            // Set the ownership of cow to seller
            for (let c = 0; c < this.gameScene.herd.length; c++) {

                if (this.gameScene.herd[c].owner === seller && this.gameScene.herd[c].isTrading === false) {
                    boughtCow = this.gameScene.herd[c];
                    boughtCow.isTrading = true;
                    break;
                }
            }
            if (boughtCow) {
                // Remove cow from seller's pen
                boughtCow.removeCowFromPen();
                let penIndex = buyer.findFreePenPoint();
                if (penIndex >= 0) {

                    boughtCow.owner = buyer;
                    // Add cow to its new home
                    boughtCow.homePen = buyer.cowPenPoints[penIndex];
                    boughtCow.homePen.cow = boughtCow;
                    boughtCow.homePen.occupied = true;

                } else {
                    console.log("Error! pen index not found!");
                    console.log(buyer);
                }

                //let penTile = buyer.findRandomPenTile();
            }


            // Reset time since last sale for seller
            seller.timeSinceLastSale = -1;

            let transactionSummary = buyer.name +' bought a cow for £' + price;
            let summary = buyer.name + ' bought a cow for £' + price;
            transactionMessageProps.description = summary;
            this.gameScene.gameLog(transactionSummary);
            this.gameScene.logTransaction(transactionMessageProps);
            if (buyer === this.gameScene.player || seller === this.gameScene.player) {
                eventsCenter.emit(gameSettings.EVENTS.PLAYERBALANCEUPDATED);
                eventsCenter.emit(gameSettings.EVENTS.PLAYERHERDUPDATED);
            }
            return [summary, boughtCow];

        } else {
            console.log('Seller failed!');
        }
        return ['', null];

    }

       /**
     * Sorting just by their current cash balance
     * @return sorted players
     */
    sortPlayersByBalance(players) {
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
     * Decide which farmer to purchase a cow from
     *
     * Choose one number n from {0,1,2,…8} farm } with probability
     * from seeded random
     * Return n
     *
     * @param farmers in the game
     * @return farmer we're buying from
     */
    calculatePurchaseChoice(farmers) {
        if (farmers.length == 1) {
            return farmers[0];
        }
        let largeHerdPool = [];
        // Exclude richest player
        farmers = this.sortPlayersByBalance(farmers).reverse();
        if (farmers.length == 2) {
            return farmers[0];
        }
        farmers.pop();

        // If a farmer has 8 or more cows, put them in a preferred pool
        for (let f = 0; f < farmers.length; f++) {
            if (farmers[f].herdTotal >= 8) {
                largeHerdPool.push(farmers[f]);
            }
        }
        if (largeHerdPool.length >= 1) {
            if (largeHerdPool.length == 1) {
                return largeHerdPool[0];
            }
            let choice = Math.round(this.gameScene.seededRandom() * largeHerdPool.length) - 1;
            return farmers[choice];
        } else if (farmers && farmers.length > 0) {
            // Otherwise, choose one at random from available sellers
            let choice = Math.ceil(this.gameScene.seededRandom() * farmers.length) - 1;
            return farmers[choice];
        }
        return null;

    }

}
