</> JavaScript
const app = require ("express");

cons app = express();

app.get("/", (req, res) => {
  res.send("Node.js DrvOps project Running ");
});

app.listen(3000, () => {
  console.log("server running on port 3000");
});

