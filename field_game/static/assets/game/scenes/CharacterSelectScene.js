/*jshint esversion: 8 */
import {gameSettings} from "../cst.js";
import FieldScene from './FieldScene.js';

/** Allows the user to select a character to play the game with
 *
 */
export default class CharacterSelectScene extends FieldScene {


    constructor() {
        super(gameSettings.SCENENAMES.CHARACTERSELECTSCENE);
    }

    preload() {

    }

    characterSelected(characterSprite){
        console.log(characterSprite.frame.name);
        // Hide other sprites (timeline?)
        // Assign the sprite to player
        // play cool animation, like walk off screen
        // Start the game
    }

    /** Display all our weird playable creatures and allow the player to select
     *
     */
    characterSelect() {
        const w = this.scale.width;
        const h = this.scale.height;
        // Title
        this.titleText = this.add.text(w / 2, (h / 4), 'Select Character', {
            fontFamily: '"PressStart2P"',
            fontSize: '300%',
        });
        this.titleText.setOrigin(0.5, 0.5);
        // Create sprites
        let characterSprites = [];
        let spriteKeys = Object.keys(gameSettings.CHARACTER_FRAMES);

        for (let s = 0; s < spriteKeys.length; s++) {
            let characterSprite = this.physics.add.sprite(
                w / 2,
                h / 2,
                gameSettings.CHARACTER_KEY,
                gameSettings.CHARACTER_FRAMES[spriteKeys[s]]
            )
                .setScale(3);
            characterSprite.setInteractive().on('pointerup', function (pointer, localX, localY) {
                // select the sprite
                this.characterSelected(characterSprite);
                }, this);

            /*if (s === 0) {
                Phaser.Display.Align.To.BottomLeft(
                    characterSprite, this.titleText, 0, 50
                );
            }else{
                Phaser.Display.Align.To.LeftCenter(
                    characterSprite, this.titleText, 0, 50
                );
            }*/

            characterSprites.push(characterSprite);
        }
        Phaser.Actions.GridAlign(characterSprites, {
            width: 4,
            height: 10,
            cellWidth: 96,
            cellHeight: 96,
            position: Phaser.Display.Align.CENTER,
            x: w / 2 - (4 * 96 / 2.5),
            y: h / 2 - (2 * 96 / 2)
        });


        /*
        .setInteractive().on('pointerup', function (pointer, localX, localY) {
                    if (this.sprite.scene.gameState.isGameBoardActive) {
                        // If board is touchable, record touch
                        eventsCenter.emit(gameSettings.EVENTS.AIFARMERPENTOUCHED, this);

                    }
                }, aiFarmer);
         */
        // Display choices
        // set interactive
    }

    create() {
        super.create();
        this.characterSelect();
    }

    startGame() {
        this.scene.launch(gameSettings.SCENENAMES.UISCENENAME);
        this.scene.start(gameSettings.SCENENAMES.GAMESCENENAME);
    }
}
