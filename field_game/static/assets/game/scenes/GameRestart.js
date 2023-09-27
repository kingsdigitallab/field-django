/*jshint esversion: 8 */
import {gameSettings} from "../cst.js";
import {gameState} from '../GameState.js';

/**
 * Final game ending scene
 *
 * Show game endinge screen
 * Then High Scores?
 */
export default class GameRestartScene extends Phaser.Scene {
    constructor() {
        super(gameSettings.SCENENAMES.GAMERESTARTSCENENAME);
        this.defaultTextStyle = {
            fontFamily: 'PressStart2P', fontSize: '14px',
            align: 'center',
            wordWrap: {width: 500}
        };

        this.borderThickness = 3;
        this.borderColor = 0x907748;
        this.borderAlpha = 1;
        this.windowAlpha = 0.8;
        this.windowColor = 0x303030;
        this.continueButton = null;
        this.defaultTitleTextStyle = {fontFamily: 'PressStart2P', fontSize: '24px'};
    }

    create() {
        const w = this.scale.width;
        const h = this.scale.height;

        let title = this.add.text(
            this.scale.width / 2,
            this.scale.height / 4,
            'THANK YOU FOR PLAYING', this.defaultTitleTextStyle
        ).setOrigin(0.5);

        let explanationText = '';
        if (gameState.gamesPlayed == 0){
            // First game, warmup
            explanationText = 'Warm up round over.  Please play again to start the experiment.';
        } else if (gameState.gamesPlayed <= gameSettings.gameRules.warmupRounds) {
            explanationText = 'Now that you’ve played the game, we’d like you to try again to beat your high score.  To make it more of a challenge, we may remove the infection bar, so you won’t know how many cows are infected.';

        } else if (gameState.gamesPlayed > gameSettings.gameRules.warmupRounds) {
            explanationText = 'The experiment is finished.\n\nBut you can still play again!';
        }

        let explanation = this.add.text(
            this.scale.width / 2,
            this.scale.height / 2,
            explanationText,
            this.defaultTextStyle
        ).setOrigin(0.5);

        let playerSprite = this.physics.add.sprite(
            w / 2,
            h / 2,
            gameSettings.CHARACTER_KEY,
            gameState.playerSpriteKeyFrame
        ).setScale(3);

        playerSprite.anims.create({
            key: 'walk',
            frames: this.anims.generateFrameNumbers(
                'creature_farmers',
                {
                    start: gameState.playerSpriteKeyFrame,
                    end: gameState.playerSpriteKeyFrame + 3
                }
            ),
            frameRate: 8,
            repeat: -1
        });

        Phaser.Display.Align.To.BottomCenter(
            playerSprite, title, 0, playerSprite.displayHeight
        );

        playerSprite.play('walk');

        this.playerScoreText = this.add.text(
            this.rectCentreX, this.rectCentreY + 100,
            "Your Score \n\n£" + gameState.player.balance,
            {
                fontFamily: '"PressStart2P"',
                fontSize: '300%',
                align: 'center'
            });

        Phaser.Display.Align.To.BottomCenter(
            this.playerScoreText, playerSprite, 0, playerSprite.displayHeight
        );

        Phaser.Display.Align.To.BottomCenter(
            explanation, this.playerScoreText, 0, explanation.displayHeight
        );

        this.addContinueButton(explanation);


    }


    restartGame() {
        console.log('explanation');
        location.reload();
    }

    addContinueButton(alignTo) {
        this.continueButton = this.add.text(
            this.scale.width / 2,
            this.scale.height - this.scale.height / 4,
            'PLAY AGAIN', this.defaultTitleTextStyle
        )
            .setOrigin(0.5)
            .setPadding(25)
            .setStyle({backgroundColor: '#111'});
        this.continueButton.y -= this.continueButton.displayHeight;
        this.continueButton.setInteractive().on('pointerup', function () {

            this.restartGame();
        }, this);

        Phaser.Display.Align.To.BottomCenter(
            this.continueButton, alignTo, 0, this.continueButton.displayHeight
        );

        let border = this.add.graphics();
        border.strokeRect(
            this.continueButton.x - (this.continueButton.displayWidth / 2) - 1,
            this.continueButton.y - (this.continueButton.displayHeight / 2) - 1,
            this.continueButton.displayWidth + 2,
            this.continueButton.displayHeight + 1
        )
            .lineStyle(
                this.borderThickness,
                this.borderColor,
                this.borderAlpha
            )
            .fillStyle(
                this.windowColor, this.windowAlpha
            );
    }


}
