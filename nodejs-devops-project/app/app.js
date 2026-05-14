const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("Node.js DrvOps project Running");
});

app.listen(3000, "0.0.0.0", () => {
  console.log("server running on port 3000");
});

