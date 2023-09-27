/**
 *
 * @return text element and border
 */
  addButton() {
        let continueButton = this.add.text(
            this.scale.width / 2,
            this.scale.height - this.scale.height / 4,
            'PLAY AGAIN', this.defaultTitleTextStyle
        )
            .setOrigin(0.5)
            .setPadding(25)
            .setStyle({backgroundColor: '#111'});
        continueButton.y -= continueButton.displayHeight;
        continueButton.setInteractive().on('pointerup', function () {

            this.restartGame();
        }, this);

        let border = this.add.graphics();
        border.strokeRect(
            continueButton.x - (continueButton.displayWidth / 2) - 1,
            continueButton.y - (continueButton.displayHeight / 2) - 1,
            continueButton.displayWidth + 2,
            continueButton.displayHeight + 1
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
