/*jshint esversion: 6 */
import {BFREESCENENAME, GAMESCENENAME, UISCENENAME, EVENTS} from "../cst.js";

import FieldScene from './FieldScene.js';
import Cow from '../actors/Cow.js';
import {Farmer, Player} from '../actors/Farmer.js';
import eventsCenter from "./EventsCenter.js";


export default class GameScene extends FieldScene {

    map;
    layers;

    // UI objects

    titleContainer;

    constructor() {
        super(GAMESCENENAME);
        this.AIfarmers = [];
        this.herd = [];
        this.layers = [];
        // Player/farmer starts, where the cow pens are etc.
        this.gameboardInfo = {
            playerCowPen: [[16, 9], 5, 7],
            farmerCowPens: [
                [[1, 9], 5, 7],
                [[33, 9], 5, 7],
                [[1, 33], 5, 7],
                [[33, 33], 5, 7],
                [[1, 51], 5, 7],
                [[33, 51], 5, 7],
            ],
            playerStart: [20, 6],
            farmerStarts: [
                [4, 6], [4, 30], [4, 48], [36, 6], [36, 30], [36, 48]
            ],
            hospitalDoor: [19, 32]
        };
        //Game rules and constants
        this.gameRules = {
            startHerdSize: 20,
            startFarmerBalance: 200,
            AIFarmerTotal: 6,
            totalRounds: 8,
            // AI farmer will join scheme at least once per this many turns
            bfreeTrigger: 4,
            bfreeJoinCost: 40, // Cost to join scheme
            // Cow prices, buy and sell
            bfreeCowPrice: 30,
            normalCowPrice: 20,
            cowSpeed: 150
        };
        // State of this instance of game
        this.gameState={
            currentTurn:0,
            isOnBoarding:true, //Display help messages
            isGameBoardActive:false // Is board clickable?
        }


        // Log of all transactions in the game
        // For later export;
        this.gameLog = "";

        /* Main player*/
        this.player = null;
        // Computer farmers (Farmer)
        this.AIfarmers = [];
        //Herd of cows (Cow)
        this.herd = [];
    }


    /**
     * Write to game log
     * @param message
     */
    gameLog(message) {
        this.gameLog += "\n" + message;
    }


    getAllFarmers() {
        let allFarmers = this.AIfarmers;
        allFarmers.append(this.player);
        return allFarmers;
    }


    /**
     * Setup game board
     * -Load tile map
     * https://stackabuse.com/phaser-3-and-tiled-building-a-platformer/
     * - Manually create ground layer from single tiles
     * (may change later)
     * -parse building and decoration layers
     * -set collision for collidable tiles if necessary
     * -Parse player layer, getting where player and AI starts
     */
    createGameBoard() {
        this.map = this.make.tilemap({key: 'map'});

        // Ground layer
        let groundLayer = this.add.layer();
        for (let x = 0; x < (this.MAX_WIDTH / 16); x++) {
            for (let y = 0; y < (this.MAX_HEIGHT / 16); y++) {
                groundLayer.add(this.add.image(x * 16, y * 16, 'grass').setOrigin(0, 0));
            }
        }

        // simple_farm = tileset name we've used in Tiled
        const tileset = this.map.addTilesetImage('simple_farm', 'tiles');
        const modern = this.map.addTilesetImage('modern', 'modern');
        // Buildings and fences
        this.layers.pathLayer = this.map.createLayer('Paths', tileset, 0, 0);
        this.layers.buildingLayer = this.map.createLayer('Buildings', [tileset, modern], 0, 0);

        //Build Easyjs map
        // from https://www.dynetisgames.com/2018/03/06/pathfinding-easystar-phaser-3/
        // obstacles = 0, road = 1 , grass = 2
        let grid = [];
        for (var y = 0; y < (this.GAME_HEIGHT / this.BOARD_TILE_SIZE); y++) {
            let col = [];
            for (var x = 0; x < (this.GAME_WIDTH / this.BOARD_TILE_SIZE); x++) {
                // In each cell we store the ID of the tile, which corresponds
                // to its index in the tileset of the map ("ID" field in Tiled)
                //
                let tile = this.map.getTileAt(x, y, true, this.layers.buildingLayer);
                // Check for player/farmer start squares to use later
                /*if (tile && tile.properties) {
                    if (tile.properties.playerStart && tile.properties.playerStart === true) {
                        this.gameboardInfo.playerStart = [x, y];
                    }
                    if (tile.properties.farmerStart && tile.properties.farmerStart === true) {
                        this.gameboardInfo.farmerStarts.push([x, y]);
                    }
                }*/
                if (tile.index >= 0) {
                    // Building, fence, or other obstacle
                    col.push(0);
                } else {
                    tile = this.map.getTileAt(x, y, true, this.layers.pathLayer);
                    if (tile.index >= 0) {
                        // Road/path
                        col.push(1);
                    } else {
                        // Assume grass in our basic map
                        col.push(2);
                    }
                }
            }
            grid.push(col);
        }
        this.finder.setGrid(grid);
        this.finder.enableDiagonals();
        this.finder.setAcceptableTiles([1, 2]);
        this.finder.setTileCost(2, 2);


    }

