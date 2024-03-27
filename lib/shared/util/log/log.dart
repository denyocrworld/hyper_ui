import 'package:hyper_ui/core.dart';

p(String message) {
  print(message);
}

py(String message) {
  printy(message);
}

pr(String message) {
  printr(message);
}

pg(String message) {
  printg(message);
}

po(String message) {
  printo(message);
}

pb(String message) {
  printb(message);
}

dynamic get pl => p('----------------------');
dynamic get pyl => py('----------------------');
dynamic get prl => pr('----------------------');
dynamic get pgl => pg('----------------------');
dynamic get pol => po('----------------------');
dynamic get pbl => pb('----------------------');

void printr(String text) {
  print('\x1B[31m$text\x1B[0m');
}

void printg(String text) {
  print('\x1B[32m$text\x1B[0m');
}

void printo(String text) {
  print('\x1B[38;5;208m$text\x1B[0m');
}

void printy(String text) {
  print('\x1B[33m$text\x1B[0m');
}

void printb(String text) {
  print('\x1B[34m$text\x1B[0m');
}

ss(String message) {
  snackbarSuccess(message: message);
}

se(String message) {
  snackbarDanger(message: message);
}
