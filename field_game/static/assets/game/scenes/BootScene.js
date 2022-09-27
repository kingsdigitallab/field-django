/*jshint esversion: 8 */
import FieldScene from './FieldScene.js';
import {gameSettings} from "../cst.js";
import DialogModalPlugin from "../plugins/field/DialogModalPlugin.js";

export default class BootScene extends FieldScene {

    // Debugger toggle
    DEBUG = true;

    // Turn on logging of games (through db api calls)
    LOGGER = true;
    ASSET_URL = "/static/assets/game";


    constructor() {
        super('BootScene');
        this.collectEvents();
    }

    /** Collect events from other scenes/plugins
     *  into central repo for use by scenes
     */
    collectEvents(){
        // Collect events
        // todo make this a part of the standard template
        gameSettings.EVENTS = Object.assign({}, gameSettings.EVENTS, DialogModalPlugin.getEvents());
        console.log(gameSettings.EVENTS);

    }

    preload() {
        this.loadAssets();
    }

    loadAssets() {

        // Farmers
        this.load.spritesheet('farmer_1',
            this.ASSET_URL + '/textures/farmer_1.png',
            {frameWidth: 32, frameHeight: 32}
        );

        this.load.spritesheet('farmer_2',
            this.ASSET_URL + '/textures/farmer_2.png',
            {frameWidth: 32, frameHeight: 32}
        );

       this.load.spritesheet('creature_farmers',
            this.ASSET_URL + '/sprites/TL_Creatures.png',
            {frameWidth: 32, frameHeight: 32}
        );


        // Animals
        this.load.spritesheet('cow_1',
            '/static/assets/game/textures/cow_walk_64.png',
            {frameWidth: 64, frameHeight: 64}
        );

        // Coin
        this.load.spritesheet('coin',
            '/static/assets/game/sprites/coins.png',
            {frameWidth: 40, frameHeight: 44}
        );





        // Decorations (Grass, buildings, trees, fences, etc.)
        this.load.image('grass', this.ASSET_URL + '/textures/grass_1.png');

        // Hospital and house for flashing highlights
        this.load.image('hospital', this.ASSET_URL + '/textures/hospital.png');
        this.load.image('playerFarm', this.ASSET_URL + '/textures/player_farm.png');

        // Load the export Tiled JSON
        this.load.image('tiles', this.ASSET_URL + '/textures/simple_farm.png');
        this.load.image('modern', this.ASSET_URL + '/textures/statics.png');
        this.load.tilemapTiledJSON('map', this.ASSET_URL + '/maps/fieldfarm_beta.json');

    }

    createAnimations() {


        this.anims.create({
            key: 'coin_up',
            frames: this.anims.generateFrameNumbers('coin', {frames: [0, 1, 2, 3]}),
            frameRate: 8,
            yoyo: true,
            repeat:-1
        });

        this.anims.create({
            key: 'cow_walk_up',
            frames: this.anims.generateFrameNumbers('cow_1', {frames: [0, 1, 2, 3]}),
            frameRate: 8,
            repeat: -1
        });
        this.anims.create({
            key: 'cow_walk_left',
            frames: this.anims.generateFrameNumbers('cow_1', {frames: [4, 5, 6, 7]}),
            frameRate: 8,
            repeat: -1
        });
        this.anims.create({
            key: 'cow_walk_down',
            frames: this.anims.generateFrameNumbers('cow_1', {frames: [8, 9, 10, 11]}),
            frameRate: 8,
            repeat: -1
        });
        this.anims.create({
            key: 'cow_walk_right',
            frames: this.anims.generateFrameNumbers('cow_1', {frames: [12, 13, 14, 15]}),
            frameRate: 8,
            repeat: -1
        });

    }

    create() {
        super.create();
        this.createAnimations();
        this.debug("BOOTING COMPLETE!");


        this.scene.start(gameSettings.SCENENAMES.TITLESCENENAME);



    }


}
