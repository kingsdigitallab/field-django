/*jshint esversion: 8 */
import FieldScene from './FieldScene.js';
import {gameState} from '../GameState.js';
import {gameSettings} from "../cst.js";

/**
 * Show high scores and the player's personal best
 * and give them a chance to enter a three letter
 * high score name if they're up there
 */
export default class HighScoreScene extends FieldScene {


    constructor() {
        super(gameSettings.SCENENAMES.HIGHSCORESCENE);
        this.enterKeyCode = 13;
        this.maxNameLength = 10;
    }

    preload() {

    }


    create() {
        console.log('Name input');
        super.create();

        const w = this.scale.width;
        const h = this.scale.height;
        this.titleText = this.add.text(w / 2, (h / 4), 'Enter player name:', {
            fontFamily: '"PressStart2P"',
            fontSize: '300%',
        });
        this.titleText.setOrigin(0.5, 0.5);
        this.textEntry = this.add.text(10, 50, '', {
            fontFamily: '"PressStart2P"',
            fontSize: '200%',
            color: '#ff0000'
        });
        if (localStorage.getItem('playerID')){
            this.textEntry.text = localStorage.getItem('playerID');
        }


        this.input.keyboard.on('keydown', function (event) {
            if (event.keyCode === this.enterKeyCode) {
                // We're done
                gameState.playerID =  this.textEntry.text;
                localStorage.setItem('playerID', gameState.playerID);
                this.scene.start(gameSettings.SCENENAMES.CHARACTERSELECTSCENE);
            } else if (event.keyCode === 8 && this.textEntry.text.length > 0) {
                this.textEntry.text = this.textEntry.text.substr(0, this.textEntry.text.length - 1);
            } else if (this.textEntry.text.length <= this.maxNameLength && (event.keyCode === 32 || (event.keyCode >= 48 && event.keyCode < 90))) {
                // Add to name
                this.textEntry.text += event.key;
            }

        }, this);
    }

}
