/*jshint esversion: 6 */
import FieldScene from './FieldScene.js';

const COLOR_PRIMARY = 0x4e342e;
const COLOR_LIGHT = 0x7b5e57;
const COLOR_DARK = 0x260e04;

// Game classes
class Farmer {
    id = 0;
    name = '';
    balance = 0;
    sprite = null;
    farm = null;

    constructor(id, name, balance, sprite, farm) {
        this.id = id;
        this.name = name;
        this.balance = balance;
        this.sprite = sprite;
        this.farm = farm;
    }
}

class Player extends Farmer {
    constructor(id, name, balance, sprite, farm) {
        super(id, name, balance, sprite);
    }
}

class Cow {
    owner = null;
    isBoviFree = false;
    isSick = false;
    sprite = null;
    isMoving = false;
    movePath = null;

    constructor(owner, boviFree, isSick, sprite) {
        this.owner = owner;
        this.isBoviFree = boviFree;
        this.isSick = isSick;
        this.sprite = sprite;
    }

    // Move to 5, 10
    /*

      this.debug(startTile);

      this.finder.calculate();*/

    getMoveDirection(startX, startY, newX, newY) {
        // Figure out the change in direction
        let deltaX = newX - startX;
        let deltaY = newY - startY;
        let angle = 0;

        if (deltaX === 0) {
            if (deltaY < 0) {
                // Up
                angle = 0;
            } else if (deltaY > 0) {
                //Down
                angle = 180
            }
        }
        if (deltaY === 0) {
            if (deltaX < 0) {
                // left
                angle = 270;
            } else if (deltaX > 0) {
                //right
                angle = 90
            }
        }
        if (deltaX > 0 && deltaY < 0) {
            //up-right
            angle = 45;
        }
        if (deltaX > 0 && deltaY > 0) {
            //bottom-right
            angle = 135;
        }
        if (deltaX < 0 && deltaY < 0) {
            //up-left
            angle = 315;
        }
        if (deltaX < 0 && deltaY > 0) {
            //bottom-left
            angle = 225;
        }
        return angle;

    }

    /**
     * Move the cow the next step in its path
     * @param path easystarjs path
     */


    updateCowSprite(tween) {
        let sprite = tween.targets[0];
        let angle = tween.data[0].getEndValue();

        let animationName = null;
        if (angle > 270 && angle <= 90) {
            animationName = 'cow_walk_up';
        } else if (angle > 90 && angle <= 270) {
            animationName = 'cow_walk_down';
        }
        if (animationName) {
            //onsole.log(animationName);
            //sprite.anims.play(animationName);
        }


    }

    startCowSprite(tween) {
        tween.targets[0].play('cow_walk_up');
    }


    stopCowSprite(tween) {
        tween.targets[0].anims.stop();
    }

    /**
     * Move the cow from current position with easystarjs
     *
     * @param {Tile} DestinationTile
     */
    calculateCowPath(destinationTile) {
        let cow = this;
        let scene = cow.sprite.scene;
        let startTile = cow.sprite.scene.map.getTileAtWorldXY(cow.sprite.x, cow.sprite.y, cow.sprite.scene.layers['pathLayer']);
        cow.sprite.scene.finder.findPath(startTile.x, startTile.y, destinationTile.x, destinationTile.y, function (path) {
            if (path === null) {
                console.log("Path was not found.");
            } else {
                let timeline = cow.sprite.scene.tweens.createTimeline();
                //let currentRotation= cow.sprite.rotation;
                let startX = (startTile.x * cow.sprite.scene.BOARD_TILE_SIZE);
                let startY = (startTile.y * cow.sprite.scene.BOARD_TILE_SIZE);
                let currentAngle = cow.sprite.angle;
                for (let i = 0; i < path.length - 1; i++) {
                    let ex = path[i + 1].x;
                    let ey = path[i + 1].y;
                    let newX = ex * cow.sprite.scene.BOARD_TILE_SIZE
                    let newY = ey * cow.sprite.scene.BOARD_TILE_SIZE
                    let angle = cow.getMoveDirection(startX, startY, newX, newY);
                    let diff = angle - currentAngle;
                    //console.log(currentAngle + diff);
                    if (angle !== currentAngle) {
                        if (diff < -180) {
                            diff += 360;
                        } else if (diff > 180) {
                            diff -= 360;
                        }
                        timeline.add({
                            targets: cow.sprite,
                            ease: 'Linear',
                            angle: {value: currentAngle + diff, duration: 200},
                        });
                        currentAngle = currentAngle + diff;
                    }
                    let moveTween = {
                        targets: cow.sprite,
                        ease: 'Power1',
                        x: {value: newX, duration: 200},
                        y: {value: newY, duration: 200},
                    }
                    if (i === 0) {
                        moveTween.onStart = cow.startCowSprite;
                    } else if (i === path.length - 2) {
                        // Last step, add stop sprite on complete
                        moveTween.onComplete = cow.stopCowSprite;
                    }
                    timeline.add(moveTween);
                    // Update starting point for next tween
                    startX = newX;
                    startY = newY;

                }
                timeline.play();
            }
        });
        cow.sprite.scene.finder.calculate();
    }

}


