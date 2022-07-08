/*jshint esversion: 8 */


/*
Game constants like prices, starting players etc.
 */
export const gameSettings = {
    DEBUG: true,
    gameRules: {
        startHerdSize: 48,
        startFarmerBalance: 20,
        AIFarmerTotal: 5,
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
    gameboardInfo:{
            herdSpawn: [19,29],
            playerHouse:[[17,0],[4,4]],
            playerCowPen: [[16, 7], [8, 6]],
            farmerCowPens: [
                [[0, 7], [8, 6]],
                [[0, 43], [8, 6]],
                [[16, 43], [8, 6]],
                [[32, 43], [8, 6]],
                [[32, 7], [8, 6]],

            ],
            player: {
                start: [18, 4],
                house: [[18, 1], 3, 4]
            },
            farmerStarts: [
                [4, 4], [2, 31], [20,31], [36, 31], [36, 4]
            ],
            hospital: {
                extent: [[17, 20], [4, 3]],
                door: [19, 24]
            }
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
        normal: 30,
        fast: 5
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
            global: 4
        },
        {
            local: 6,
            global: 8
        },
        {
            local: 9,
            global: 12
        },
        {
            local: 9,
            global: 16
        },
    ]

};

/**
 * Custom event string names
 *
 */

