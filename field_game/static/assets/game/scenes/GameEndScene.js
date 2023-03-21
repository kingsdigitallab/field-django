/*jshint esversion: 8 */
import {gameSettings} from "../cst.js";
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
        this.gameScene = this.scene.get(gameSettings.SCENENAMES.GAMESCENENAME);
        this.uiScene = this.scene.get(gameSettings.SCENENAMES.UISCENENAME);
        this.gameEndPhase();
    }

    gameEndPhase() {

        // Remove our scenes
        this.scene.remove(gameSettings.SCENENAMES.BFREESCENENAME);
        this.scene.remove(gameSettings.SCENENAMES.TRADINGSCENENAME);
        this.scene.remove(gameSettings.SCENENAMES.TURNENDSCENENAME);
        // this.scene.remove(gameSettings.SCENENAMES.UISCENENAME);
        this.scene.remove(gameSettings.SCENENAMES.GAMESCENENAME);

        this.updatePlayerGamesPlayed();

        // Add our winner screen
        this.gameEndScreen();

    }

    /**
     * Add the player's final score to the screen
     * @param Element to align to
     */
    addPlayerScore() {
        //Phaser.Display.Align.In.Center
        let balance = 0;
        if (gameState.player) {
            balance = gameState.player.balance;
        }
        let score = this.add.text(0, 0, '£ ' + balance,
            {
                fontFamily: '"PressStart2P"',
                fontSize: '300%',
            });
        return score;

    }

    updatePlayerGamesPlayed() {
        axios({
            method: 'put',
            mode: 'same-origin',
            url: gameSettings.apiURLs.farmer + gameState.playerDatabaseID + '/',
            headers: {
                'X-CSRFToken': sessionStorage.getItem('csrf_token')
            },
            data: {
                gamesPlayed: gameState.gamesPlayed + 1
            }
        });
    }

    newGameMenu() {
        console.log('explanation');
        this.scene.start(gameSettings.SCENENAMES.GAMERESTARTSCENENAME);
    }

    addContinueButton() {
        let continueButton = this.add.text(
            this.scale.width / 2,
            this.scale.height,
            'Continue', this.uiScene.scoreboard.defaultPromptTextStyle
        )
            .setOrigin(0.5)
            .setPadding(25)
            .setStyle({backgroundColor: '#111'});
        continueButton.y -= continueButton.displayHeight;

        continueButton.setInteractive().on('pointerup', function () {

            this.newGameMenu();
        }, this);
    }

    gameEndScreen() {
        const w = this.scale.width;
        const h = this.scale.height;
        let winTitle = "";
        // If player is winner
        if (gameState.winnerSpriteKeyFrame === gameState.playerSpriteKeyFrame) {
            winTitle = 'YOU WON!';
        } else {
            winTitle = 'WINNER';
        }

        // Title
        this.titleText = this.add.text(0, 0, winTitle,
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
            winnerSprite, this.titleText, 0, winnerSprite.displayHeight
        );
        winnerSprite.anims.create({
            key: 'walk',
            frames: this.anims.generateFrameNumbers(
                'creature_farmers',
                {
                    start: gameState.winnerSpriteKeyFrame,
                    end: gameState.winnerSpriteKeyFrame + 3
                }
            ),
            frameRate: 8,
            repeat: -1
        });
        winnerSprite.play('walk');
        // Show player's score
        this.playerScoreText = this.add.text(
            this.rectCentreX, this.rectCentreY + 100,
            "Score\n\n£" + gameState.winner.balance,
            {
                fontFamily: '"PressStart2P"',
                fontSize: '300%',
                align: 'center'
            });

        Phaser.Display.Align.To.BottomCenter(
            this.playerScoreText, winnerSprite, 0, winnerSprite.displayHeight
        );
        this.addContinueButton();
    }

}
