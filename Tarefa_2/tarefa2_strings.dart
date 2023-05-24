import 'dart:io';

void main() {

  bool isValid;
  String? cpf;

  do {
    print("Digite o número de CPF no formato xxx.xxx.xxx-xx:");
    cpf = stdin.readLineSync();
    isValid = validarCPF(cpf!);

    if (isValid) {
      print("CPF válido!");
    } else {
      print("CPF inválido!\n");
    }
  } while (!isValid);
}

bool validarCPF(String cpf) {

  cpf = cpf.replaceAll(".", "").replaceAll("-", "");

  if (cpf.length != 11) {
    return false;
  }

  if (RegExp(r"^(.)\1+$").hasMatch(cpf)) {
    return false;
  }

  int soma = 0;
  for (int i = 0; i < 9; i++) {
    soma += int.parse(cpf[i]) * (10 - i);
  }
  int digito1 = 11 - (soma % 11);
  if (digito1 >= 10) {
    digito1 = 0;
  }
  if (digito1 != int.parse(cpf[9])) {
    return false;
  }

  soma = 0;
  for (int i = 0; i < 10; i++) {
    soma += int.parse(cpf[i]) * (11 - i);
  }
  int digito2 = 11 - (soma % 11);
  if (digito2 >= 10) {
    digito2 = 0;
  }
  if (digito2 != int.parse(cpf[10])) {
    return false;
  }

  return true;
}