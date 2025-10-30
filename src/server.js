const express = require("express");
const app = express();
const port = 3000;

const pool = process.env.APP_POOL || "unknown";
const release = process.env.RELEASE_ID || "none";

app.get("/version", (req, res) => {
    res.setHeader("X-App-Pool", pool);
    res.setHeader("X-Release-Id", release);
    res.json({ status: "OK", message: "Version endpoint working" });
});

app.get("/healthz", (req, res) => res.sendStatus(200));

app.listen(port, () => {
    console.log(`Running ${pool} on port ${port}`);
});