export default class GameScene extends FieldScene {

    map;
    layers;

    // UI objects
    scoreboardContainer;
    scoreboardBackground;
    scoreboardTitle;
    scoreboardText;
    titleContainer;

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
        this.layers['buildingLayer'] = this.map.createLayer('Buildings', tileset, 0, 0);
        this.layers['pathLayer'] = this.map.createLayer('Paths', tileset, 0, 0);
        this.layers['playerLayer'] = this.map.createLayer('Players', tileset, 0, 0);
        // Hidden as we only want information about starting points here
        //this.layers['playerLayer'].setVisible(false);
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
                let tile = this.map.getTileAt(x, y, true, this.layers['buildingLayer']);
                if (tile.index >= 0) {
                    // Building, fence, or other obstacle
                    col.push(0);
                } else {
                    tile = this.map.getTileAt(x, y, true, this.layers['pathLayer']);
                    if (tile.index >= 0) {
                        // Road/path
                        col.push(1)
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
        //let playerFarm = this.add.image(this.GAME_WIDTH / 2, 0, 'player_farm').setOrigin(0.5, 0);
        let sprite = this.physics.add.sprite(playerFarm.getCenter().x, playerFarm.getCenter().y - this.BOARD_TILE_SIZE, 'farmer_1');
        sprite.setCollideWorldBounds(true);
        this.player = new Player(1, 'Player', 0, sprite, playerFarm)
    }

    createCow(owner, boviFree, isSick) {
        let sprite = this.physics.add.sprite(this.GAME_WIDTH / 2, this.GAME_HEIGHT / 2, 'cow_1');
        let cow = new Cow(owner, boviFree, isSick, sprite)
    }

    /**
     * Creat the default herd
     * All cows split evenly amongst players
     * Currently default cows are NOT sick and NOT bovifree
     */
    createHerd() {
        this.debug('Creating herd...')
        // Even split for now
        let cowsPerPlayer = Math.floor(this.startHerdSize / (this.AIFarmerTotal + 1));
        this.debug(cowsPerPlayer + ' cows per player')
        let owner = this.player;
        let startingX = (this.GAME_WIDTH / 2) - (cowsPerPlayer / 2 * 34);
        let startingY = this.GAME_HEIGHT / 2;
        //this.player
        //this.AIfarmers
        for (let p = -1; p < this.AIFarmerTotal; p++) {
            if (p >= 0) {
                owner = this.AIfarmers[p];
            }
            for (let c = 0; c < cowsPerPlayer; c++) {
                this.herd.push(new Cow(owner, false, false, this.physics.add.sprite(startingX + (c * 34), startingY + (p * 34), 'cow_1')));
            }
        }

    }

    createAIFarmer(id, name, balance, createX, createY, isLeft) {
        let originX = 0;
        let imageKey = 'AI_farm_left';
        if (!isLeft) {
            originX = 1;
            imageKey = 'AI_farm_right';
        }
        // let farm = this.add.image(createX, createY, imageKey).setOrigin(originX, 0);
        // todo figure out where the AI starts
        let startX = createX + (farm.displayWidth / 2);
        if (!isLeft) {
            startX = createX - (farm.displayWidth / 2);
        }
        //6Y
        //3X
        let startY = createY + (farm.displayHeight / 2) - this.BOARD_TILE_SIZE;
        let AISprite = this.physics.add.sprite(startX, startY, 'farmer_2');
        AISprite.setCollideWorldBounds(true);
        //AISprite.setVisible(false);
        this.AIfarmers.push(new Farmer(id, name, balance, AISprite, farm));
    }

    createFarmers() {
        //let farm = this.add.image(this.GAME_WIDTH, 0, 'AI_farm').setOrigin(1, 0);
        for (let x = 0; x <= (this.AIFarmerTotal / 2); x++) {
            // Split evenly on left  and right side
            this.createAIFarmer(x, 'AI ' + (x + 1), this.startFarmerBalance, this.farmPaddingX, (this.GAME_HEIGHT / 4) * x, true);
            this.createAIFarmer(x + 1, 'AI ' + (x + 2), this.startFarmerBalance, this.GAME_WIDTH - this.farmPaddingX, (this.GAME_HEIGHT / 4) * x, false);
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
        this.createHerd();
        //this.createPlayer();
        //this.createFarmers()

        // UI Containers
        //this.createScoreboard();

        const cow = this.herd[0];
        /*for (let x = 0; x < (this.MAX_WIDTH / 16); x++) {
          for (let y = 0; y < (this.MAX_HEIGHT / 16); y++) {
            if (this.map.getTileAt(x,y, true, this.layers['Paths']) != null){
              console.log(x+'::'+y);
            }
          }
        }*/
        //console.log(this.map.getTileAt(7,12, true, this.layers['Paths']));
        //cow.calculateCowPath(this.map.getTileAt(30, 30, true, this.layers['Paths']));
        //cow.sprite.play('cow_walk_left');

        /*let tween = this.tweens.add({
                targets: cow,
                ease: 'Power1',
                x: {value: 800, duration: 500},
                y: {value: 600, duration: 500}
              });
        tween.play();*/


        this.bovifreePhase();


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

    /* Gameplay flow functions */

    /*
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
        //this.scoreboardTitle.text = "Pay Bovifree fee (£" + this.bfreeJoinCost + ") this turn ?";
        //const prompt_yes = this.add.text(50, 0, 'Yes', {fontFamily: 'PressStart2P'});
        //const prompt_no = this.add.text(-50, 0, 'No', {fontFamily: 'PressStart2P'});
        // helloButton.on('pointerover', () => { console.log('pointerover'); });
        /*this.scoreboardContainer.add(prompt_yes);
        this.scoreboardContainer.add(prompt_no);
        prompt_yes.on('pointerdown', function (pointer) {
            this.setTint(0xff0000);
            console.log('sdf');
        });*/
        /*let buttons = this.rexUI.add.buttons({
            x: 100, y: 300,
            orientation: 'x',

            buttons: [
                this.createButton(this, 'No'),
                this.createButton(this, 'Yes'),
            ],
            expand: true,

            space: {item: 8}

        });

        buttons
            .on('button.click', function (button, index, pointer, event) {
                console.log(button.text);

            });*/


        this.createBoviDialog();


    }

    createBoviDialog() {
        let boviDialog = this.createDialog(
            'Join BoviFree?',
            '£40 to innoculate your herd this turn',
            [this.createLabel(this, 'Yes'),
                this.createLabel(this, 'No')]
        );
        boviDialog
            .on('button.click', function (button, groupName, index) {
                //this.print.text += index + ': ' + button.text + '\n';
                console.log(button.text);
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


    cowTradingPhase() {

    }

    cowInfectionPhase() {

    }

    updateFarmers() {

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


};
