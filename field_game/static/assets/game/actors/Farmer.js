/*jshint esversion: 8 */

import {gameSettings} from "../cst.js";

/**
 * The base farmer class, used by the AI and human players
 * This class stores all information about the player
 * their herd, starting point and their sprite in game
 */
export class Farmer {

    constructor(id, name, balance, sprite, farmerStart) {
        this.id = id;
        this.name = name;
        this.balance = balance; // Current cash
        this.sprite = sprite;
        this.farmerStart = farmerStart;
        this.bfree = false; // Are they part of Bovifree this turn?
        // todo set at 1 or 0?
        this.timeSinceLastSale = 1; // Time in turns since they last sold a cow
        this.infections = 0; // Number of infected cows in herd
        this.herdTotal = 0; // Total number of cows Farmer owns
        this.pen = [];
        this.penZone = null;
        this.slug = this.name.replace(' ', '_');
        // All of the pen spawn and resting points to put cows
        this.cowPenPoints = [];
        this.maxHerdSize = 25;
        this.isPlayer = false;
        this.penZoneHighlight = null;
        this.penZoneHighlightTween = null;
    }

    /** Make all of the points in the player's pen that a cow can rest
     *
     * @param maxCows Most cows we can have in the pen
     * @param cowsPerRow how many cows we can pack in in a row
     */
    makePenPoints(maxCows, cowsPerRow) {
        let spawnOrigin = this.getPenTile(0);
        //+ (16 * gameSettings.gameRules.cowScale)
        let spawnPoint = spawnOrigin;
        for (let c = 0; c < maxCows; c++) {
            /*if (c === 0){
                spawnPoint[0] += cowPixelSize / 2;
            } else {
                spawnPoint[0] += cowPixelSize;
            }

            if (c % cowsPerRow === 0) {
                spawnPoint[1] += cowPixelSize;
            }
            if (c % cowsPerRow === 0) {
                spawnPoint[1] += 1;
            }*/

            this.cowPenPoints.push({
                cow: null,
                occupied: false,
                tileXY: this.getPenTile(c)
            });
        }

    }

    /**
     * Find an unoccupied pen point
     * @return {number} index in pen free
     */
    findFreePenPoint() {
        for (let p = 0; p < this.maxHerdSize; p++) {
            if (this.cowPenPoints[p].occupied === false) {
                return p;
            }
        }
        // uh oh
        return -1;
    }


    /**
     * Set if farmer is part of scheme
     * If True - Also remove all infections from herd
     * @param isBFree boolean are they part of scheme
     */
    setBFree(isBFree) {
        if (isBFree === true) {
            this.bfree = true;
            this.infections = 0;

        } else {
            this.bfree = false;
        }
    }

    isBFree() {
        return this.bfree;
    }

    setPenZone(zone) {
        this.penZone = zone;
    }

    getPenZone() {
        return this.penZone;
    }

    getPenCentre() {
        if (this.penZone !== null) {
            return [this.penZone.x + this.penZone.width / 2, this.penZone.y + this.penZone.height / 2];
        }
    }

    makePenZoneHighlight(scene, zoneExtent) {
        if (this.penZone !== null) {
            console.log(zoneExtent);
            this.penZoneHighlight = scene.add.rectangle(
                zoneExtent[0], zoneExtent[1], zoneExtent[2], zoneExtent[3]
            ).setOrigin(0, 0).setFillStyle(0xefc53f).setAlpha(0);
            //this.penZoneHighlight = scene.add.rectangle(0, 176, 128, 96);
            //console.log(this.penZoneHighlight.getBounds());
            //this.penZoneHighlight
            //.setStrokeStyle(2, 0xefc53f);
        }


    }

    highlightPenZone(scene) {
        if (this.penZoneHighlight) {
            this.penZoneHighlightTween = scene.tweens.add({
                targets: this.penZoneHighlight,
                alpha: 0.8,
                yoyo: true,
                repeat: -1,
                ease: 'Sine.easeInOut',
                paused: true
            });
        }
    }

    /** Player's cash plus the value of their herd (healthy cows times normal price)
     *  Cow value may need to be changed
     */
    getAssets() {
        // Simplified
        // ((this.herdTotal - this.infections) * gameSettings.gameRules.normalCowPrice) + this.balance;
        return this.balance;
    }


    /**
     * Find a tile in a player pen for a cow
     * that IS NOT currently occupied by another cow
     * Used for spawning and transferring cows during sales
     * NOTE: x+1, y-1 below because of fence sprite, so we don't spawn on the fence
     * @return [x,y] coordinates
     */
    findRandomPenTile() {
        if (this.pen) {
            let freePenPoint = [
                (this.pen[0][0] + 1) + Math.round(Math.random() * this.pen[1][0] - 1),
                (this.pen[0][1] - 1) + Math.round(Math.random() * this.pen[1][1] - 1)
            ];
            // todo Make sure no cow shares this?
            return freePenPoint;
        }
        return null;

    }


    getPenTile(cowIndex) {
        let maxRows = Math.floor(this.pen[1][1] / 2); // 3
        let maxCols = 4; //Math.floor(this.pen[1][0] /2); // 4
        let row = Math.floor(cowIndex / maxCols);
        let col = Math.floor(cowIndex - (row * maxCols)) * 2;
        return [this.pen[0][0] + col, this.pen[0][1] + (row * 2)];

    }

    /**
     * Send this cow to any point in this farmer's pen
     * @param cow
     *
     */
    async sendCowToPen(cow) {
        cow.isMoving = true;
        let penPoint = this.getPenTile(this.herdTotal + 1); //this.findRandomPenTile();
        if (penPoint) {
            let done = await cow.calculateMovePath(
                penPoint[0], penPoint[1]
            );
            if (done) {
                if (cow.movePath.length > 0) {
                    done = await cow.moveCowAlongPath(cow.cowSpeed);
                    if (done) {
                        return -1;
                    } else {
                        return 0;
                    }
                } else {
                    console.log("No moves!");
                    return 0;
                }


            }
        } else {
            this.debug("ERROR: Pen not assigned for " + owner.name);

        }
    }

    getCows(herd) {
        let myCows = [];
        for (let c = 0; c < herd.length; c++) {
            if (herd[c].owner === this) {
                myCows.push(herd[c]);
            }
        }
        return myCows;
    }

}

/**
 * A computer farmer player, with functions to determine
 * behaviour
 */
export class AIFarmer extends Farmer {
    constructor(id, name, balance, sprite, farmerStart, threshold) {
        super(id, name, balance, sprite, farmerStart);
        this.threshold = threshold;
        this.isPlayer = false;
    }


}

/**
 * Human player farmer.
 */
export class Player extends Farmer {
    constructor(id, name, balance, sprite, farmerStart) {
        super(id, name, balance, sprite, farmerStart);
        this.isPlayer = true;
        this.farmerSlug = gameSettings.gameRules.playerSlug;
    }
}