    createPlayer() {
        // Player farm
        const startX = this.gameboardInfo.playerStart[0] * this.BOARD_TILE_SIZE;
        const startY = (this.gameboardInfo.playerStart[1] + 1) * this.BOARD_TILE_SIZE;
        let sprite = this.physics.add.sprite(startX, startY, 'farmer_1');
        sprite.setCollideWorldBounds(true);
        this.player = new Player(1, 'Player', this.gameRules.startFarmerBalance, sprite, this.gameboardInfo.playerStart);
        //this.updatePlayerBalance(this.player.balance);
    }

    updatePlayerBalance(balance) {
        this.updateFarmerBalance(this.player, balance);
        this.scene.get(UISCENENAME).updateBalance(this.player.balance);
    }

    updateFarmerBalance(farmer, balance) {
        farmer.balance = balance;
    }

    createCow(owner, startX, startY) {
        //console.log(startX+'::'+startY);
        let sprite = this.physics.add.sprite(startX, startY, 'cow_1');
        sprite.setCollideWorldBounds(true);
        return new Cow(owner, sprite);
    }


    /**
     * Creat the default herd
     * All cows split evenly amongst players
     * Currently default cows are NOT sick and NOT bovifree
     */
    createHerd() {
        this.debug('Creating herd...');
        // Even split for now
        let cowsPerPlayer = Math.floor(this.gameRules.startHerdSize / (this.gameRules.AIFarmerTotal + 1));
        this.debug(cowsPerPlayer + ' cows per player');
        let owner = this.player;
        let pen = this.gameboardInfo.playerCowPen;
        owner.pen = pen;
        for (let p = -1; p < this.gameRules.AIFarmerTotal; p++) {
            if (p >= 0) {
                owner = this.AIfarmers[p];
                pen = this.gameboardInfo.farmerCowPens[p];
                // Assign pen to the farmer
                owner.pen = pen;
            }
            for (let c = 0; c < cowsPerPlayer; c++) {
                let cow = this.createCow(owner, (19 * this.BOARD_TILE_SIZE), (34 * this.BOARD_TILE_SIZE));
                // Pick
                owner.sendCowToPen(cow);
                this.herdTotal += 1;
                this.herd.push(cow);
            }

        }
        //this.animationTimeline.play();

        //Update ui
        //this.scene.get(UISCENENAME).updateHerd(this.player.herdTotal);

    }

    createAIFarmer(id, name, balance, farmerStart) {

        let AISprite = this.physics.add.sprite(farmerStart[0] * this.BOARD_TILE_SIZE, (farmerStart[1] + 1) * this.BOARD_TILE_SIZE, 'farmer_2');
        AISprite.setCollideWorldBounds(true);
        //AISprite.setVisible(false);
        this.AIfarmers.push(new Farmer(id, name, balance, AISprite, farmerStart));
    }

    createFarmers() {
        //let farm = this.add.image(this.GAME_WIDTH, 0, 'AI_farm').setOrigin(1, 0);
        for (let x = 0; x < this.gameRules.AIFarmerTotal; x++) {
            // Split evenly on left  and right side

            this.createAIFarmer(x, 'AI ' + (x + 1), this.gameRules.startFarmerBalance, this.gameboardInfo.farmerStarts[x]);

        }
    }


    preload() {
        //this.load.scenePlugin('rexuiplugin', '/static/assets/game/plugins/rexuiplugin.min.js', 'rexUI', 'rexUI');
    }


    create() {
        // ### Pathfinding stuff ###
        // Initializing the pathfinder
        this.setupComplete = false;
        this.finder = new EasyStar.js();



        // Main game board
        this.createGameBoard();

        // UI Containers

        this.scene.bringToTop(UISCENENAME);

        // Pieces
        this.createPlayer();
        this.createFarmers();
        this.createHerd();


    }

    /**
     * Board is set up and all pieces in place, start
     */
    startGame() {
        this.debug('Begin Game');
        // Create events
        this.addEvents();
        this.scene.launch(BFREESCENENAME);
    }

    /**
     * Add global click/touch events
     */
    addEvents(){
        this.input.on('pointerdown', this.handlePointerDown.bind(this));
    }

    handlePointerDown(){
        // General advance used for dialogs
        if (!this.gameState.isGameBoardActive){
            eventsCenter.emit(EVENTS.ADVANCE);
        }
    }

    moveCows(delta) {
        let herd = this.herd;
        for (let c = 0; c < herd.length; c++) {
            if (herd[c].isMoving === true && herd[c].movePath.length > 0) {
                if (!herd[c].sprite.anims.isPlaying){
                    herd[c].sprite.play('cow_walk_up');
                }
                if (herd[c].sinceLastMove >= this.gameRules.cowSpeed) {
                    // Move the cow
                    herd[c].doPathMove(herd[c].movePath[0], this.gameRules.cowSpeed);
                    herd[c].movePath.shift();
                    herd[c].sinceLastMove=0;
                    if (herd[c].movePath.length === 0) {
                        // Reset our cows, give them a rest
                        herd[c].isMoving = false;
                        herd[c].sinceLastMove=0;
                        herd[c].sprite.stop();
                    }
                }else{
                    //add delta
                    herd[c].sinceLastMove+=delta;
                }
            }
        }
    }

