/*jshint esversion: 8 */


/*
Stats of current game like turns, current player etc.
 */
export let gameState = {
    currentTurn: 0,
    clickEnabled: true,
    isOnBoarding: true, //Display help messages
    currentState: null,
    textScrolling: false,
    control_group: 1,
    lastTransactionOrderNo: 0,
    playerID: "TESTER",
    gameID: 0,
    playerDatabaseID: 0,
    highestScore: 0,
    gamesPlayed: 0,
    infectionTotal: 0,
    playerSpriteKeyFrame:null,
    playerPortrait:null,
    player:null,
    winner:null, // Filled in at the end of the last turn
    winnerSpriteKeyFrame:null // Needed b/c sprite will be destroyed
};
