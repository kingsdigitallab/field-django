/*jshint esversion: 6 */

export default class Cow {


    constructor(owner, boviFree, isSick, sprite) {
        this.owner = owner;
        this.isBoviFree = boviFree;
        this.isSick = isSick;
        this.sprite = sprite;
        this.isMoving = false;
        this.movePath = null;
    }

    // Move to 5, 10
    /*

      this.debug(startTile);

      this.finder.calculate();*/

    getMoveDirection(startX, startY, newX, newY) {
        // Figure out the change in direction
        let deltaX = newX - startX;
        let deltaY = newY - startY;
        let angle = 0;

        if (deltaX === 0) {
            if (deltaY < 0) {
                // Up
                angle = 0;
            } else if (deltaY > 0) {
                //Down
                angle = 180;
            }
        }
        if (deltaY === 0) {
            if (deltaX < 0) {
                // left
                angle = 270;
            } else if (deltaX > 0) {
                //right
                angle = 90;
            }
        }
        if (deltaX > 0 && deltaY < 0) {
            //up-right
            angle = 45;
        }
        if (deltaX > 0 && deltaY > 0) {
            //bottom-right
            angle = 135;
        }
        if (deltaX < 0 && deltaY < 0) {
            //up-left
            angle = 315;
        }
        if (deltaX < 0 && deltaY > 0) {
            //bottom-left
            angle = 225;
        }
        return angle;

    }

    /**
     * Move the cow the next step in its path
     * @param path easystarjs path
     */


    updateCowSprite(tween) {
        let sprite = tween.targets[0];
        let angle = tween.data[0].getEndValue();

        let animationName = null;
        if (angle > 270 && angle <= 90) {
            animationName = 'cow_walk_up';
        } else if (angle > 90 && angle <= 270) {
            animationName = 'cow_walk_down';
        }
        //if (animationName) {
            //onsole.log(animationName);
            //sprite.anims.play(animationName);
        //}


    }

    startCowSprite(tween) {
        tween.targets[0].play('cow_walk_up');
    }


    stopCowSprite(tween) {
        tween.targets[0].anims.stop();
    }

    /**
     * Move the cow from its current position to tile dx, dy
     * @param dX destination tile x
     * @param dY destination tile y
     */
    moveCow(dX, dY){
        // todo change to fast/normal speeds if necessary
        let cowSpeed = 50;
        this.calculateCowPath(dX, dY, cowSpeed);
    }

    /**
     * Move the cow from current position with easystarjs
     *
     * @param {Tile} DestinationTile
     */
    calculateCowPath(dX, dY, cowSpeed) {
        let cow = this;
        let scene = cow.sprite.scene;
        let startTile = cow.sprite.scene.map.getTileAtWorldXY(cow.sprite.x, cow.sprite.y, cow.sprite.scene.layers['pathLayer']);

        cow.sprite.scene.finder.findPath(startTile.x, startTile.y, dX, dY, function (path) {
            if (path === null) {
                console.log("Path was not found.");
            } else {
                let timeline = cow.sprite.scene.tweens.createTimeline();
                //let currentRotation= cow.sprite.rotation;
                let startX = (startTile.x * cow.sprite.scene.BOARD_TILE_SIZE);
                let startY = (startTile.y * cow.sprite.scene.BOARD_TILE_SIZE);
                let currentAngle = cow.sprite.angle;
                for (let i = 0; i < path.length - 1; i++) {
                    let ex = path[i + 1].x;
                    let ey = path[i + 1].y;
                    let newX = ex * cow.sprite.scene.BOARD_TILE_SIZE;
                    let newY = ey * cow.sprite.scene.BOARD_TILE_SIZE;
                    let angle = cow.getMoveDirection(startX, startY, newX, newY);
                    let diff = angle - currentAngle;
                    //console.log(currentAngle + diff);
                    if (angle !== currentAngle) {
                        if (diff < -180) {
                            diff += 360;
                        } else if (diff > 180) {
                            diff -= 360;
                        }
                        timeline.add({
                            targets: cow.sprite,
                            ease: 'Linear',
                            angle: {value: currentAngle + diff, duration: cowSpeed},
                        });
                        currentAngle = currentAngle + diff;
                    }
                    let moveTween = {
                        targets: cow.sprite,
                        ease: 'Power1',
                        x: {value: newX, duration: cowSpeed},
                        y: {value: newY, duration: cowSpeed},
                    };
                    if (i === 0) {
                        moveTween.onStart = cow.startCowSprite;
                    } else if (i === path.length - 2) {
                        // Last step, add stop sprite on complete
                        moveTween.onComplete = cow.stopCowSprite;
                    }
                    timeline.add(moveTween);
                    // Update starting point for next tween
                    startX = newX;
                    startY = newY;

                }
                timeline.play();
            }
        });
        cow.sprite.scene.finder.calculate();
    }

}
