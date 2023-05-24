import 'dart:io';

void main() {
  String? notaParcial1;
  double np1;
  String? notaParcial2;
  double np2;
  double media;
  String conceito;

  do {
    print("Digite a sua nota parcial 1 entre zero e dez: ");
    notaParcial1 = stdin.readLineSync();

    np1 = double.tryParse(notaParcial1!) ?? -1;
    if (np1 < 0 || np1 > 10) {
      print("Nota parcial 1 inválida! Digite uma nota parcial 1 válida.\n");
    }
  } while (np1 < 0 || np1 > 10);

  do {
    print("Digite a sua nota parcial 2 entre zero e dez: ");
    notaParcial2 = stdin.readLineSync();

    np2 = double.tryParse(notaParcial2!) ?? -1;
    if (np2 < 0 || np2 > 10) {
      print("Nota parcial 2 inválida! Digite uma nota parcial 2 válida.\n");
    }
  } while (np2 < 0 || np2 > 10);

  media = (np1 + np2) / 2;

  if (media >= 9 && media <= 10) {
    conceito = 'A';
  } else if (media >= 7.5 && media < 9) {
    conceito = 'B';
  } else if (media >= 6 && media < 7.5) {
    conceito = 'C';
  } else if (media >= 4 && media < 6) {
    conceito = 'D';
  } else {
    conceito = 'E';
  }

  print("\nNota parcial 1: $notaParcial1");
  print("Nota parcial 2: $notaParcial2");
  print("Média: $media");
  print("Conceito: $conceito");

  switch (conceito) {
    case 'A':
    case 'B':
    case 'C':
      print("APROVADO");
      break;

    case 'D':
    case 'E':
      print("REPROVADO");
      break;
  }
}
