/*jshint esversion: 8 */
import {gameSettings} from "../cst.js";
import eventsCenter from "./EventsCenter.js";
import {gameState} from '../GameState.js';

/**
 * Final game ending scene
 *
 * Show game endinge screen
 * Then High Scores?
 */
export default class GameEndScene extends Phaser.Scene {
    constructor() {
        super(gameSettings.SCENENAMES.GAMEENDSCENENAME);
    }

    create() {
        console.log('Game End');
    }
}
