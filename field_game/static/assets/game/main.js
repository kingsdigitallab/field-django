/*jshint esversion: 8 */

import {gameSettings} from "./cst.js";

import BootScene from './scenes/BootScene.js';
import TitleScene from './scenes/TitleScene.js';
import CharacterSelectScene from './scenes/CharacterSelectScene.js';
import UIScene from './scenes/UIScene.js';
import GameScene from './scenes/GameScene.js';
import GameEndScene from './scenes/GameEndScene.js';
import BFreeScene from "./scenes/BFreeScene.js";
import TradingScene from "./scenes/TradingScene.js";
import DialogModalPlugin from "./plugins/field/DialogModalPlugin.js";
import TurnEndScene from "./scenes/TurnEndScene.js";
import HighScoreScene from "./scenes/HighScoreScene.js";

/**
 *  Main game config
 *
 */

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
    parent: 'phaser-fieldgame',
    width: GAME_WIDTH,
        height: GAME_HEIGHT,
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
        autoCenter: Phaser.Scale.CENTER_BOTH,
        min: {
            width: MIN_WIDTH,
            height: MIN_HEIGHT
        },
        max: {
            width: MAX_WIDTH,
            height: MAX_HEIGHT
        },
        zoom:1.5 // Added for mobile
    },

};

// Testing classes
function getUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
        }
    }
    return false;
}

gameSettings.playerIDParam = getUrlParameter("playerID");
gameSettings.controlGroupParam = getUrlParameter("control_group");


//scene: [FieldScene]
let game = new Phaser.Game(config);
game.scene.add('BootScene', bootScene);
game.scene.add('TitleScene', titleScene);
game.scene.add(gameSettings.SCENENAMES.HIGHSCORESCENE, new HighScoreScene());
game.scene.add(gameSettings.SCENENAMES.CHARACTERSELECTSCENE, new CharacterSelectScene());
game.scene.add(gameSettings.SCENENAMES.GAMESCENENAME, gameScene);
game.scene.add(gameSettings.SCENENAMES.UISCENENAME, new UIScene());
game.scene.add(gameSettings.SCENENAMES.BFREESCENENAME, new BFreeScene());
game.scene.add(gameSettings.SCENENAMES.TRADINGSCENENAME, new TradingScene());
game.scene.add(gameSettings.SCENENAMES.TURNENDSCENENAME, new TurnEndScene());
game.scene.add(gameSettings.SCENENAMES.GAMEENDSCENENAME, new GameEndScene());
game.scene.start('BootScene');
