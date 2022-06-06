/*jshint esversion: 8 */


/*
Game constants like prices, starting players etc.
 */
export const gameSettings = {
    DEBUG: true,
    gameRules: {
        startHerdSize: 28,
        startFarmerBalance: 200,
        AIFarmerTotal: 6,
        totalTurns: 8,
        // AI farmer will join scheme at least once per this many turns
        bfreeTrigger: 4,
        bfreeJoinCost: 40, // Cost to join scheme
        // Cow prices, buy and sell
        bfreeCowPrice: 30,
        normalCowPrice: 20,
        cowSpeed: 150,
        infectionBeta:0.5,
        startingInfections:1
    },
    SCENENAMES: {
        TITLESCENENAME: 'TitleScene',
        GAMESCENENAME: 'GameScene',
        UISCENENAME: 'UIScene',
        BFREESCENENAME: 'BFreeScene',
        TRADINGSCENENAME: 'TradingScene',
        TURNENDSCENENAME:"RoundEndScene",
        GAMEENDSCENENAME:"GameEndScene"
    },
    EVENTS: {
        STARTDIALOG: 'dialogStart',
        ADVANCEDIALOG: 'dialogAdvance',
        DIALOGFINISHED: 'dialogFinished',
        BOARDTOUCHED: "boardTouched",
        HOSPITALTOUCHED: "hospitalTouched",
        PLAYERPENTOUCHED: "playerpenTouched",
        AIFARMERPENTOUCHED: "aipenTouched",
        BFREEPHASEEND: "BFREEPHASECOMPLETE", // Wrap up
        BFREEPHASECOMPLETE: "BFREEPHASECOMPLETE", // Phase complete, move on
        TRADINGPHASEEND: "TRADINGPHASEEND",
        TRADINGPHASECOMPLETE: "TRADINGPHASECOMPLETE",
        BFREEJOINED: "BFREEJOINED", // Player has joined scheme
        PLAYERBALANCEUPDATED:"PLAYERBALANCEUPDATED",
        PLAYERHERDUPDATED:"PLAYERHERDUPDATED",
        BFREEUPDATED:"BFREEUPDATED"


    },
    DIALOGSPEEDS: {
        slow: 2,
        normal: 3,
        fast: 4
    }

};

/**
 * Custom event string names
 *
 */

