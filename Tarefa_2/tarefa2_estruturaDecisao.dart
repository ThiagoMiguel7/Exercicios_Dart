import 'dart:io';

void main() {

  double num1 = getNumber();
  print("Numero 1 aceito!");
  double num2 = getNumber();
  print("Numero 2 aceito!");

  int operacao = getOperacao();
  double result = 0;

  switch(operacao) {
    case 1:
      result = num1 + num2;
      break;
    case 2:
      result = num1 - num2;
      break;
    case 3:
      result = num1 * num2;
      break;
    case 4:
      if(num2 == 0) {
        print("Divisão inválida");
        return;
      }
      result = num1 / num2;
      break;
    default:
      break;
  }

  String res = "${result} é ${result.isNegative ? "negativo" : "positivo"}, ${result % 2 == 0 ? "par": "impar"}, ${result % 1 == 0 ? "inteiro" : "decimal"}";
  print(res);
}

double getNumber() {

  double num;
  String? inputNum;

  do {
    print('Informe um número:');
    inputNum = stdin.readLineSync();

    num = double.tryParse(inputNum!) ?? double.nan;
    if (num.isNaN) {
      print("Número inválido! Digite um número válido.\n");
    }
  } while (num.isNaN);

  return num;
}

int getOperacao() {

  String? input;
  bool valid = false;

  do {
    print("\nEscolha a operação:\n\n1-Adição\n2-Subtração\n3-Multiplicação\n4-Divisão\n\n");
    input = stdin.readLineSync();

    valid = RegExp(r'^[1-4]$').hasMatch(input!);
    if(!valid) {
      print("Opção inválida\n");
    }
  } while(!valid);

  return int.parse(input);
}