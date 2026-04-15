const functions = require("firebase-functions");
const fetch = require("node-fetch");

exports.searchGameLiam = functions.https.onRequest(async (req, res) => {
  try {
    // 🔥 CORS HEADERS
    res.set("Access-Control-Allow-Origin", "*");
    res.set("Access-Control-Allow-Methods", "POST, OPTIONS");
    res.set("Access-Control-Allow-Headers", "Content-Type");

    // Handle preflight request
    if (req.method === "OPTIONS") {
      return res.status(204).send("");
    }

    // 🔥 Get query from request body
    const query = req.body.query;

    const response = await fetch("https://api.igdb.com/v4/games", {
      method: "POST",
      headers: {
        "Client-ID": "yjbcbf2fv9zptbu4ow8u53nt1ze4gd",
        Authorization: "Bearer 1jbtvazdxa0h1gfpzcg1hltj8kmqiw",
        "Content-Type": "text/plain",
      },
      body: query,
    });

    const result = await response.json();

    return res.status(200).json(result);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: error.message });
  }
});
