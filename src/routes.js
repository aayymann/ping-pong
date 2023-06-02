const routes = require("express").Router();

routes.get("/ping", (req, res) => {
	res.status(200).json({ message: "pong" });
});

routes.get("/ping", (req, res) => {
	res.status(200).json({ message: "pong" });
});

routes.get("/test", (req, res) => {
	res.status(200).json({ message: "Service is up and running" });
});

module.exports = routes;
