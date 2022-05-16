/*jshint esversion: 6 */
import FieldScene from './FieldScene.js';
import {GAMESCENENAME, UISCENENAME, BFREESCENENAME, TITLESCENENAME} from "../cst.js";

export default class BootScene extends FieldScene {

    // Debugger toggle
    DEBUG = true;

    // Turn on logging of games (through db api calls)
    LOGGER = true;
    ASSET_URL = "/static/assets/game";


    constructor() {
        super('BootScene');
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

        //Animals
        this.load.spritesheet('cow_1',
            '/static/assets/game/textures/cow_walk_64.png',
            {frameWidth: 64, frameHeight: 64}
        );


        this.load.image('player_farm', this.ASSET_URL + '/maps/player_farm.png');
        this.load.image('AI_farm_left', this.ASSET_URL + '/maps/AI_farm_left.png');
        this.load.image('AI_farm_right', this.ASSET_URL + '/maps/AI_farm_right.png');

        // Decorations (Grass, buildings, trees, fences, etc.)
        this.load.image('grass', this.ASSET_URL + '/textures/grass_1.png');
        this.load.image('tree_1', this.ASSET_URL + '/textures/tree_1.png');

        // Load the export Tiled JSON
        this.load.image('tiles', this.ASSET_URL + '/textures/simple_farm.png');
        this.load.image('modern', this.ASSET_URL + '/textures/statics.png');
        this.load.tilemapTiledJSON('map', this.ASSET_URL + '/maps/fieldfarm.json');

    }

    createAnimations() {
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
        this.scene.launch(UISCENENAME);
        this.scene.start(GAMESCENENAME);


    }


}
