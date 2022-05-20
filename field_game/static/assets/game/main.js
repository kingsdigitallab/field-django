/*jshint esversion: 8 */

import {gameSettings} from "./cst.js";

import BootScene from './scenes/BootScene.js';
import TitleScene from './scenes/TitleScene.js';
import UIScene from './scenes/UIScene.js';
import GameScene from './scenes/GameScene.js';
import BFreeScene from "./scenes/BFreeScene.js";
import TradingScene from "./scenes/TradingScene.js";
import DialogModalPlugin from "./plugins/field/DialogModalPlugin.js";
import RoundEndScene from "./scenes/RoundEndScene.js";


/**
 *  Main game config
 *
 */

const fieldProperties = {

    BOARD_TILE_SIZE: 16,
    FARMER_TILE_SIZE: 32,
    COW_TILE_SIZE: 64,
    STATIC_PATH: "/static/assets/game/"
};

const MIN_WIDTH = 320;
const MIN_HEIGHT = 640;
const MAX_WIDTH = 1400;
const MAX_HEIGHT = 1200;
const GAME_WIDTH = 640; // In 16 tiles, 40 X 60
const GAME_HEIGHT = 960;


// Load scenes
let bootScene = new BootScene();
let titleScene = new TitleScene();
let gameScene = new GameScene();

let config = {
    type: Phaser.AUTO,
    physics: {
        default: 'arcade',
        arcade: {
            debug: false
        }
    },
    plugins: {
            global: [
                {
                    key: 'DialogModalPlugin', plugin: DialogModalPlugin, start: false, mapping:'dialogWindow'
                }
            ]
        },
    scale: {
        mode: Phaser.Scale.FIT,
        parent: 'phaser-fieldgame',
        autoCenter: Phaser.Scale.CENTER_BOTH,
        width: GAME_WIDTH,
        height: GAME_HEIGHT,
        min: {
            width: MIN_WIDTH,
            height: MIN_HEIGHT
        },
        max: {
            width: MAX_WIDTH,
            height: MAX_HEIGHT
        }
    },

};
//scene: [FieldScene]
let game = new Phaser.Game(config);
game.scene.add('BootScene', bootScene);
game.scene.add('TitleScene', titleScene);
game.scene.add(gameSettings.SCENENAMES.GAMESCENENAME, gameScene);
game.scene.add(gameSettings.SCENENAMES.UISCENENAME, new UIScene());
game.scene.add(gameSettings.SCENENAMES.BFREESCENENAME, new BFreeScene());
game.scene.add(gameSettings.SCENENAMES.TRADINGSCENENAME, new TradingScene());
game.scene.add(gameSettings.SCENENAMES.ROUNDENDSCENENAME, new RoundEndScene());
game.scene.start('BootScene');
