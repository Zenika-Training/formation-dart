import 'dart:io';

void main() {
  // Let's bind on localhost and port 8000
  HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 1234)
  .then((HttpServer server) {
    server.listen((HttpRequest request) {
      // Let's provide a handler which prints the method and the URI
      print('Request ${request.method} on ${request.uri}');
      // and returns the standard Hello World!
      request.response
        ..headers.add('Access-Control-Allow-Origin', '*')
        ..headers.add('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS')
        ..headers.add('Access-Control-Allow-Headers', 'Content-Type')
        ..write("Hello world!")
        ..close();
    });
  }).catchError((e) => print(e.toString()));
}

