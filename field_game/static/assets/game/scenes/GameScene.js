/*jshint esversion: 6 */
import FieldScene from './FieldScene.js';
import Cow from '../actors/Cow.js';
import {Farmer, Player} from '../actors/Farmer.js'

const COLOR_PRIMARY = 0x4e342e;
const COLOR_LIGHT = 0x7b5e57;
const COLOR_DARK = 0x260e04;






export default class GameScene extends FieldScene {

    map;
    layers;

    // UI objects
    scoreboardContainer;
    scoreboardBackground;
    scoreboardTitle;
    scoreboardText;
    titleContainer;
    // Player/farmer starts, where the cow pens are etc.
    gameboardInfo;

    // Board creation settings
    farmPaddingX = 16;

    //Game rules and constants
    startHerdSize = 20;
    startFarmerBalance = 200;
    AIFarmerTotal = 6;
    totalRounds = 8;

    bfreeJoinCost = 40; // Cost to join scheme
    // Cow prices, buy and sell
    bfreeCowPrice = 30;
    normalCowPrice = 20;


    /* Main player*/
    player;
    // Computer farmers (Farmer)
    AIfarmers;
    //Herd of cows (Cow)
    herd;

    constructor() {
        super('Game');
        this.AIfarmers = [];
        this.herd = [];
        this.layers = [];
        this.gameboardInfo= {
            playerCowPen:[[16,9], 5, 7],
            farmerCowPens:[
                [[1,9], 5, 7],
                [[33,9], 5, 7],
                [[1,33], 5, 7],
                [[33,33], 5, 7],
                [[1,51], 5, 7],
                [[33,51], 5, 7],
            ],
            farmerStarts:[]
        };
    }

    /* setup functions */


    /**
     * Scoreboard with all player/AI totals
     */
    createScoreboard() {
        this.scoreboardContainer = this.add.container(this.GAME_WIDTH / 2, this.GAME_HEIGHT / 2);
        this.scoreboardBackground = this.add.rectangle(0, 0, this.GAME_WIDTH / 2, this.GAME_HEIGHT / 2, 0x000000, 0.5);
        this.scoreboardTitle = this.add.text(0, 0, 'BoviFlu game', {fontFamily: 'PressStart2P'});
        this.scoreboardText = this.add.text(0, 0, 'Press Start', {fontFamily: 'PressStart2P'});
        this.scoreboardText.setOrigin(0.5, 0.5);
        this.scoreboardTitle.setOrigin(0.5, 0.5);
        this.scoreboardContainer.add(this.scoreboardBackground);
        this.scoreboardContainer.add(this.scoreboardTitle);
        this.scoreboardContainer.add(this.scoreboardText);

        Phaser.Display.Align.In.TopCenter(
            this.scoreboardTitle, this.scoreboardBackground
        );
        // Start hidden
        //this.scoreboardContainer.setVisible(false);
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
        // Buildings and fences
        this.layers['pathLayer'] = this.map.createLayer('Paths', tileset, 0, 0);
        this.layers['buildingLayer'] = this.map.createLayer('Buildings', tileset, 0, 0);

        // this.layers['playerLayer'] = this.map.createLayer('Players', tileset, 0, 0);
        // this.layers['playerLayer'].setVisible(false);
        // Hidden as we only want information about starting points here
        //
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
                if (tile && tile.properties){
                    if (tile.properties.playerStart && tile.properties.playerStart === true){
                        this.gameboardInfo.playerStart = [x, y];
                    }
                    if (tile.properties.farmerStart && tile.properties.farmerStart === true){
                        this.gameboardInfo.farmerStarts.push([x,y]);
                    }
                }
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
        const startX = this.gameboardInfo.playerStart[0]*this.BOARD_TILE_SIZE;
        const startY = (this.gameboardInfo.playerStart[1]+1)*this.BOARD_TILE_SIZE;
        let sprite = this.physics.add.sprite(startX, startY, 'farmer_1');
        sprite.setCollideWorldBounds(true);
        this.player = new Player(1, 'Player', this.startFarmerBalance, sprite, this.gameboardInfo.playerStart);
    }

    createCow(owner, boviFree, isSick, startX, startY) {
        let sprite = this.physics.add.sprite(startX, startY,  'cow_1');
        sprite.setCollideWorldBounds(true);
        return new Cow(owner, boviFree, isSick, sprite);
    }

    /**
     * Find a point in a player pen for a cow
     * that IS NOT currently occupied by another cow
     * @param penTileCoords top left of pen
     * @param width width of pen
     * @param height of pen
     * @return [x,y] coordinates
     */
    findFreePenPoint(penTileCoords,width,height){
        let freePenPoint = [
            penTileCoords[0] + Math.round(Math.random()*width),
            penTileCoords[1] + Math.round(Math.random()*height)
        ];
        // todo Make sure no cow shares this?

        return freePenPoint;
    }

    /**
     * Creat the default herd
     * All cows split evenly amongst players
     * Currently default cows are NOT sick and NOT bovifree
     */
    createHerd() {
        this.debug('Creating herd...');
        // Even split for now
        let cowsPerPlayer = Math.floor(this.startHerdSize / (this.AIFarmerTotal + 1));
        this.debug(cowsPerPlayer + ' cows per player');
        let owner = this.player;
        let pen = this.gameboardInfo.playerCowPen;
        for (let p = -1; p < this.AIFarmerTotal; p++) {
            if (p >= 0) {
                owner = this.AIfarmers[p];
                pen = this.gameboardInfo.farmerCowPens[p];
            }
            for (let c = 0; c < cowsPerPlayer; c++) {
                let cow = this.createCow(owner, false, false, this.GAME_WIDTH / 2, (this.GAME_HEIGHT / 2) + (c * this.COW_TILE_SIZE));
                // Pick
                let penPoint = this.findFreePenPoint(
                    pen[0], pen[1], pen[2]
                );
                cow.moveCow(
                    penPoint[0], penPoint[1]
                );

                this.herd.push(cow);
            }
        }

        /*
        let startingX = (this.GAME_WIDTH / 2) - (cowsPerPlayer / 2 * 34);
        let startingY = this.GAME_HEIGHT / 2;
        //this.player
        //this.AIfarmers


        }*/



        //cow.moveCow(18,18);

    }

