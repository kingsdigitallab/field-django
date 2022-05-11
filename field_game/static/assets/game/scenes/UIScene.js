/*jshint esversion: 6 */


export default class UIScene extends Phaser.Scene {


    constructor() {
        super('UIScene');
        this.COLOR_PRIMARY = 0x4e342e;
        this.COLOR_LIGHT = 0x7b5e57;
        this.COLOR_DARK = 0x260e04;
        this.balanceText="£ ";
        this.herdText="Cows: ";
    }


    preload() {
        this.load.scenePlugin('rexuiplugin', '/static/assets/game/plugins/rexuiplugin.min.js', 'rexUI', 'rexUI');
    }

    create() {
        this.GAME_WIDTH = this.scale.width;
        this.GAME_HEIGHT = this.scale.height;
        // Main dialogue
        this.createScoreboard();

    }

    updateBalance(balance){
        this.scoreboardBalance.setText(this.balanceText + balance);
        Phaser.Display.Align.To.BottomLeft(
            this.scoreboardBalance, this.scoreboardTitle
        );

    }

    updateHerd(herdTotal){
        this.scoreboardHerd.setText(this.herdText + herdTotal);
        Phaser.Display.Align.To.BottomLeft(
            this.scoreboardHerd, this.scoreboardBalance
        );
    }


    /**
     * Scoreboard with all player/AI totals
     */
    createScoreboard() {
        let board_width=this.GAME_WIDTH / 4;
        let board_height=this.GAME_HEIGHT / 8;
        this.scoreboardContainer = this.add.container(board_width, board_height);
        this.scoreboardBackground = this.add.rectangle(0, 0, board_width, board_height, 0x000000, 0.4);
        this.scoreboardTitle = this.add.text(0, 0, 'Player', {fontFamily: 'PressStart2P'});

        this.scoreboardBalance = this.add.text(0, 1, this.balanceText, {fontFamily: 'PressStart2P'});
        this.scoreboardHerd = this.add.text(0, 22, this.herdText, {fontFamily: 'PressStart2P'});
        this.scoreboardHerd.setOrigin(0, 0);
        this.scoreboardBalance.setOrigin(0.5, 0);
        this.scoreboardTitle.setOrigin(0.5, 0);

        this.scoreboardContainer.add(this.scoreboardBackground);
        this.scoreboardContainer.add(this.scoreboardTitle);
        this.scoreboardContainer.add(this.scoreboardBalance);
        this.scoreboardContainer.add(this.scoreboardHerd);

        Phaser.Display.Align.In.TopCenter(
            this.scoreboardTitle, this.scoreboardBackground
        );
        Phaser.Display.Align.To.BottomLeft(
            this.scoreboardBalance, this.scoreboardTitle
        );
        Phaser.Display.Align.To.BottomLeft(
            this.scoreboardHerd, this.scoreboardBalance
        );

        this.scoreboardContainer.x = this.GAME_WIDTH / 2;
        this.scoreboardContainer.y = board_height / 2 + 10;

        // Start hidden
        //this.scoreboardContainer.setVisible(false);
    }



}
