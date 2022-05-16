/*jshint esversion: 6 */
/**
 * Central event system for the game
inspired by:
 https://blog.ourcade.co/posts/2020/phaser3-how-to-communicate-between-scenes/
 */
const eventsCenter = new Phaser.Events.EventEmitter()
export default eventsCenter;
