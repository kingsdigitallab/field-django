/*jshint esversion: 8 */


/*
Game constants like prices, starting players etc.
 */
export const gameSettings = {
    DEBUG: true,
    gameRules: {
        startHerdSize: 40,
        startFarmerBalance: 20,
        AIFarmerTotal: 4,
        totalTurns: 8,
        // AI farmer will join scheme at least once per this many turns
        bfreeTrigger: 4,
        bfreeJoinCost: 1, // Cost to join scheme
        // Cow prices, buy and sell
        bfreeCowPrice: 2,
        normalCowPrice: 2,
        cowSpeed: 150,
        infectionBeta: 0.5,
        startingInfections: 1
    },
    SCENENAMES: {
        TITLESCENENAME: 'TitleScene',
        GAMESCENENAME: 'GameScene',
        UISCENENAME: 'UIScene',
        BFREESCENENAME: 'BFreeScene',
        TRADINGSCENENAME: 'TradingScene',
        TURNENDSCENENAME: "RoundEndScene",
        GAMEENDSCENENAME: "GameEndScene"
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
        // Player stats update events for UI
        PLAYERBALANCEUPDATED: "PLAYERBALANCEUPDATED",
        PLAYERHERDUPDATED: "PLAYERHERDUPDATED",
        BFREEUPDATED: "BFREEUPDATED",
        TURNSTART: "TURNBEGINS", // Start of turn
        TURNEND: "TURNENDS", // End of turn
        GAMEEND: "GAMEENDS", // End of game


    },
    DIALOGSPEEDS: {
        slow: 2,
        normal: 3,
        fast: 4
    },
    TRANSACTIONEVENTTYPES: {
        Trade: 1,
        JoinBFree: 2,
        Infection: 3
    },
    INFECTIONTHRESHOLDS: [
         {
            local: 0,
            global: 0
        },
        {
            local: 3,
            global: 6
        },
        {
            local: 6,
            global: 12
        },
        {
            local: 9,
            global: 18
        },
    ]

};

/**
 * Custom event string names
 *
 */

