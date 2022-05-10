/*jshint esversion: 6 */


export default class UIScene extends Phaser.Scene {


    constructor() {
        super('UIScene');
        this.COLOR_PRIMARY = 0x4e342e;
        this.COLOR_LIGHT = 0x7b5e57;
        this.COLOR_DARK = 0x260e04;
    }


    preload() {
        this.load.scenePlugin('rexuiplugin', 'https://raw.githubusercontent.com/rexrainbow/phaser3-rex-notes/master/dist/rexuiplugin.min.js', 'rexUI', 'rexUI');
    }

    create() {
        // Main dialogue
        this.createScoreboard();


    }


    /**
     * Scoreboard with all player/AI totals
     */
    createScoreboard() {
        this.scoreboardContainer = this.add.container(this.GAME_WIDTH / 2, this.GAME_HEIGHT / 2);
        this.scoreboardBackground = this.add.rectangle(0, 0, this.GAME_WIDTH / 2, this.GAME_HEIGHT / 2, 0x000000, 0.5);
        this.scoreboardTitle = this.add.text(0, 0, 'BoviFlu game', {fontFamily: 'PressStart2P'});
        this.scoreboardText = this.add.text(0, 0, 'Press Start', {fontFamily: 'PressStart2P'});
        this.scoreboardText.setOrigin(0.5, 0.5);
        this.scoreboardTitle.setOrigin(0.5, 0.5);
        this.scoreboardContainer.add(this.scoreboardBackground);
        this.scoreboardContainer.add(this.scoreboardTitle);
        this.scoreboardContainer.add(this.scoreboardText);

        Phaser.Display.Align.In.TopCenter(
            this.scoreboardTitle, this.scoreboardBackground
        );
        // Start hidden
        //this.scoreboardContainer.setVisible(false);
    }

}
