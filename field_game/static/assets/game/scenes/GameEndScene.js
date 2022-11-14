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
        this.gameScene = this.scene.get(gameSettings.SCENENAMES.GAMESCENENAME);
        this.uiScene = this.scene.get(gameSettings.SCENENAMES.UISCENENAME);
        this.gameEndPhase();
    }

    gameEndPhase(){
        // Remove our scenes
        this.scene.remove(gameSettings.SCENENAMES.BFREESCENENAME);
        this.scene.remove(gameSettings.SCENENAMES.TRADINGSCENENAME);
        this.scene.remove(gameSettings.SCENENAMES.TURNENDSCENENAME);
        this.scene.remove(gameSettings.SCENENAMES.UISCENENAME);
        this.scene.remove(gameSettings.SCENENAMES.GAMESCENENAME);

        // Add our winner screen
        this.gameEndScreen();

        // High scores?

    }

    gameEndScreen(){
        const w = this.scale.width;
        const h = this.scale.height;
        // Title
        this.titleText = this.add.text(0,0,'WINNER',
             {
            fontFamily: '"PressStart2P"',
            fontSize: '300%',
        });
        this.titleText.x = (w / 2) - (this.titleText.displayWidth / 2);
        this.titleText.y = (h / 4);
        let winnerSprite = this.physics.add.sprite(
                w / 2,
                h / 2,
                gameSettings.CHARACTER_KEY,
                gameState.winnerSpriteKeyFrame
            )
                .setScale(3);
        Phaser.Display.Align.To.BottomCenter(
            winnerSprite, this.titleText,0,winnerSprite.displayHeight
        );
        winnerSprite.anims.create({
                key: 'walk',
                frames: this.anims.generateFrameNumbers(
                    'creature_farmers',
                    {start: gameState.winnerSpriteKeyFrame, end: gameState.winnerSpriteKeyFrame + 3}
                ),
                frameRate: 8,
                repeat: -1
            });
        winnerSprite.play('walk');
        // maybe: Circle the winner text... FOREVER
        /*let timeline = this.tweens.createTimeline();
        timeline.add({
            targets: winnerSprite,
            ease: 'Power1',
            x: {value: (w / 2) + (this.titleText.displayWidth), duration: 2000},
        });
        timeline.add({
            targets: winnerSprite,
            ease: 'Power1',
            y: {value: (h / 2) - this.titleText.displayHeight, duration: 2000},
        });
        //timeline.loop = -1;
        timeline.play();*/

    }

}
