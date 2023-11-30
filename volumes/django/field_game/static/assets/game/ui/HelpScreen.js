/*jshint esversion: 8 */
import {gameState} from '../GameState.js';
import {gameSettings, States} from "../cst.js";
import eventsCenter from "../scenes/EventsCenter.js";

/**
 * Help screen with instructions
 * player can toggle this on with ? button,
 * any touch/click should turn it off
 *
 */
export default class HelpScreen {
    constructor(scene) {
        this.scene = scene;
        this.screenVisible = false;

        this.borderThickness = 3;
        this.borderColor = 0x907748;
        this.borderAlpha = 1;
        this.windowAlpha = 0.8;
        this.windowColor = 0x000000;
        this.defaultTextStyle = {fontFamily: 'PressStart2P', fontSize: '14px'};


    }

    helpScreenOn() {
        this.helpScreenBackground.visible = true;

        this.helpScreenEdge.visisble = true;
        this.textContainer.visible = true;
    }

    helpScreenOff() {
        this.helpScreenBackground.visible = false;

        this.helpScreenEdge.visisble = false;
        this.textContainer.visible = false;
    }

    toggleHelpScreen() {

        if (this.screenVisible) {
            this.helpScreenOff();
            gameState.clickEnabled = true;
            this.screenVisible = false;
        } else {
            this.helpScreenOn();
            gameState.clickEnabled =false;
            this.screenVisible = true;
        }

    }

    createHelpScreen() {
        this.helpScreen_width = this.scene.GAME_WIDTH - (this.scene.GAME_WIDTH / 12);
        this.helpScreen_height = this.scene.GAME_HEIGHT - (this.scene.GAME_HEIGHT / 10);
        this.rectX = this.scene.GAME_WIDTH / 2 - (this.helpScreen_width / 2);
        this.rectY = this.scene.GAME_HEIGHT / 2 - (this.helpScreen_height / 2);
        this.rectCentreX = this.scene.scale.width / 2;
        this.rectCentreY = this.scene.scale.height / 2;
        // Nicked from the plugin
        let graphics = this.scene.add.graphics();
        graphics.lineStyle(
            this.borderThickness,
            this.borderColor,
            this.borderAlpha
        );
        this.helpScreenEdge = graphics.strokeRect(
            this.rectX, this.rectY, this.helpScreen_width, this.helpScreen_height
        );
        graphics.fillStyle(
            this.windowColor, this.windowAlpha
        );
        this.helpScreenBackground = graphics.fillRect(
            this.rectX + 1, this.rectY + 1,
            this.helpScreen_width - 1, this.helpScreen_height - 1
        );

        // Screen title
        /*let titleText = "HOW TO PLAY";
        this.helpScreenTitle = this.scene.add.text(
            this.rectCentreX, this.rectY + 25, titleText,
            this.defaultTitleTextStyle
        );
        this.helpScreenTitle.x = this.rectCentreX - (this.helpScreenTitle.displayWidth / 2);
*/

        this.defaultTextStyle = {fontFamily: 'PressStart2P', fontSize: '16px'};

        // Help text as a dom element, see helpscreen.html in includes
        this.textContainer = this.createTextContainer();


        this.helpScreenBackground.depth = 3;
        this.helpScreenEdge.depth = 3;

        // Hidden by default
        this.helpScreenBackground.visible = false;

        this.helpScreenEdge.visisble = false;
        this.textContainer.visible =false;

    }

    createTextContainer() {
        let textContainer = this.scene.add.dom(
            this.rectCentreX, this.rectCentreY
        ).createFromCache('helpscreen');
        textContainer.setOrigin(0.5,0.5);
        textContainer.x = this.rectCentreX ;
        textContainer.depth = 3;
        return textContainer;
    }
}
