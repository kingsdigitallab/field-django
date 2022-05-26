/*jshint esversion: 8 */

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
        this.slug = this.name.replace(' ','_');

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


    /**
     * Find a tile in a player pen for a cow
     * that IS NOT currently occupied by another cow
     * Used for spawning and transferring cows during sales
     * @param penTileCoords top left of pen
     * @param width width of pen
     * @param height of pen
     * @return [x,y] coordinates
     */
    findRandomPenTile(penTileCoords, width, height) {
        if (this.pen) {
            let freePenPoint = [
                this.pen[0][0] + Math.round(Math.random() * this.pen[1][0]),
                this.pen[0][1] + Math.round(Math.random() * this.pen[1][1])
            ];
            // todo Make sure no cow shares this?
            return freePenPoint;
        }
        return null;

    }

    /**
     * Send this cow to any point in this farmer's pen
     * @param cow
     *
     */
    async sendCowToPen(cow) {
        cow.isMoving = true;
        let penPoint = this.findRandomPenTile();
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
                }else{
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
    constructor(id, name, balance, sprite, farmerStart) {
        super(id, name, balance, sprite, farmerStart);
    }

    /**
     * Decide if farmer will join the scheme this turn
     *
     * with probability Time_since_last_sale[farm] ÷ bfree trigger
     * return TRUE otherwise return FALSE
     */
    calculateSchemeChoice(bfreeTrigger) {
        return Math.random() <= (this.timeSinceLastSale / bfreeTrigger);
    }

    /**
     * Decide which farmer to purchase a cow from
     *
     * Choose one number n from {0,1,2,…8} farm } with probability
     * proportional to (1 + Time_since_bfree[n])^(-preference shape)
     * Return n
     *
     * @param farmers in the game
     * @return farmer we're buying from
     */
    calculatePurchaseChoice(farmers) {
        // Todo this must be changed
        // after discussions so random choice
        // for now as a placeholder
        if (farmers && farmers.length > 0) {
            let selected = false;
            let choice = Math.ceil(Math.random() * farmers.length) - 1;
            return farmers[choice];
        }
        return null;

    }


}

/**
 * Human player farmer.
 */
export class Player extends Farmer {
    constructor(id, name, balance, sprite, farmerStart) {
        super(id, name, balance, sprite, farmerStart);
    }
}
