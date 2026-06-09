const express = require("express");

const app = express();

app.get("/", (req, res) => {
  res.send("Docker Live Sync Test 123");
});

app.listen(3000, () => {
  console.log("Server running on port 3000");
});
