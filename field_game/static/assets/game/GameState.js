/*jshint esversion: 8 */


/*
Stats of current game like turns, current player etc.
 */
export let gameState = {
    currentTurn: 0,
    isOnBoarding: true, //Display help messages
    currentState: null,
    textScrolling: false,
    lastTransactionOrderNo: 0,
    playerID: "TESTER",
    gameID: 110,
    infectionTotal: 0,
    playerSpriteKeyFrame:null,
    player:null,
    winner:null, // Filled in at the end of the last turn
    winnerSpriteKeyFrame:null // Needed b/c sprite will be destroyed
};
