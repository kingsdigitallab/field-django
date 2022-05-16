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
        //this.load.scenePlugin('rexuiplugin', '/static/assets/game/plugins/rexuiplugin.min.js', 'rexUI', 'rexUI');
    }

    create() {
        this.GAME_WIDTH = this.scale.width;
        this.GAME_HEIGHT = this.scale.height;
        // Main dialogue
        this.createPlayerInfo();
        this.createScoreboard();

    }

    updateBalance(balance){
        console.log(this.playerInfoBalance);
        this.playerInfoBalance.setText(this.balanceText + balance);
        Phaser.Display.Align.To.BottomLeft(
            this.playerInfoBalance, this.playerInfoTitle
        );

    }

    updateHerd(herdTotal){
        this.playerInfoHerd.setText(this.herdText + herdTotal);
        Phaser.Display.Align.To.BottomLeft(
            this.playerInfoHerd, this.playerInfoBalance
        );
    }


    /**
     * Scoreboard with all player/AI totals
     */
    createPlayerInfo() {
        let board_width=this.GAME_WIDTH / 4;
        let board_height=this.GAME_HEIGHT / 8;
        this.playerInfoContainer = this.add.container(board_width, board_height);
        this.playerInfoBackground = this.add.rectangle(0, 0, board_width, board_height, 0x000000, 0.4);
        this.playerInfoTitle = this.add.text(0, 0, 'Player', {fontFamily: 'PressStart2P'});

        this.playerInfoBalance = this.add.text(0, 1, this.balanceText, {fontFamily: 'PressStart2P'});
        this.playerInfoHerd = this.add.text(0, 22, this.herdText, {fontFamily: 'PressStart2P'});
        this.playerInfoHerd.setOrigin(0, 0);
        this.playerInfoBalance.setOrigin(0.5, 0);
        this.playerInfoTitle.setOrigin(0.5, 0);

        this.playerInfoContainer.add(this.playerInfoBackground);
        this.playerInfoContainer.add(this.playerInfoTitle);
        this.playerInfoContainer.add(this.playerInfoBalance);
        this.playerInfoContainer.add(this.playerInfoHerd);

        Phaser.Display.Align.In.TopCenter(
            this.playerInfoTitle, this.playerInfoBackground
        );
        Phaser.Display.Align.To.BottomLeft(
            this.playerInfoBalance, this.playerInfoTitle
        );
        Phaser.Display.Align.To.BottomLeft(
            this.playerInfoHerd, this.playerInfoBalance
        );

        this.playerInfoContainer.x = this.GAME_WIDTH / 2;
        this.playerInfoContainer.y = board_height / 2 + 10;

        // Start hidden
        this.playerInfoContainer.setVisible(false);
    }

    /** Overall scoreboard for all players
     *
     */
    createScoreboard(){
        let board_width=this.GAME_WIDTH-(this.GAME_WIDTH/4);
        let board_height=this.GAME_HEIGHT-(this.GAME_HEIGHT/6);

        this.scoreboardBackground = this.add.rectangle(this.GAME_WIDTH/2, this.GAME_HEIGHT/2, board_width, board_height, 0x000000, 0.6);


        let title = this.add.text(0, 0, 'Scores', {fontFamily: 'PressStart2P'});
        Phaser.Display.Align.In.TopCenter(
            title, this.scoreboardBackground
        );

        this.scoreboardContainer = this.add.container(0, 0, [this.scoreboardBackground, title]);

        this.scoreboardContainer.setVisible(false);
    }


}