    update(time, delta) {
        // Wait until all the pieces are in place before
        // starting
        if (!this.setupComplete) {
            let done = true;
            for (let c = 0; c < this.herd.length; c++) {
                if (this.herd[c].isMoving === true) {
                    done = false;
                    break;
                }
            }
            if (done) {
                this.setupComplete = true;
                setTimeout(this.startGame.apply(this), 1000);

            }
        }

        // todo add farm idle animations

    }


    /**
     * Create player cow buy dialogue
     */
    createTradingDialogs() {

    }


    createPlayerPurchaseCowDialog() {

    }


    /**

     Gameplay flow functions

     Each round of the game is as follows:

     1. Ask player if they wish to join the Bovifree scheme
     If so, set cows to bovifree and deduct fee

     2. Player chooses which farm to purchase cow from

     3.Calculate cow infection rate

     4.  Calculate balance totals

     5. End round

     If round max is reached:
     Display results of game
     Prompt to play again /share?

     */


    /**
     * Buy a cow from another AI or the player
     * If the player has the money
     *
     * @param farmers
     */
    purchaseCow(buyer, sellers) {
        if (this.balance < this.gameRules.premiumPrice) {
            this.transaction(buyer, buyer.calculatePurchaseChoice(sellers));
        } else if (this.balance < this.gameRules.premiumPrice) {
            // Player can't afford premium cows, only buy from nonbfree
            let normalSellers = [];
            for (let s = 0; s < sellers.length; s++) {
                if (!sellers[s].isBoviFree) {
                    normalSellers.append(sellers[s]);
                }
            }
            this.transaction(buyer, buyer.calculatePurchaseChoice(normalSellers));
        }
        this.gameLog(buyer.name + " can't afford to buy a cow");
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
        if (seller.isBoviFree) {
            // Bovi free, pay premium, no infection
            cowType = 'Premium';
            seller.balance += this.gameRules.bfreeCowPrice;
            buyer.balance -= this.gameRules.bfreeCowPrice;
        } else {
            // Normal, pay normal, increase infection
            cowType = 'Normal';
            seller.balance += this.gameRules.normalCowPrice;
            buyer.balance -= this.gameRules.normalCowPrice;
            // is the cow infected?
            // todo tie break?
            if (Math.Random() < (seller.infections / seller.herdTotal)) {
                // Buyer bought an infected cow!
                buyer.infections += 1;
                seller.infections -= 1;
                cowType = "Infected";
            }

        }
        buyer.herdTotal += 1;
        seller.herdTotal -= 1;
        // Set the ownership of cow to seller and move it
        for (let c = 0; c < this.herd.length; c++) {
            if (this.herd[c].owner === seller) {
                this.herd[c].owner = buyer;
                let penPoint = buyer.findRandomPenPoint();
                this.herd[c].moveCow(penPoint);
                break;
            }

        }
        // Reset time since last sale for seller
        seller.timeSinceLastSale = -1;
        this.gameLog(cowType + ' cow bought by ' + buyer.name + ' from ' + seller.name);
    }

    /**
     * This phase has two parts:
     *
     * 1. Player chooses which farm to purchase cow from
     * 2. AI farmers purchase cows from player and/or each other
     *
     */
    cowTradingPhase() {
        this.createPlayerPurchaseCowDialog();
        let sellers = this.AIfarmers;
        sellers.append(this.player);
        for (let x = 0; x < this.AIfarmers.length; x++) {
            this.purchaseCow(this.AIfarmers[x], sellers);
        }

    }

    /*
    For farm in {0,1,…,8}
        Use N = cows[farm] - infections[farm]
        p = β * infections[farm] ÷ Cows[farm]
    Select n from Binomial distribution B( N,p)
        Increase Infections[farm] by n
     */

    cowInfectionPhase() {
        let allFarmers = this.getAllFarmers();
        for (let f = 0; f < allFarmers.length; f++) {
            // Determine number of infections in farmer herd
            let newInfections = 0;
            if ((!allFarmers[f].bfree) && (allFarmers[f].herd.length - allFarmers[f].infections >= 0)) {
                for (let c = 0; c < (allFarmers[f].herd.length - allFarmers[f].infections); c++) {
                    if (Math.Random() < (allFarmers[f].herdTotal / allFarmers[f].infections)) {
                        newInfections += 1;
                    }
                }
            }
        }

    }

    updateFarmers() {
        let allFarmers = this.getAllFarmers();
        for (let f = 0; f < allFarmers.length; f++) {
            allFarmers[f].balance += (allFarmers[f].herdTotal - allFarmers[f].infections);
            allFarmers[f].timeSinceLastSale += 1;
        }
    }
}
