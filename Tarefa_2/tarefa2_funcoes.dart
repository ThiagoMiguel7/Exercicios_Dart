import 'dart:io';

void main() {
  int n = getNumber();
  printMatrix(n);
}

int getNumber() {
  String? input;
  bool valid = false;
  do {
    print("Entre com numero:\n");
    input = stdin.readLineSync();
    valid = isNumber(input!);
    if(!valid) {
      print("Número invalido\n");
    }
  } while(!valid);
  return int.parse(input);
}

bool isNumber(String input) {
  final regex = RegExp(r'^\d+$');
  return regex.hasMatch(input);
}

void printMatrix(int n) {
  String res = "";
  for(int i=1; i<=n; i++) {
    for(int j=1; j<=i; j++) {
      res += "$j ";
    }
    print(res);
    res = "";
  }
}