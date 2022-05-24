/*jshint esversion: 8 */
import {gameSettings} from "../cst.js";
import eventsCenter from "./EventsCenter.js";

/**
 * Final game ending scene
 */
export default class GameEndScene extends Phaser.Scene {
    constructor() {
        super(gameSettings.SCENENAMES.GAMEENDSCENENAME);
    }

    create() {
        console.log('Game End');
    }
}
