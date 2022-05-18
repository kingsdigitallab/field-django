/*jshint esversion: 8 */

export const GAMESCENENAME='GameScene';
export const UISCENENAME='UIScene';
export const BFREESCENENAME='BFreeScene';
export const TRADINGSCENENAME='TradingScene';
export const TITLESCENENAME='TitleScene';

/**
 * Custom event string names
 *
 */
export const EVENTS={
    ADVANCEDIALOG:'advance',
    DIALOGFINISHED:'dialogFinished',
    BOARDTOUCHED:"boardTouched",
    HOSPITALTOUCHED:"hospitalTouched",
    PLAYERPENTOUCHED:"playerpenTouched",
    AIFARMERPENTOUCHED:"aipenTouched",
    BFREEPHASEEND:"BFREEPHASECOMPLETE", // Wrap up
    BFREEPHASECOMPLETE:"BFREEPHASECOMPLETE", // Phase complete, move on
    TRADINGPHASEEND:"TRADINGPHASEEND",
    TRADINGPHASECOMPLETE:"TRADINGPHASECOMPLETE"
};
