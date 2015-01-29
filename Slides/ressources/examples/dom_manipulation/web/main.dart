// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

void main() {
  document.querySelector('#content')
    ..append(new Element.html('<div id="foo">I\'m foo!</div>'))
    ..insertAdjacentElement('afterBegin',
      new Element.html('<div id="bar">I\'m bar!</div>')
    )
    ..insertAdjacentElement('beforeBegin',
      new Element.html('<h1>Hello Dartisans!</h1>')
    );
}

