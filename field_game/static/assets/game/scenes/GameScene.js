/*jshint esversion: 8 */
import {gameSettings} from "../cst.js";

import FieldScene from './FieldScene.js';
import Cow from '../actors/Cow.js';
import {AIFarmer, Player} from '../actors/Farmer.js';
import eventsCenter from "./EventsCenter.js";


export default class GameScene extends FieldScene {

    map;
    layers;

    // UI objects

    titleContainer;

    constructor() {
        super(gameSettings.SCENENAMES.GAMESCENENAME);
        this.herd = [];
        this.layers = [];
        // Player/farmer starts, where the cow pens are etc.
        // [[1, 51], [5, 7]],
        // [[33, 51], [5, 7]],
        // [4, 48],
        // , [36, 48]
        this.gameboardInfo = {
            playerCowPen: [[16, 9], [5, 7]],
            farmerCowPens: [
                [[1, 9], [5, 7]],
                [[33, 9], [5, 7]],
                [[1, 33], [5, 7]],
                [[33, 33], [5, 7]],

            ],
            player: {
                start: [20, 6],
                house: [[18, 1], 3, 4]
            },
            farmerStarts: [
                [4, 6], [4, 30], [36, 6], [36, 30]
            ],
            hospital: {
                extent: [[17, 28], [4, 3]],
                door: [19, 34]
            }
        };
        //Game rules and constants

        // State of this instance of game
        this.gameState = {
            currentTurn: 0,
            isOnBoarding: true, //Display help messages
            isGameBoardActive: false, // Is board clickable?
            lastTransactionOrderNo: 0,
            playerID: "TESTER",
            gameID: 110,
            infectionTotal:0,
        };
        // Zones on the game board
        this.gameboardZones = {};
        this.waitingForSetup = 0;

        // Log of all transactions in the game
        // For later export;
        this.log = "";

        /* Main player*/
        this.player = null;
        // Computer farmers (Farmer)
        this.AIFarmers = [];
        // Players for easy access
        this.allFarmers = [];
        //Herd of cows (Cow)
        this.herd = [];

    }


    /**
     * Write to game log
     * @param message
     */
    gameLog(message) {
        this.log += "\n" + message;
    }

    /**
     * playerID = models.CharField(null=True, blank=True, max_length=128)
     gameID = models.BigIntegerField(default=0)
     turn = models.IntegerField(default=0)
     orderno = models.IntegerField(default=0)
     event_type = models.ForeignKey("EventType", on_delete=models.SET_NULL, null=True)
     farmerA = models.ForeignKey(
     "Farmer", null=True, on_delete=models.SET_NULL, related_name="farmer_A"
     )
     farmerB = models.ForeignKey(
     "Farmer", null=True, on_delete=models.SET_NULL, related_name="farmer_B"
     )
     description = models.CharField(null=True, blank=True, max_length=128)
     * @param messageProps
     */
    logTransaction(messageProps) {
        // todo make this an api when we're ready
        messageProps.orderno = this.gameState.lastTransactionOrderNo;
        messageProps.turn = this.gameState.currentTurn;
        console.log(messageProps);
        this.gameState.lastTransactionOrderNo += 1;
    }


    getAllFarmers() {
        return this.allFarmers;
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

        // Add zones for hospital.
        //Hospital
        let hospitalExtent = this.gameboardInfo.hospital.extent;

        this.gameboardZones.hospitalZone = this.createZoneFromTiles(hospitalExtent).setOrigin(0, 0).setInteractive().on('pointerup', function (pointer, localX, localY) {
            if (this.gameState.isGameBoardActive) {
                // If board is touchable, record touch
                eventsCenter.emit(gameSettings.EVENTS.HOSPITALTOUCHED);
                console.log('H');
            }
        }, this);

    }

    createZoneFromTiles(tileExtent) {
        return this.add.zone(
            tileExtent[0][0] * this.BOARD_TILE_SIZE,
            tileExtent[0][1] * this.BOARD_TILE_SIZE,
            (tileExtent[1][0] + 1) * this.BOARD_TILE_SIZE,
            (tileExtent[1][1] + 1) * this.BOARD_TILE_SIZE,
        );
    }


