import 'dart:io';

void main() {
  int num = getNumber();
  int sum = 0;
  String? input;

  for (int i = 0; i < num; i++) {
    bool valid = false;
    do {
      print("Entre com a idade da pessoa ${i + 1}:");
      input = stdin.readLineSync();
      valid = isNumber(input!);
      if (!valid) {
        print("Idade inválida! Digite uma idade válida");
      }
    } while (!valid);
    sum += int.parse(input);
  }

  double media = sum / num;

  if (media >= 0 && media <= 25) {
    print("Jovem");
  } else if (media > 25 && media <= 60) {
    print("Adulta");
  } else {
    print("Idosa");
  }
}

int getNumber() {
  String? input;
  bool valid = false;

  do {
    print("Entre com quantidade de pessoas:\n");
    input = stdin.readLineSync();
    valid = isNumber(input!);
    if (!valid) {
      print("Número invalido! Digite um número válido.\n");
    }
  } while (!valid);
  return int.parse(input);
}

bool isNumber(String input) {
  final regex = RegExp(r'^\d+$');
  return regex.hasMatch(input);
}
