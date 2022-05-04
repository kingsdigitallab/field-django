/*jshint esversion: 6 */

// Game classes
export class Farmer {

    constructor(id, name, balance, sprite, farmerStart) {
        this.id = id;
        this.name = name;
        this.balance = balance;
        this.sprite = sprite;
        this.farmerStart =farmerStart;
    }

}

export class AIFarmer extends Farmer {

    /**
     * Decide if farmer will join the scheme this turn
     *
     * with probability Time_since_last_sale[farm] ÷ bfree trigger
     * return TRUE otherwise return FALSE
     */
    calculate_scheme_choice(bfreeTrigger){

    }

    /**
     * Decide which farmer to purchase a cow from
     *
     * Choose one number n from {0,1,2,…8} farm } with probability
     * proportional to (1 + Time_since_bfree[ n preference shape
     * Return n
     *
     * @param farmers in the game
     */
    calculate_purchase_choice(farmers){

    }
}

export class Player extends Farmer {
    constructor(id, name, balance, sprite, farmerStart) {
        super(id, name, balance, sprite, farmerStart);
    }
}