    createPlayer() {
        // Player farm
        const startX = this.gameboardInfo.player.start[0] * this.BOARD_TILE_SIZE;
        const startY = (this.gameboardInfo.player.start[1] + 1) * this.BOARD_TILE_SIZE;
        let sprite = this.physics.add.sprite(startX, startY, 'farmer_1');
        sprite.setCollideWorldBounds(true);
        this.player = new Player(1, 'Player', gameSettings.gameRules.startFarmerBalance, sprite, this.gameboardInfo.player.start);
        this.player.infections = gameSettings.gameRules.startingInfections;
        let penZone = this.createZoneFromTiles(this.gameboardInfo.playerCowPen)
            .setOrigin(0, 0)
            .setInteractive().on('pointerup', function (pointer, localX, localY) {
                if (this.gameState.isGameBoardActive) {
                    // If board is touchable, record touch
                    eventsCenter.emit(gameSettings.EVENTS.PLAYERPENTOUCHED);
                    console.log('player');
                }
            }, this);
        this.player.setPenZone(penZone);
        this.allFarmers.push(this.player);
        //this.updatePlayerBalance(this.player.balance);

        eventsCenter.emit(gameSettings.EVENTS.PLAYERBALANCEUPDATED);
    }

    updatePlayerBalance(balance) {
        this.updateFarmerBalance(this.player, balance);
        this.scene.get(gameSettings.SCENENAMES.UISCENENAME).updateBalance(this.player.balance);
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
        let cowsPerPlayer = Math.floor(gameSettings.gameRules.startHerdSize / (gameSettings.gameRules.AIFarmerTotal + 1));
        this.debug(cowsPerPlayer + ' cows per player');
        let owner = this.player;
        let pen = this.gameboardInfo.playerCowPen;
        owner.pen = pen;

        for (let p = -1; p < gameSettings.gameRules.AIFarmerTotal; p++) {
            if (p >= 0) {
                owner = this.AIFarmers[p];
                pen = this.gameboardInfo.farmerCowPens[p];
                // Assign pen to the farmer
                owner.pen = pen;
            }
            for (let c = 0; c < cowsPerPlayer; c++) {
                let cow = this.createCow(owner, (19 * this.BOARD_TILE_SIZE), (34 * this.BOARD_TILE_SIZE));
                // Pick
                owner.herdTotal += 1;
                this.herd.push(cow);
            }
            owner.infections = 1;
            this.gameState.infectionTotal +=1;
        }

        eventsCenter.emit(gameSettings.EVENTS.PLAYERHERDUPDATED);
        return true;
    }

    createAIFarmer(id, name, balance, farmerStart, threshold) {

        let AISprite = this.physics.add.sprite(farmerStart[0] * this.BOARD_TILE_SIZE, (farmerStart[1] + 1) * this.BOARD_TILE_SIZE, 'farmer_2');
        AISprite.setCollideWorldBounds(true);
        //AISprite.setVisible(false);
        let aiFarmer = new AIFarmer(id, name, balance, AISprite, farmerStart, threshold);
        aiFarmer.infections = gameSettings.gameRules.startingInfections;
        this.AIFarmers.push(aiFarmer);
        this.allFarmers.push(aiFarmer);
        return aiFarmer;
    }

