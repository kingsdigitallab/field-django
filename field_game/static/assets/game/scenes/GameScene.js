/*jshint esversion: 8 */
import {gameSettings, States} from "../cst.js";

import FieldScene from './FieldScene.js';
import Cow from '../actors/Cow.js';
import {AIFarmer, Player} from '../actors/Farmer.js';
import eventsCenter from "./EventsCenter.js";
import {gameState} from '../GameState.js';
//import axios from "axios";


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
        this.gameboardInfo = gameSettings.gameboardInfo;
        //Game rules and constants

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

        // Random number and seed
        // Now fixed for consistent play.
        this.randomSeed = 0.8384816872011894; //Math.random();
        this.currentRandom = this.randomSeed;


    }


    /**
     * Write to game log
     * @param message
     */
    gameLog(message) {
        this.log += "\n" + message;
    }



    /**
     * Return a random between 0 and 1 based
     * on seed
     */
    seededRandom() {
        this.currentRandom = (this.currentRandom * 1000) % 89; //round(r/89)
        return this.currentRandom / 89;
    }

    /** Submit the game we've just created to the database via the api
     *
     */

    /*
    {
    "playerID": "1",
    "gameID": 1,
    "final_score": 0,
    "seed": 0.8887665,
    "log": "asdf"
}
     */
    logNewGame() {
        let playerID = localStorage.getItem('playerID');
        if (playerID != null && gameSettings.playerIDParam != null && gameSettings.playerIDParam.length > 0) {
            if (playerID === 'new') {
                playerID = 'TESTER';
            } else {
                gameSettings.playerIDParam = playerID;
            }

        }
        if (playerID == null) {
            playerID = 'TESTER';
        }


        // Control true by default
        let control = 1;
        gameState.control_group = control;
        let game_data = {
            final_score: '0',
            csrfmiddlewaretoken: sessionStorage.getItem('csrf_token'),
            creator_sessionid: sessionStorage.session_id,
            seed: this.randomSeed,
            control_group: control,
            infection_visible: 1,
            log: "Game started",
        };


        if (localStorage.getItem("playedBefore")) {
            // Set the floor to 1 as they've checked it on the form
            game_data.played_before = localStorage.getItem("playedBefore");

        }
        if (playerID !== null) {
            game_data.playerID = playerID;
        }

        let uiScene = this.uiScene;
        /*
        Get or create player
         */
        if (playerID != null) {

            // Get this player
            axios.get(gameSettings.apiURLs.farmer, {
                mode: 'same-origin',
                headers: {
                    'X-CSRFToken': sessionStorage.getItem('csrf_token')
                },
                params: {
                    playerID: playerID,
                }
            }).then(function (response) {
                gameState.gamesPlayed = response.data[0].gamesPlayed;
                gameState.playerID = response.data[0].playerID;
                game_data.playerID = gameState.playerID;
                localStorage.setItem('playerID', gameState.playerID);
                console.log(response.data[0].control_group == false);
                if (response.data[0].control_group == false) {
                    gameState.control_group = 0;
                }

                game_data.control_group = gameState.control_group;
                gameState.playerDatabaseID = response.data[0].id;
                if (gameState.control_group == 0 && gameState.gamesPlayed == gameSettings.gameRules.warmupRounds) {
                    gameState.infection_visible = 0;
                    game_data.infection_visible = 0;
                } else {
                    gameState.infection_visible = 1;
                }

                // Create new game record
                axios({
                    method: 'post',
                    mode: 'same-origin',
                    url: gameSettings.apiURLs.game,
                    headers: {
                        'X-CSRFToken': sessionStorage.getItem('csrf_token')
                    },
                    data: game_data
                })
                    .then(function (response) {
                        // handle success
                        if (response && response.data) {
                            gameState.gameID = response.data.gameID;
                            gameState.playerID = response.data.playerID;


                            if (response.data.seed && response.data.seed > 0) {
                                // Temporarily fixed (see note above)
                                //this.randomSeed = response.data.seed;
                            }


                        }
                    })
                    .catch(function (error) {
                        // handle error
                        console.log(error);
                    });

            });
        }


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
        /*let data = {
            'orderno': gameState.lastTransactionOrderNo,
            'turn': gameState.currentTurn,
            'csrfmiddlewaretoken': sessionStorage.getItem('csrf_token'),
            'creator_sessionid': sessionStorage.session_id
        };*/
        messageProps.gameID = gameState.gameID;
        messageProps.playerID = gameState.playerID;
        messageProps.orderno = gameState.lastTransactionOrderNo;
        messageProps.turn = gameState.currentTurn;
        messageProps.csrfmiddlewaretoken = sessionStorage.getItem('csrf_token');
        messageProps.creator_sessionid = sessionStorage.session_id;


        gameState.lastTransactionOrderNo += 1;
        axios({
            method: 'post',
            mode: 'same-origin',
            url: gameSettings.apiURLs.event,
            headers: {
                'X-CSRFToken': sessionStorage.getItem('csrf_token')
            },
            data: messageProps
        })
            .then(function (response) {
                // handle success
                //console.log(response);
            })
            .catch(function (error) {
                // handle error
                //console.log(error);
            });
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
        this.layers.pathLayer = this.map.createLayer('Paths', [tileset, modern], 0, 0);
        this.layers.decorationLayer = this.map.createLayer('Decoration', [tileset, modern], 0, 0);
        this.layers.buildingLayer = this.map.createLayer('Buildings', [tileset, modern], 0, 0);

        //Build Easystar js map
        // from https://www.dynetisgames.com/2018/03/06/pathfinding-easystar-phaser-3/
        // obstacles = 0, road = 1 , grass = 2
        let grid = [];
        for (var y = 0; y < (this.GAME_HEIGHT / this.BOARD_TILE_SIZE); y++) {
            let col = [];
            for (var x = 0; x < (this.GAME_WIDTH / this.BOARD_TILE_SIZE); x++) {
                // In each cell we store the ID of the tile, which corresponds
                // to its index in the tileset of the map ("ID" field in Tiled)
                //
                let tile = this.map.getTileAt(x, y, true, this.layers.pathLayer);
                // console.log(tile);
                if (tile.index >= 0) {
                    // Road/path
                    if (tile.properties && tile.properties.cost) {
                        col.push(2);
                    } else {
                        col.push(1);
                    }

                } else {
                    col.push(0);
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
            if (gameState.clickEnabled && gameState.currentState === States.BOVICHOOSE) {
                // If board is touchable, record touch
                eventsCenter.emit(gameSettings.EVENTS.HOSPITALTOUCHED);
                // console.log('H');
            }
        }, this);

    }

    createZoneFromTiles(tileExtent) {
        let extent = this.createExtentFromTiles(tileExtent);
        return this.add.zone(
            extent[0], extent[1], extent[2], extent[3]
        );
    }

    createExtentFromTiles(tileExtent) {
        return [
            tileExtent[0][0] * this.BOARD_TILE_SIZE,
            tileExtent[0][1] * this.BOARD_TILE_SIZE,
            (tileExtent[1][0] + 1) * this.BOARD_TILE_SIZE,
            (tileExtent[1][1] + 1) * this.BOARD_TILE_SIZE,
        ];
    }


    createPlayer() {
        // Player farm
        const startX = this.gameboardInfo.player.start[0] * this.BOARD_TILE_SIZE;
        const startY = (this.gameboardInfo.player.start[1] + 1) * this.BOARD_TILE_SIZE;
        let playerSprite = this.physics.add.sprite(
            startX,
            startY,
            gameSettings.CHARACTER_KEY,
            gameState.playerSpriteKeyFrame
        ).setScale(gameSettings.CHARACTERSPRITESCALE);
        playerSprite.depth = 1;

        playerSprite.setCollideWorldBounds(true);
        this.player = new Player(1, 'Player', gameSettings.gameRules.startFarmerBalance, playerSprite, this.gameboardInfo.player.start);
        this.player.portrait = gameState.playerPortrait;
        this.player.infections = gameSettings.gameRules.startingInfections;
        let penZone = this.createZoneFromTiles(this.gameboardInfo.playerCowPen)
            .setOrigin(0, 0)
            .setInteractive();
        this.player.setPenZone(penZone);
        this.allFarmers.push(this.player);
        //this.updatePlayerBalance(this.player.balance);
        gameState.player = this.player;


    }

    updatePlayerBalance(balance) {
        this.updateFarmerBalance(this.player, balance);
        this.scene.get(gameSettings.SCENENAMES.UISCENENAME).updateBalance(this.player.balance);
    }

    updateFarmerBalance(farmer, balance) {
        farmer.balance = balance;
    }

    createCow(owner, startX, startY) {
        let sprite = this.physics.add.sprite(
            startX,
            startY, 'cow_walk_0'
        );
        sprite.setScale(gameSettings.gameRules.cowScale);
        sprite.setCollideWorldBounds(true);
        return new Cow(owner, sprite);
    }


    /**
     * Creat the default herd
     * All cows split evenly amongst players
     * Currently default cows are NOT sick and NOT bovifree
     */
    async createHerd() {
        this.debug('Creating herd...');
        // Even split for now
        let cowsPerPlayer = Math.floor(gameSettings.gameRules.startHerdSize / (gameSettings.gameRules.AIFarmerTotal + 1));
        this.debug(cowsPerPlayer + ' cows per player');
        let owner = this.player;
        let pen = this.gameboardInfo.playerCowPen;
        owner.pen = pen;


        for (let p = -1; p < gameSettings.gameRules.AIFarmerTotal; p++) {
            let playerHerd = [];
            if (p >= 0) {
                owner = this.AIFarmers[p];
                pen = this.gameboardInfo.farmerCowPens[p];
                // Assign pen to the farmer
                owner.pen = pen;
            }
            //let spawnOrigin = owner.getPenTile(0);
            //+ (16 * gameSettings.gameRules.cowScale)
            //let spawnPoint = spawnOrigin;
            owner.makePenPoints(20, 4);

            for (let c = 0; c < cowsPerPlayer; c++) {
                let spawnPoint = owner.cowPenPoints[c].tileXY;
                let cow = this.createCow(
                    owner,
                    ((spawnPoint[0]) * this.BOARD_TILE_SIZE),
                    (spawnPoint[1] * this.BOARD_TILE_SIZE)
                );
                cow.homePen = owner.cowPenPoints[c];
                cow.homePen.cow = cow;
                cow.homePen.occupied = true;
                // Pick
                owner.herdTotal += 1;
                this.herd.push(cow);
                playerHerd.push(cow);

            }
            owner.infections = 1;
            gameState.infectionTotal += 1;

        }

        return true;
    }

    createAIFarmer(id, name, balance, farmerStart, threshold, spriteKey, spriteFrame, portraitKey) {

        let AISprite = this.physics.add.sprite(
            farmerStart[0] * this.BOARD_TILE_SIZE, (farmerStart[1] + 1) * this.BOARD_TILE_SIZE, spriteKey, spriteFrame
        ).setScale(gameSettings.CHARACTERSPRITESCALE);
        AISprite.setCollideWorldBounds(true);
        //AISprite.setVisible(false);
        let aiFarmer = new AIFarmer(
            id, name, balance, AISprite, farmerStart, threshold
        );
        aiFarmer.portrait = portraitKey;
        aiFarmer.infections = gameSettings.gameRules.startingInfections;
        this.AIFarmers.push(aiFarmer);
        this.allFarmers.push(aiFarmer);
        return aiFarmer;
    }

    /**
     * return keys of farmer sprites not including one chosen
     * by player
     */
    getAIFarmerSpriteKeys() {
        let spriteKeys = [];
        for (const [key, value] of Object.entries(gameSettings.CHARACTER_FRAMES)) {
            if (value !== gameState.playerSpriteKeyFrame) {
                spriteKeys.push(key);
            }
        }
        // Quick and simple randomize
        // From https://stackoverflow.com/questions/2450954/how-to-randomize-shuffle-a-javascript-array
        let shuffled = spriteKeys
            .map(value => ({value, sort: Math.random()}))
            .sort((a, b) => a.sort - b.sort)
            .map(({value}) => value);
        return shuffled;
    }

    createFarmers() {
        //let farm = this.add.image(this.GAME_WIDTH, 0, 'AI_farm').setOrigin(1, 0);

        let spriteKeys = this.getAIFarmerSpriteKeys();
        for (let x = 0; x < gameSettings.gameRules.AIFarmerTotal; x++) {
            // Split evenly on left  and right side
            let aiFarmer = this.createAIFarmer(
                x, 'AI ' + (x + 1), gameSettings.gameRules.startFarmerBalance,
                this.gameboardInfo.farmerStarts[x], gameSettings.INFECTIONTHRESHOLDS[x],
                'creature_farmers', gameSettings.CHARACTER_FRAMES[spriteKeys[x]],
                spriteKeys[x]
            );

            let penZone = this.createZoneFromTiles(this.gameboardInfo.farmerCowPens[x])
                .setOrigin(0, 0)
                .setInteractive();
            aiFarmer.setPenZone(penZone);
            let highlightExtent = this.createExtentFromTiles(this.gameboardInfo.farmerCowPenHighlights[x]);
            aiFarmer.makePenZoneHighlight(this, highlightExtent);
            aiFarmer.highlightPenZone(this);

        }
    }


    preload() {
        //this.load.scenePlugin('rexuiplugin', '/static/assets/game/plugins/rexuiplugin.min.js', 'rexUI', 'rexUI');
    }


    async create() {
        // ### Pathfinding stuff ###
        // Initializing the pathfinder
        this.setupComplete = false;
        this.finder = new EasyStar.js();
        this.finder.enableCornerCutting(false);
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
        return this.sendHerdToHomePen(this.herd);
    }

    /** Move a herd (array) of cows to their home pens
     * Used to move traded cows to their new homes
     *
     * @param cows
     * @return {Promise<boolean>}
     */
    async sendHerdToHomePen(cows) {
        let promiseArray = [];
        // cows[c].owner.sendCowToPen(cows[c])
        for (let c = 0; c < cows.length; c++) {
            promiseArray.push(cows[c].sendCowToHomePen()
            );
        }
        let done = await Promise.all(promiseArray);


        return true;
    }

    /** Our spinning coin animation to show
     * money being made and spent
     *
     * @param x sprite x
     * @param y sprite y
     * @param number how many coins we're showing
     * @param reverse forward is up (spend) reverse is down (make)
     */
    coinAnimation(x, y, number, reverse) {
        let deltaY = y - 176;
        if (reverse) {
            y -= 176;
            deltaY = y + 176;
        }
        for (let c = 0; c < number; c++) {

            let coinSprite = this.physics.add.sprite(
                x, y, 'coin', 0
            ).setScale(0.75);
            coinSprite.play({key: 'coin_up'});

            this.tweens.add(
                {
                    targets: coinSprite,
                    ease: 'Power1',
                    y: {value: deltaY, duration: 1000},
                    onComplete: function () {
                        this.targets[0].destroy();
                    },
                    delay: 200 * c
                }
            );

        }
    }


    calculateFarmerIncome(farmer){
        return (farmer.herdTotal - farmer.infections);
    }
    /**
     * Let all the board stuff happen
     * then call game start when ready
     * @return {Promise<void>}
     */
    async startGameWhenSetupComplete() {
        // Move pieces (currently just cows)
        //await this.sendAllHerdToPens();
        this.setupComplete = true;
        this.logNewGame();


        this.uiScene.scoreboard.fillScoreBoard(this.getAllFarmers());


        // Launch phase scenes

        this.scene.launch(gameSettings.SCENENAMES.BFREESCENENAME);
        this.scene.launch(gameSettings.SCENENAMES.TRADINGSCENENAME);
        this.scene.launch(gameSettings.SCENENAMES.TURNENDSCENENAME);

        // UI Containers
        this.scene.bringToTop(gameSettings.SCENENAMES.UISCENENAME);

        // Player display and infections
        this.uiScene.createPlayerInfo();
        //this.uiScene.createInfectionInfo();


        // Create events
        this.addEvents();

        // Start the game
        this.startGame();


    }

    /**
     * Board is set up and all pieces in place, start
     */
    startGame() {
        this.debug('Begin Game');
        this.startTurn();
    }

    startTurn() {
        gameState.currentTurn += 1;
        // Infection at start of turn so we can show change at summary
        gameState.infectionStart = gameState.infectionTotal;
        this.uiScene.displayTurn();
    }

    /**
     * Add global click/touch events
     */
    addEvents() {
        eventsCenter.on(gameSettings.EVENTS.TURNSTART, function () {
            this.scene.get(gameSettings.SCENENAMES.BFREESCENENAME).bFreePhase();
            //this.scene.get(gameSettings.SCENENAMES.TURNENDSCENENAME).turnEndPhase();
        }, this);
    }

    handlePointerDown() {
        // General advance used for dialogs
        /*if (!gameState.isGameBoardActive) {
            eventsCenter.emit(gameSettings.EVENTS.ADVANCEDIALOG);
        }*/
    }

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

        // todo add farm idle animations

    }


}
