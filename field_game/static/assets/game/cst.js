/*jshint esversion: 8 */

/*
Game constants like prices, starting players etc.
 */
export const gameSettings = {
    DEBUG: true,
    apiURLs: {
            'game': '/game/api/games/',
            'event': '/game/api/events/',
            'farmer': '/game/api/farmers/',
        },
    gameRules: {
        startHerdSize: 48, //48
        startFarmerBalance: 20,
        AIFarmerTotal: 5,
        totalTurns: 2, //6
        // AI farmer will join scheme at least once per this many turns
        bfreeTrigger: 4,
        bfreeJoinCost: 5, // Cost to join scheme
        // Cow prices, buy and sell
        bfreeCowPrice: 5,
        normalCowPrice: 5,
        cowSpeed: 50,
        cowScale: 0.75,
        infectionBeta: 0.5,
        startingInfections: 1,
        playerSlug: "Player1",
        warmupRounds: 1
    },
    gameboardInfo: {
        herdSpawn: [19, 29],
        playerHouse: [[17, 4], [4, 4]],
        playerCowPen: [[16, 11], [8, 7]],
        farmerCowPens: [
            [[1, 11], [9, 7]],
            [[1, 47], [9, 7]],
            [[16, 47], [7, 6]],
            [[32, 47], [7, 6]],
            [[32, 11], [7, 6]],

        ],
        farmerCowPenHighlights: [
            [[0, 11], [8, 6]],
            [[0, 47], [8, 6]],
            [[15, 47], [8, 6]],
            [[31, 47], [8, 6]],
            [[31, 11], [8, 6]],

        ],
        player: {
            start: [18, 7],
            house: [[17, 6], 4, 4]
        },
        farmerStarts: [
            [3, 7], [3, 43], [19, 43], [35, 43], [35, 7]
        ],
        hospital: {
            extent: [[17, 22], [4, 3]],
            door: [19, 27]
        }
    },
    SCENENAMES: {
        TITLESCENENAME: 'TitleScene',
        HIGHSCORESCENE:'NAMEINPUTSCENE',
        CHARACTERSELECTSCENE:'CharacterSelectScene',
        GAMESCENENAME: 'GameScene',
        UISCENENAME: 'UIScene',
        BFREESCENENAME: 'BFreeScene',
        TRADINGSCENENAME: 'TradingScene',
        TURNENDSCENENAME: "RoundEndScene",
        GAMEENDSCENENAME: "GameEndScene",
        GAMERESTARTSCENENAME: "GameRESTARTScene"
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
        INFECTIONLEVELUPDATED: "INFECTIONLEVELUPDATED",
        TURNUPDATED:"TURNUPDATED",
        HELPSCREENTOGGLE:"HELPSCREENTOGGLE",
        BFREEUPDATED: "BFREEUPDATED",
        SCOREBOARDFINISH: "SCOREBOARDFINISH",
        TURNSTART: "TURNBEGINS", // Start of turn
        TURNEND: "TURNENDS", // End of turn
        GAMEEND: "GAMEENDS", // End of game
    },
    DIALOGSPEEDS: {
        slow: 2,
        normal: 30,
        fast: 60
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
        'farmer_owl': 50,
        'farmer_roach': 58,
        'farmer_robot2': 66,
        'farmer_ghost': 74,
    },
    ANNIMAL_FRAMES: {
        'snake_1': 0,
        'snake_2': 8,
        'mouse_1': 144,
        'pigeon_1': 240,
        'bear_1': 192,
    },
    CHARACTERSPRITESCALE: 1.5, //Scale for farmer sprites
    PORTRAITSCALE: 2, // Player portrait scale

};

/**
 * Different phases of the game
 *
 * @type {{BOVINO: number, BOVISTART: number, TURNEND: number, TRADINGSTART: number, TRADINGCHOOSE: number, TRADINGFINISH: number, GAMEEND: number, CHARACTERSELECT: number, BOVICHOOSE: number, TURNSTART: number, BOVIYES: number}}
 */
export const States = {
    CHARACTERSELECT: 0,
    TURNSTART: 1,
    BOVISTART: 2,
    BOVICHOOSE: 2,
    BOVINO: 3,
    BOVIYES: 4,
    TRADINGSTART: 51,
    TRADINGCHOOSE: 52,
    TRADINGPARTNERCHOOSEN: 53,
    TRADINGAI: 10,
    TRADINGFINISH:7,
    TURNEND: 8,
    TURNENDFINISH: 9,

    GAMEEND: 20,
};
