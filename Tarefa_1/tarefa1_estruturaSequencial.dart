import 'dart:io';

void main() {
  double altura;
  String? inputAltura;
  String? inputGenero;
  String genero;
  double pesoIdeal;

  do {
    print("Digite a sua altura em metros: ");
    inputAltura = stdin.readLineSync();

    altura = double.tryParse(inputAltura!) ?? -1;
    if (altura < 0) {
      print("Altura inválida! Digite um número válido.\n");
    }
  } while (altura < 0);

  do {
    print("Digite o seu gênero (M para masculino ou F para feminino): ");
    inputGenero = stdin.readLineSync();
    genero = inputGenero?.toUpperCase() ?? '';
    if (genero != "M" && genero != "F") {
      print("Gênero inválido! Digite M ou F.\n");
    }
  } while (genero != "M" && genero != "F");

  if (genero == "M") {
    pesoIdeal = (72.7 * altura) - 58;
  } else if (genero == "F") {
    pesoIdeal = (62.1 * altura) - 44.7;
  } else {
    print("Gênero inválido!");
    return;
  }

  print(
      "O peso ideal para uma pessoa com altura de $altura m e gênero $genero é de $pesoIdeal kg.");
}
