/*jshint esversion: 6 */

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
        this.farmerStart=farmerStart;
        this.bfree = false; // Are they part of Bovifree this turn?
        this.timeSinceLastSale = 0; // Time in turns since they last sold a cow
        this.infections = 0; // Number of infected cows in herd
        this.herdTotal = 0; // Total number of cows Farmer owns
        this.pen=[];

    }

    /**
     * Set if farmer is part of scheme
     * If True - Also remove all infections from herd
     * @param isBFree boolean are they part of scheme
     */
     setBFree(isBFree){
        if (isBFree === true){
            this.bfree=true;
            this.infections=0;
        }else{
            this.bfree=false;
        }
    }

    /**
     * Find a point in a player pen for a cow
     * that IS NOT currently occupied by another cow
     * Used for spawning and transferring cows during sales
     * @param penTileCoords top left of pen
     * @param width width of pen
     * @param height of pen
     * @return [x,y] coordinates
     */
    findRandomPenPoint(penTileCoords, width, height) {
        if (this.pen){
            let freePenPoint = [
                this.pen[0][0] + Math.round(Math.random() * this.pen[1]),
                this.pen[0][1] + Math.round(Math.random() * this.pen[2])
            ];
            // todo Make sure no cow shares this?
            return freePenPoint;
        }
        return null;

    }

}

/**
 * A computer farmer player, with functions to determine
 * behaviour
 */
export class AIFarmer extends Farmer {

    /**
     * Decide if farmer will join the scheme this turn
     *
     * with probability Time_since_last_sale[farm] ÷ bfree trigger
     * return TRUE otherwise return FALSE
     */
    calculateSchemeChoice(bfreeTrigger){
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
    calculatePurchaseChoice(farmers){
        // Todo this must be changed
        // after discussions so random choice
        // for now as a placeholder
        if (farmers &&farmers.length > 0){
            let choice = Math.round(Math.random() * farmers.length);
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
