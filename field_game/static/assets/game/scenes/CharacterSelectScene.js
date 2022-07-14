/*jshint esversion: 8 */
import {gameSettings} from "../cst.js";
import FieldScene from './FieldScene.js';
import eventsCenter from "./EventsCenter.js";
import {gameState} from '../GameState.js';


/** Allows the user to select a character to play the game with
 *
 */
export default class CharacterSelectScene extends FieldScene {


    constructor() {
        super(gameSettings.SCENENAMES.CHARACTERSELECTSCENE);
        // For this scene only so not adding to main list
        this.events = {};
        this.characterCellWidth = 96;
        this.characterCellHeight = 96;
        this.characterSprites = [];
        this.playerSprite = null;
    }

    preload() {

    }

    /**
     * play cool animation, like walk off screen
     */
    walkOff() {
        const w = this.scale.width;
        this.playerSprite.play('walk');
        this.tweens.add({
            targets: this.playerSprite,
            ease: 'Power1',
            x: {value: w+this.characterCellWidth/2, duration: 2000},
            onComplete: function () {
                eventsCenter.emit(gameSettings.EVENTS.ONCHARACTERSELECTEDFINISHED);
            }
        });
    }

    /**
     * Assigns the selected sprite to the character and advances
     *
     * @param characterSprite
     */
    characterSelected(characterSprite) {
        // Assign the sprite to player
        gameState.playerSpriteKeyFrame = characterSprite.frame.name;
        this.playerSprite = characterSprite;
        for (let s = 0; s < this.characterSprites.length; s++) {
            // Remove others (animate fade)

            if (this.characterSprites[s] !== characterSprite) {
                let spriteTween = this.tweens.add({
                    targets: this.characterSprites[s],
                    alpha: 0,
                    ease: 'Cubic.easeOut',
                    duration: 1500,
                    onComplete: function () {
                        eventsCenter.emit(gameSettings.EVENTS.ONCHARACTERSELECTED);
                    }
                });

            }
        }


    }

    /** We're done, start the game
     *
     */
    nextScene() {
        this.scene.start(gameSettings.SCENENAMES.GAMESCENENAME);
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
        let spriteKeys = Object.keys(gameSettings.CHARACTER_FRAMES);

        for (let s = 0; s < spriteKeys.length; s++) {
            let characterSprite = this.physics.add.sprite(
                w / 2,
                h / 2,
                gameSettings.CHARACTER_KEY,
                gameSettings.CHARACTER_FRAMES[spriteKeys[s]]
            )
                .setScale(3);
            // set interactive
            characterSprite.setInteractive().once('pointerup', function (pointer, localX, localY) {
                // select the sprite
                this.characterSelected(characterSprite);
            }, this);
            // Animations
            let startFrame = gameSettings.CHARACTER_FRAMES[spriteKeys[s]];
            characterSprite.anims.create({
                key: 'walk',
                frames: this.anims.generateFrameNumbers(
                    'creature_farmers',
                    {start: startFrame, end: startFrame + 3}
                ),
                frameRate: 8,
                repeat: -1
            });
            this.characterSprites.push(characterSprite);
        }

        // Display choices
        Phaser.Actions.GridAlign(this.characterSprites, {
            width: 4,
            height: 10,
            cellWidth: this.characterCellWidth,
            cellHeight: this.characterCellHeight,
            position: Phaser.Display.Align.CENTER,
            x: w / 2 - (4 * 96 / 2.5),
            y: h / 2 - (2 * 96 / 2)
        });


    }

    loadEvents() {
        eventsCenter.once(gameSettings.EVENTS.ONCHARACTERSELECTED, this.walkOff, this);
        eventsCenter.once(gameSettings.EVENTS.ONCHARACTERSELECTEDFINISHED, this.nextScene, this);
    }

    create() {
        super.create();
        // Setup Events
        console.log('CHARACTER SELECT STARTED');
        this.loadEvents();
        this.events.on(Phaser.Scenes.Events.SHUTDOWN, this.unloadEvents);
        this.gameScene = this.scene.get(gameSettings.SCENENAMES.GAMESCENENAME);
        this.characterSelect();
        //this.nextScene();
    }


    unloadEvents() {
        eventsCenter.off(gameSettings.EVENTS.ONCHARACTERSELECTED, this.walkOff, this);
        eventsCenter.off(gameSettings.EVENTS.ONCHARACTERSELECTEDFINISHED, this.nextScene, this);
    }

}
