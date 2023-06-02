const server = require("./server");

const port = process.env.SERVER_PORT || 5000;

const startPingPongServer = () => {
	try {
		server.listen(port);
		console.log(`Server is running on port ${port}`);
	} catch (error) {
		console.log(error);
	}
};

startPingPongServer();
