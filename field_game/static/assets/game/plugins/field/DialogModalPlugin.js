/*jshint esversion: 8 */

/**
 Plugin to show Zelda-like dialog window
 Based on: https://gamedevacademy.org/create-a-dialog-modal-plugin-in-phaser-3-part-1/
 */

export default class DialogModalPlugin extends Phaser.Plugins.BasePlugin {
    constructor(pluginManager) {
        super('DialogModalPlugin', pluginManager);
        // Events emitted by the plugin
    }

    static getEvents(){
        return {
            STARTDIALOG: 'dialogStart',
            ANIMATEDIALOGFINISHED: 'dialogAnimationFinished',
            ADVANCEDIALOG: 'dialogAdvance',
            SKIPDIALOG: 'dialogAdvance',
            DIALOGFINISHED: 'dialogFinished'
        };
    }

    // Initialize the dialog modal
    init(opts) {
        // Check to see if any optional parameters were passed
        if (!opts) opts = {};
        // set properties from opts object or use defaults
        this.borderThickness = opts.borderThickness || 3;
        this.borderColor = opts.borderColor || 0x907748;
        this.borderAlpha = opts.borderAlpha || 1;
        this.windowAlpha = opts.windowAlpha || 0.8;
        this.windowColor = opts.windowColor || 0x303030;
        this.windowHeight = opts.windowHeight || 5 * 16;
        this.padding = opts.padding || 0;
        this.closeBtnColor = opts.closeBtnColor || 'darkgoldenrod';
        this.dialogSpeed = opts.dialogSpeed || 5;
        // used for animating the text
        this.eventCounter = 0;
        // Event emitter
        this.eventEmitter = opts.eventEmitter || null;
        // if the dialog window is shown
        this.dialogVisible = true;
        // the current text in the window
        this.text;
        // the text that will be displayed in the window
        this.dialog = [];
        this.graphics;
        this.closeBtn;
        this.isDialogRunning = false;
        // Create the dialog window
        //this._createWindow();

    }



    // Calculates where to place the dialog window based on the game size
    _calculateWindowDimensions(width, height) {
        var x = this.padding *2 ;
        var y = height - this.windowHeight; // - this.padding;
        var rectWidth = width - (this.padding * 2);
        var rectHeight = this.windowHeight;
        return {
            x,
            y,
            rectWidth,
            rectHeight
        };
    }

    // Creates the inner dialog window (where the text is displayed)
    _createInnerWindow(x, y, rectWidth, rectHeight) {
        this.graphics.fillStyle(this.windowColor, this.windowAlpha);
        this.graphics.fillRect(x + 1, y + 1, rectWidth - 1, rectHeight - 1);
    }


    // Creates the border rectangle of the dialog window
    _createOuterWindow(x, y, rectWidth, rectHeight) {
        this.graphics.lineStyle(this.borderThickness,
            this.borderColor, this.borderAlpha
        );
        this.graphics.strokeRect(x, y, rectWidth, rectHeight);
    }

    // Creates the close dialog window button
    _createCloseModalButton(scene, gameWidth, gameHeight) {
        var self = this;
        this.closeBtn = scene.make.text({
            x: gameWidth - this.padding - 14,
            y: gameHeight - this.windowHeight - this.padding + 3,
            text: 'X',
            style: {
                font: 'bold 12px Arial',
                fill: this.closeBtnColor
            }
        });
        this.closeBtn.setInteractive();
        this.closeBtn.on('pointerover', function () {
            this.setTint(0xff0000);
        });
        this.closeBtn.on('pointerout', function () {
            this.clearTint();
        });
        this.closeBtn.on('pointerdown', function () {
            self.toggleWindow();
        });
    }

    // Creates the dialog window
    createWindow(scene) {
        let gameHeight = scene.scale.height;
        let gameWidth = scene.scale.width;
        let dimensions = this._calculateWindowDimensions(gameWidth, gameHeight);
        this.graphics = scene.add.graphics();

        this._createOuterWindow(dimensions.x, dimensions.y, dimensions.rectWidth, dimensions.rectHeight);
        this._createInnerWindow(dimensions.x, dimensions.y, dimensions.rectWidth, dimensions.rectHeight);

    }

    // Sets the text for the dialog window
    setText(scene, text, animate) {
        // Reset
        this.eventCounter = 0;
        this.dialog = text.split('');
        if (this.timedEvent) this.timedEvent.remove();
        this.isDialogRunning = true;

        let tempText = animate ? '' : text;
        this._setText(scene, tempText);

        if (animate) {
            this.timedEvent = scene.time.addEvent({
                delay: 100 - (this.dialogSpeed * 30),
                callback: this._animateText,
                callbackScope: this,
                loop: true
            });
        }
    }


    // Calcuate the position of the text in the dialog window
    _setText(scene, text) {
        // Reset the dialog
        if (this.text) this.text.destroy();
        var x = this.padding * 2  + 10;
        var y = scene.scale.height - this.windowHeight +5 ;
        this.text = scene.make.text({
            x,
            y,
            text,
            style: {
                fontFamily: 'PressStart2P', fontSize: '14px',
                wordWrap: { width: scene.scale.width - (this.padding * 2) - 25}
            }
        });

        scene.children.bringToTop(this.text);
    }

    _animateText() {
        this.eventCounter++;
        if (this.text && this.dialog && this.dialog.length > 0){
            this.text.setText(this.text.text + this.dialog[this.eventCounter - 1]);
        }

        if (this.eventCounter === this.dialog.length) {
            this.eventCounter = 0;
            if (this.eventEmitter) {
                this.eventEmitter.emit(DialogModalPlugin.getEvents().ANIMATEDIALOGFINISHED);
            }
            this.timedEvent.remove();

        }
    }

    shutdown() {
        if (this.timedEvent) this.timedEvent.remove();
        if (this.text) this.text.destroy();
    }

    openDialogWindow(){
        if (this.text) this.text.visible = true;
        if (this.graphics) this.graphics.visible = true;

    }


    closeDialogWindow(){
        if (this.timedEvent) this.timedEvent.remove();
        if (this.text) this.text.visible = false;
        if (this.graphics) this.graphics.visible = false;
        if (this.text) this.text.destroy();
    }

    toggleWindow() {
        if (this.dialogVisible){
            this.closeDialogWindow();
        }else{
            this.openDialogWindow();
        }
        this.dialogVisible = !this.dialogVisible;

    }

}
