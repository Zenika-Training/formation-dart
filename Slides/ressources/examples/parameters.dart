positional([first="Default Value", second]) {
  print("$first ${second != null ? second : ''}");
}

named({first: "Default Value", second}) {
  print("$first ${second != null ? second : ''}");
}

main() {
  positional('Hello', 'World');
  named(first: 'Hello', second: 'World');
}
