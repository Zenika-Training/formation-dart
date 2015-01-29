// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:convert';

void main() {
  HttpRequest.getString('http://localhost:1234/').then((String s) {
    document.querySelector('body').text = s;
  });
  HttpRequest.postFormData('http://localhost:1234/post', {'foo': 'bar'});

  HttpRequest.request('http://localhost:1234/putWithRequest',
    method: 'PUT',
    requestHeaders: {'Content-Type': 'application/json'},
    sendData: JSON.encode({'hello': 'world'})
  ).then((HttpRequest response) => print(response.responseText));

//  var request = new HttpRequest();
//  request.open('GET', 'http://localhost:1234/');
//  request.onLoad.listen((event) {
//    document.querySelector('body').text = event.target.responseText;
//  });
//  request.send();
}

