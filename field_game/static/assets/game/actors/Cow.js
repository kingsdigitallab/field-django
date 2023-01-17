/*jshint esversion: 8 */

export default class Cow {


    constructor(owner, sprite) {
        this.owner = owner;
        this.sprite = sprite;
        this.isMoving = false;
        this.sinceLastMove = 0;
        this.movePath = [];
        this.homePenTile = [];
        this.cowSpeed = 50;
        this.timeline = this.sprite.scene.tweens.createTimeline();
        this.isTrading = false; //Part of a trade this turn?

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

    async calculateMovePath(endX, endY) {
        return new Promise((resolve, reject) => {
            let startTile = this.sprite.scene.map.getTileAtWorldXY(
                this.sprite.x, this.sprite.y, this.sprite.scene.layers['pathLayer']
            );
            let cow = this;
            this.sprite.scene.finder.findPath(
                startTile.x, startTile.y, endX, endY, function (path) {
                    if (path === null) {
                        console.log(
                            "Path between "+startTile.x+","+startTile.y+"-"+endX+","+endY+" was not found.");
                        reject(false);
                    } else {
                        cow.isMoving = true;
                        cow.movePath.push(...path);
                        resolve(true);
                    }
                }
            );
            this.sprite.scene.finder.calculate();
        });
    }


    /**
     * Create a tween timeline
     * move the cow along it
     * return as a promise
     * clear movepath when timeline complete
     * @param cowSpeed
     * @return {Promise<unknown>}
     */
    moveCowAlongPath(cowSpeed) {
        let cow = this;
        cow.isMoving = true;
        return new Promise((resolve, reject) => {
            let timeline = cow.getCowMoveTimeline(cowSpeed);
            timeline.setCallback('onComplete', function () {
                cow.isMoving = false;
                // Reset movepath
                cow.movePath = [];
                 //Face up for now
                cow.sprite.angle = 0;
                resolve(-1);
            });
            timeline.play();
        });
    }


    doPathMove(step, cowSpeed) {
        let startTile = this.sprite.scene.map.getTileAtWorldXY(this.sprite.x, this.sprite.y, this.sprite.scene.layers['pathLayer']);
        let startX = (startTile.x * this.sprite.scene.BOARD_TILE_SIZE);
        let startY = (startTile.y * this.sprite.scene.BOARD_TILE_SIZE);
        let currentAngle = this.sprite.angle;

        let ex = step.x;
        let ey = step.y;
        let newX = ex * this.sprite.scene.BOARD_TILE_SIZE;
        let newY = ey * this.sprite.scene.BOARD_TILE_SIZE;
        let angle = this.getMoveDirection(startX, startY, newX, newY);
        let diff = angle - currentAngle;

        if (angle !== currentAngle) {
            if (diff < -180) {
                diff += 360;
            } else if (diff > 180) {
                diff -= 360;
            }
            /*timeline.add({
                 targets: this.sprite,
                 ease: 'Linear',
                 angle: {value: currentAngle + diff, duration: cowSpeed},
             });*/
            currentAngle = currentAngle + diff;
            this.sprite.angle = currentAngle;
        }
        this.sprite.x = newX;
        this.sprite.y = newY;

    }

    /**
     * Create a timeline to show our super cool innoculation effects
     * @return {*} timeline
     */
    getInnoculateAnimationTimeline() {
        let timeline = this.sprite.scene.tweens.createTimeline();
        timeline.add({
            targets: this.sprite,
            ease: 'Linear',
            tint: 0x0000ff,
            angle: {value: 360 * 3, duration: 1000},
        });


        return timeline;
    }

    innoculationAnimation() {
        return new Promise((resolve, reject) => {
            let timeline = this.getInnoculateAnimationTimeline();
            timeline.setCallback('onComplete', function () {
                resolve(true);
            });
            timeline.play();
        });
    }

    getCowMoveTimeline(cowSpeed) {
        if (this.movePath && this.movePath.length > 0) {
            let startTile = this.sprite.scene.map.getTileAtWorldXY(this.sprite.x, this.sprite.y, this.sprite.scene.layers['pathLayer']);
            let cow = this;
            let timeline = cow.sprite.scene.tweens.createTimeline();
            //let currentRotation= cow.sprite.rotation;
            let startX = (startTile.x * cow.sprite.scene.BOARD_TILE_SIZE);
            let startY = (startTile.y * cow.sprite.scene.BOARD_TILE_SIZE);
            let currentAngle = cow.sprite.angle;
            for (let i = 0; i < this.movePath.length - 1; i++) {
                let ex = this.movePath[i + 1].x;
                let ey = this.movePath[i + 1].y;
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
                } else if (i === this.movePath.length - 2) {
                    // Last step, add stop sprite on complete
                    moveTween.onComplete = cow.stopCowSprite;
                }
                timeline.add(moveTween);
                // Update starting point for next tween
                startX = newX;
                startY = newY;
            }
            return timeline;
        }
        // No moves!
        return null;

    }


}
