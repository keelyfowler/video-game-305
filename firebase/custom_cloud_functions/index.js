const admin = require("firebase-admin/app");
admin.initializeApp();

const searchGameLiam = require("./search_game_liam.js");
exports.searchGameLiam = searchGameLiam.searchGameLiam;
