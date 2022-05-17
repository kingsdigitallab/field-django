/*jshint esversion: 8 */
export default class FieldScene extends Phaser.Scene {

    // Debugger toggle
    DEBUG = true;

    // Turn on logging of games (through db api calls)
    LOGGER = true;

    MIN_WIDTH = 320;
    MIN_HEIGHT = 640;
    MAX_WIDTH = 1400;
    MAX_HEIGHT = 1200;

    GAME_WIDTH = 640; // In 16 tiles, 40 X 60
    GAME_HEIGHT = 960;
    BOARD_TILE_SIZE = 16;
    FARMER_TILE_SIZE = 32;
    COW_TILE_SIZE = 64;


    constructor(sceneName) {
      super(sceneName);

    }

    debug(message) {
      if (this.DEBUG) {
        console.log(message);
      }
    }

    //  ------------------------
    //  ------------------------
    //  ------------------------
    //  Resize related functions
    //  ------------------------
    //  ------------------------
    //  ------------------------
    // From: https://phaser.io/examples/v3/view/scalemanager/mobile-game-example

    resize(gameSize) {
      const width = gameSize.width;
      const height = gameSize.height;

      this.parent.setSize(width, height);
      this.sizer.setSize(width, height);

      this.updateCamera();
    }

    updateCamera() {
      const camera = this.cameras.main;

      const x = Math.ceil((this.parent.width - this.sizer.width) * 0.5);
      const y = 0;
      const scaleX = this.sizer.width / this.GAME_WIDTH;
      const scaleY = this.sizer.height / this.GAME_HEIGHT;

      camera.setViewport(x, y, this.sizer.width, this.sizer.height);
      camera.setZoom(Math.max(scaleX, scaleY));
      camera.centerOn(this.GAME_WIDTH / 2, this.GAME_HEIGHT / 2);

    }

    create(){
        const width = this.scale.gameSize.width;
        const height = this.scale.gameSize.height;

        this.parent = new Phaser.Structs.Size(width, height);
        this.sizer = new Phaser.Structs.Size(this.GAME_WIDTH, this.GAME_HEIGHT, Phaser.Structs.Size.FIT, this.parent);

        this.parent.setSize(width, height);
        this.sizer.setSize(width, height);
        this.updateCamera();
        //this.scale.on('resize', this.resize, this);
    }

    getZoom() {
      return this.cameras.main.zoom;
    }



  }