    createFarmers() {
        //let farm = this.add.image(this.GAME_WIDTH, 0, 'AI_farm').setOrigin(1, 0);
        for (let x = 0; x < gameSettings.gameRules.AIFarmerTotal; x++) {
            // Split evenly on left  and right side
            let aiFarmer = this.createAIFarmer(
                x, 'AI ' + (x + 1), gameSettings.gameRules.startFarmerBalance,
                this.gameboardInfo.farmerStarts[x], gameSettings.INFECTIONTHRESHOLDS[x]
            );
            let penZone = this.createZoneFromTiles(this.gameboardInfo.farmerCowPens[x])
                .setOrigin(0, 0)
                .setInteractive().on('pointerup', function (pointer, localX, localY) {
                    if (this.sprite.scene.gameState.isGameBoardActive) {
                        // If board is touchable, record touch
                        eventsCenter.emit(gameSettings.EVENTS.AIFARMERPENTOUCHED, this);
                        /*let zone = this.getPenZone();
                        let rect = new Phaser.Geom.Rectangle(zone.x,zone.y,zone.width,zone.height);
                        console.log(rect.getRandomPoint());*/
                    }
                }, aiFarmer);
            aiFarmer.setPenZone(penZone);

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

        this.uiScene = this.scene.get(gameSettings.SCENENAMES.UISCENENAME);

        // Main game board
        this.createGameBoard();


        // Pieces
        this.createPlayer();
        this.createFarmers();
        this.createHerd();

        this.startGameWhenSetupComplete();

    }

    /**
     * Move entire herd to their cow pens, if they're not there already
     */
    async sendAllHerdToPens() {
        return this.sendHerdToPens(this.herd);
    }

    async sendHerdToPens(cows) {
        let promiseArray = [];
        for (let c = 0; c < cows.length; c++) {
            promiseArray.push(cows[c].owner.sendCowToPen(cows[c]));
        }
        let done = await Promise.all(promiseArray);
        return true;
    }


    /**
     * Let all the board stuff happen
     * then call game start when ready
     * @return {Promise<void>}
     */
    async startGameWhenSetupComplete() {
        // Move pieces (currently just cows)
        await this.sendAllHerdToPens();

        this.uiScene.scoreboard.fillScoreBoard(this.getAllFarmers());
        this.setupComplete = true;

        // Launch phase scenes
        this.scene.launch(gameSettings.SCENENAMES.BFREESCENENAME);
        this.scene.launch(gameSettings.SCENENAMES.TRADINGSCENENAME);
        this.scene.launch(gameSettings.SCENENAMES.TURNENDSCENENAME);

        // UI Containers
        this.scene.bringToTop(gameSettings.SCENENAMES.UISCENENAME);
        // Start the game
        this.startGame();
    }

    /**
     * Board is set up and all pieces in place, start
     */
    startGame() {
        this.debug('Begin Game');
        // Create events
        this.addEvents();

        // todo restore
        this.startTurn();


    }

    startTurn() {
        this.gameState.currentTurn += 1;
        this.uiScene.displayTurn();
        eventsCenter.once(gameSettings.EVENTS.TURNSTART, function () {
            this.scene.get(gameSettings.SCENENAMES.BFREESCENENAME).bFreePhase();
        }, this);
    }

    /**
     * Add global click/touch events
     */
    addEvents() {
        this.input.on('pointerdown', this.handlePointerDown, this);
        //this.input.on('pointerup', this.handlePointerUp, this);
    }

    handlePointerDown() {
        // General advance used for dialogs
        if (!this.gameState.isGameBoardActive) {
            eventsCenter.emit(gameSettings.EVENTS.ADVANCEDIALOG);
        }
    }

    /*
    handlePointerUp(pointer) {
        if (this.gameState.isGameBoardActive) {
            let tile = this.map.getTileAtWorldXY(pointer.worldX, pointer.worldY);
            console.log(pointer.worldX, pointer.worldY, tile);
            eventsCenter.emit(gameSettings.EVENTS.ADVANCEDIALOG);
        }
    }*/

    /*
    DEPRECATED
    moveCows(delta) {
        let herd = this.herd;
        for (let c = 0; c < herd.length; c++) {
            if (herd[c].isMoving === true && herd[c].movePath.length > 0) {
                if (!herd[c].sprite.anims.isPlaying) {
                    herd[c].sprite.play('cow_walk_up');
                }
                if (herd[c].sinceLastMove >= gameSettings.gameRules.cowSpeed) {
                    // Move the cow
                    herd[c].doPathMove(herd[c].movePath[0], gameSettings.gameRules.cowSpeed);
                    herd[c].movePath.shift();
                    herd[c].sinceLastMove = 0;
                    if (herd[c].movePath.length === 0) {
                        // Reset our cows, give them a rest
                        herd[c].isMoving = false;
                        herd[c].sinceLastMove = 0;
                        herd[c].sprite.stop();
                    }
                } else {
                    //add delta
                    herd[c].sinceLastMove += delta;
                }
            }
        }
    }*/

    /** Wait until all the pieces are in place before
     starting
     */
    isSetupComplete() {
        let done = true;
        for (let c = 0; c < this.herd.length; c++) {
            if (this.herd[c].isMoving === true) {
                done = false;
                break;
            }
        }
        return done;
    }

    update(time, delta) {
        /* if (!this.setupComplete) {
             if (this.waitingForSetup + delta > 500) {
                 this.startGameWhenSetupComplete();
                 this.waitingForSetup = 0;
             } else {
                 this.waitingForSetup += delta;
             }
         }*/
        // todo add farm idle animations

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




    setIsGameBoardActive(isActive) {
        this.gameState.isGameBoardActive = isActive;
    }

    getIsGameBoardActive() {
        return this.gameState.isGameBoardActive;
    }


}
