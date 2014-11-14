/// This program should be executed with the checked mode to show the error detection while developing
/// This
void main() {
  var first = 1;
  print(first);

  first = 'foo'; // ???
  print(first);

  String second = 'bar';
  print(second);

  second = 2; // ???
  print(second);
}
