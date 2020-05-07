const express = require('express');
var app = express();
var port = 9999;

function getRoot(request, response) {
    response.sendFile(path.resolve('dist/hardis-awesome-app/index.html'));
 }

 function getUndefined(request, response) {
     response.sendFile(path.resolve('dist/hardis-awesome-app/index.html'));
 }


 app.use(express.static('dist/hardis-awesome-app'));

 app.get('/', getRoot);
 app.get('/*', getUndefined);

 // Start server
 app.listen(port, function () {
    console.log('server running at port: ' + port);
}); 
