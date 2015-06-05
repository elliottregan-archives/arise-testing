var koa = require('koa'),
    serve = require('koa-static'),
    router = require('koa-router'),
    send = require('koa-send'),
    koaBody = require('koa-body'),
    fs = require('fs');

var app = koa();
app.use(koaBody())
app.use(router(app));
app.use(serve(__dirname + '/tmp'));

var sitePages = [

  "/"
]

// This enables HTML5Mode in AngularJS by forwarding missing files to the index.html
app.get('/:page', function *() {
  console.log("this.request.url",this.request.url, this.request.url.split("/"))
  var requestedResource = this.request.url.split("/").filter(function(v){return v!==''})[0]
  
  // if (sitePages.indexOf(requestedResource) > -1) {
  yield send(this,__dirname + '/tmp/'+requestedResource+'.html');
  // }
  // else if (requestedResource === "") {
  //   yield send(this,__dirname + '/tmp/index.html');
  // }
  // else {
  //   yield send(this, this.path, { root: __dirname + '/tmp' });
  // }
});

var port = parseFloat(process.env.PORT) || 80;
app.listen(port, function(){
  console.log('Server is now running on port ' + port);
});
