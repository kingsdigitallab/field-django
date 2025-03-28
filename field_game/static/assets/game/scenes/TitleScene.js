/*jshint esversion: 8 */
import {gameSettings} from "../cst.js";
import FieldScene from './FieldScene.js';

export default class TitleScene extends FieldScene {

    // Debugger toggle
    DEBUG = true;

    // Turn on logging of games (through db api calls)
    LOGGER = true;

    MIN_WIDTH = 320;
    MIN_HEIGHT = 640;
    MAX_WIDTH = 1400;
    MAX_HEIGHT = 1200;

    GAME_WIDTH = 640; // In 16 tiles, 40 X 60
    GAME_HEIGHT = 960;
    BOARD_TILE_SIZE = 16;
    FARMER_TILE_SIZE = 32;
    COW_TILE_SIZE = 64;
    titleBackground;
    titleText;
    promptText;


    constructor() {
        super(gameSettings.SCENENAMES.TITLESCENENAME);
    }

    preload() {

    }

    /**
     * Main Title screen
     */
    createTitleScreen() {
        const w = this.scale.width;
        const h = this.scale.height;

        // Background
        this.titleBackground = this.add.rectangle(0, 0, w, h, 0x000000, 0.5);
        this.titleBackground.setInteractive();
        //this.titleBackground.once('pointerdown', () => this.advance());
        this.titleText = this.add.text(w / 2, (h / 4), 'FIELD trading game', {
            fontFamily: '"PressStart2P"',
            fontSize: '300%',
        });
        this.titleText.setOrigin(0.5, 0.5);

        this.promptText = this.add.text(w / 2, h / 2, 'Touch to start', {
            fontFamily: '"PressStart2P"',
            fontSize: '200%',
        });
        this.promptText.setOrigin(0.5, 0.5);


    }

    create() {
        console.log('title started');
        // const width = this.scale.gameSize.width;
        // const height = this.scale.gameSize.height;
        //
        // this.parent = new Phaser.Structs.Size(width, height);
        // this.sizer = new Phaser.Structs.Size(this.GAME_WIDTH, this.GAME_HEIGHT, Phaser.Structs.Size.FIT, this.parent);
        //
        // this.parent.setSize(width, height);
        // this.sizer.setSize(width, height);
        // this.updateCamera();
        // this.scale.on('resize', this.resize, this);
        this.createTitleScreen();
        this.input.once('pointerdown', function () {
            let scene = this;

            setTimeout(function () {
                scene.advance();
            }, 1000);
        }, this);


    }

    startFullscreen(){
        if (this.scale.isFullscreen)
            {
                //button.setFrame(0);
                this.scale.stopFullscreen();
            }
            else
            {
                //button.setFrame(1);
                this.scale.startFullscreen();
            }
    }


    /** advance our prompts in the title screen
     *
     */
    advance() {
        // Show rules, intro etc. eventually
        console.log('advance');
        this.scene.start(gameSettings.SCENENAMES.CHARACTERSELECTSCENE);
    }


}
