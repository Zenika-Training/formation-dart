import 'dart:html';

main() {
  document.querySelector('#foo')
    .classes
      ..add('test')
      ..remove('bar');
}