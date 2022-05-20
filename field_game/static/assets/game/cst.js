/*jshint esversion: 8 */

export const GAMESCENENAME = 'GameScene';
export const UISCENENAME = 'UIScene';
export const BFREESCENENAME = 'BFreeScene';
export const TRADINGSCENENAME = 'TradingScene';
export const TITLESCENENAME = 'TitleScene';
export const DEBUG = true;

/*
Game constants like prices, starting players etc.
 */
export const gameSettings = {
    gameRules: {
        startHerdSize: 20,
        startFarmerBalance: 200,
        AIFarmerTotal: 6,
        totalRounds: 8,
        // AI farmer will join scheme at least once per this many turns
        bfreeTrigger: 4,
        bfreeJoinCost: 40, // Cost to join scheme
        // Cow prices, buy and sell
        bfreeCowPrice: 30,
        normalCowPrice: 20,
        cowSpeed: 150
    },
    EVENTS: {
        ADVANCEDIALOG: 'advance',
        DIALOGFINISHED: 'dialogFinished',
        BOARDTOUCHED: "boardTouched",
        HOSPITALTOUCHED: "hospitalTouched",
        PLAYERPENTOUCHED: "playerpenTouched",
        AIFARMERPENTOUCHED: "aipenTouched",
        BFREEPHASEEND: "BFREEPHASECOMPLETE", // Wrap up
        BFREEPHASECOMPLETE: "BFREEPHASECOMPLETE", // Phase complete, move on
        TRADINGPHASEEND: "TRADINGPHASEEND",
        TRADINGPHASECOMPLETE: "TRADINGPHASECOMPLETE"
    },
    DIALOGSPEEDS:{
        slow:2,
        normal:3,
        fast:4
    }

};

/**
 * Custom event string names
 *
 */

