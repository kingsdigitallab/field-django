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
    gameboardInfo: {
        herdSpawn: [19, 29],
        playerHouse: [[17, 0], [4, 4]],
        playerCowPen: [[15, 7], [9, 7]],
        farmerCowPens: [
            [[0, 7], [9, 7]],
            [[0, 43], [9, 7]],
            [[15, 43], [9, 7]],
            [[31, 43], [9, 7]],
            [[31, 7], [8, 7]],

        ],
        player: {
            start: [18, 3],
            house: [[17, 0], 4, 4]
        },
        farmerStarts: [
            [3, 3], [3, 39], [19, 39], [35, 39], [35, 3]
        ],
        hospital: {
            extent: [[17, 18], [4, 3]],
            door: [19, 24]
        }
    },
    SCENENAMES: {
        TITLESCENENAME: 'TitleScene',
        CHARACTERSELECTSCENE:'CharacterSelectScene',
        GAMESCENENAME: 'GameScene',
        UISCENENAME: 'UIScene',
        BFREESCENENAME: 'BFreeScene',
        TRADINGSCENENAME: 'TradingScene',
        TURNENDSCENENAME: "RoundEndScene",
        GAMEENDSCENENAME: "GameEndScene"
    },
    EVENTS: {
        UICREATED:'UICREATED',
        ONCHARACTERSELECTED:'onCHARACTERSELECTED',
        ONCHARACTERSELECTEDFINISHED:'characterSelectedFINISHED',

        BOARDTOUCHED: "boardTouched",
        HOSPITALTOUCHED: "hospitalTouched",
        PLAYERPENTOUCHED: "playerpenTouched",
        PLAYERHOUSETOUCHED: "playerHouseTouched",
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
    ],
    CHARACTER_KEY:'creature_farmers',
    CHARACTER_FRAMES: {
        'farmer_alien': 10,
        'farmer_snail': 18,
        'farmer_balloon': 26,
        'farmer_robot': 34,
        'farmer_frog': 42,
        'farmer_roach': 50,
        'farmer_robot2': 58,
        'farmer_ghost': 66,
    },
    ANNIMAL_FRAMES: {
        'snake_1': 0,
        'snake_2': 8,
        'mouse_1': 144,
        'pigeon_1': 240,
        'bear_1': 192,
    },
    CHARACTERSPRITESCALE: 1.5 //Scale for farmer sprites

};

/**
 * Custom event string names
 *
 */

