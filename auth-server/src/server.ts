import { Constants } from "./constants";
import express from "express";
const app: express.Application = express();

app.get("/hello", (req, res, next) => {
  console.log("hello called!");
  res.status(200).send("hello");
  next();
});

app.post("/auth/user", (req, res, next) => {
  console.log("called!");
  res.status(200).send(Constants.ALLOW);
  next();
});

app.post("/auth/resource", (req, res, next) => {
  res.status(200).send(Constants.ALLOW);
  next();
});

app.post("/auth/vhost", (req, res, next) => {
  res.status(200).send(Constants.ALLOW);
  next();
});

app.post("/auth/topic", (req, res, next) => {
  res.status(200).send(Constants.ALLOW);
  next();
});

// start application
app.listen(7070, "0.0.0.0", 1024, err => {
  if (!err) {
    console.log("Application started on port: 7070");
  } else {
    console.log(err);
  }
});
