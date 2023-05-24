import 'dart:io';

class Triangulo {
  double base;
  double altura;

  Triangulo(this.base, this.altura);

  double get area {
    return (base * altura) / 2;
  }

  void exibirDados() {
    print("Base: $base");
    print("Altura: $altura");
    print("Área: ${area.toStringAsFixed(2)}");
  }
}

void main() {

  double base;
  String? inputBase;
  double altura;
  String? inputAltura;

  do {
    print("Digite a base do triângulo:");
    inputBase = stdin.readLineSync();

    base = double.tryParse(inputBase!) ?? -1;
    if (base < 0) {
      print("Base inválida! Digite um número válido.\n");
    }
  } while (base < 0);

  do {
    print("Digite a altura do triângulo:");
    inputAltura = stdin.readLineSync();

    altura = double.tryParse(inputAltura!) ?? -1;
    if (altura < 0) {
      print("Altura inválida! Digite um número válido.\n");
    }
  } while (altura < 0);

  Triangulo triangulo = Triangulo(base, altura);
  triangulo.exibirDados();
}