    createAIFarmer(id, name, balance, farmerStart) {

        let AISprite = this.physics.add.sprite(farmerStart[0] * this.BOARD_TILE_SIZE, (farmerStart[1]+1)  * this.BOARD_TILE_SIZE, 'farmer_2');
        AISprite.setCollideWorldBounds(true);
        //AISprite.setVisible(false);
        this.AIfarmers.push(new Farmer(id, name, balance, AISprite, farmerStart));
    }

    createFarmers() {
        //let farm = this.add.image(this.GAME_WIDTH, 0, 'AI_farm').setOrigin(1, 0);
        for (let x = 0; x < this.AIFarmerTotal; x++) {
            // Split evenly on left  and right side

            this.createAIFarmer(x, 'AI ' + (x + 1), this.startFarmerBalance, this.gameboardInfo.farmerStarts[x]);

        }
    }


    preload() {
        this.load.scenePlugin('rexuiplugin', '/static/assets/game/plugins/rexuiplugin.min.js', 'rexUI', 'rexUI');
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


    create() {
        // ### Pathfinding stuff ###
        // Initializing the pathfinder
        this.finder = new EasyStar.js();


        // Main game board
        this.createGameBoard();

        // Pieces
        this.createPlayer();
        this.createFarmers();
        this.createHerd();

        // UI Containers
        //this.createScoreboard();

        //this.bovifreePhase();


    }

    update() {
        // Move any cows that should be moved
        // todo only call during move phase!
        /*let stillMoving = false;
        let maxSteps = 0;
        for (let c = 0; c < this.herd.length; c++) {
          if (this.herd[c].isMoving) {
            if (this.herd[c].movePath.length > maxSteps) {
              maxSteps = this.herd[c].movePath.length;
            }
          }
        }
        let herd = this.herd
        if (maxSteps > 0) {
           let timer = this.time.addEvent({
              delay: 500,                // ms
              callback: function () {
                for (let c = 0; c < herd.length; c++) {
                  if (herd[c].isMoving) {
                    herd[c].moveCow(timer.getRepeatCount());
                  }
                }
                console.log(timer.getRepeatCount());
              },
              loop: false,
              repeat: maxSteps,
              startAt: 0,
              timeScale: 1,
              paused: false
            });
        }*/

    }

    createLabel(scene, text) {
        return scene.rexUI.add.label({
            // width: 40,
            // height: 40,

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

    createBoviDialog() {
        let boviDialog = this.createDialog(
            'Join BoviFree?',
            '£40 to innoculate your herd this turn',
            [this.createLabel(this, 'Yes'),
                this.createLabel(this, 'No')]
        );
        let player = this.player;

        boviDialog
            .on('button.click', function (button, groupName, index) {
                let decision = button.text;
                if (decision === "Yes") {
                    // Subtract the cost
                    console.log("Joining Bovi Free");
                    player.balance -= this.bfreeJoinCost;
                    // Remove infection from cattle
                    for (let h = 0; h < this.herd.length; h++) {
                        if (this.herd[h].owner === player) {
                            this.herd[h].isBoviFree = true;
                            this.herd[h].isSick = false;
                        }
                    }
                }

            }, this)
            .on('button.over', function (button, groupName, index) {
                button.getElement('background').setStrokeStyle(1, 0xffffff);
            })
            .on('button.out', function (button, groupName, index) {
                button.getElement('background').setStrokeStyle();
            });

        return boviDialog;
    }


    createDialog(title, text, buttons) {
        const w = this.scale.width;
        const h = this.scale.height;
        let dialog = this.rexUI.add.dialog({


            background: this.rexUI.add.roundRectangle(0, 0, 100, 100, 20, 0x1565c0),

            title: this.rexUI.add.label({
                background: this.rexUI.add.roundRectangle(0, 0, 100, 40, 20, 0x003c8f),
                text: this.add.text(0, 0, title, {
                    fontSize: '24px'
                }),
                space: {
                    left: 15,
                    right: 15,
                    top: 10,
                    bottom: 10
                }
            }),
            anchor: {

                centerX: 'center',
                centerY: 'center',

            },

            content: this.add.text(0, 0, text, {
                fontSize: '24px'
            }),

            actions: [this.createLabel(this, 'Yes'),
                this.createLabel(this, 'No')],

            space: {
                title: 25,
                content: 25,
                action: 15,

                left: 20,
                right: 20,
                top: 20,
                bottom: 20,
            },

            align: {
                actions: 'right', // 'center'|'left'|'right'
            },

            expand: {
                content: false, // Content is a pure text object
            }
        })
            .layout()
            // .drawBounds(this.add.graphics(), 0xff0000)
            .popUp(1000);

        return dialog;
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

    bovifreePhase() {
        this.createBoviDialog();
    }



    cowTradingPhase() {

    }

    /*
    For farm in {0,1,…,8}
        Use N = cows[farm] - infections[farm]
        p = β * infections[farm] ÷ Cows[farm]
    Select n from Binomial distribution B( N,p)
        Increase Infections[farm] by n
     */

    cowInfectionPhase() {

    }

    updateFarmers() {

    }




};
