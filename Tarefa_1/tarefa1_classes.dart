import 'dart:io';

class Retangulo {
  double ladoA;
  double ladoB;

  Retangulo(this.ladoA, this.ladoB);

  void mudarLados(double novoLadoA, double novoLadoB) {
    ladoA = novoLadoA;
    ladoB = novoLadoB;
  }

  double returnA(){
    return ladoA;
  }

  double returnB(){
    return ladoB;
  }

  double calcularArea() {
    return ladoA * ladoB;
  }

  double calcularPerimetro() {
    return 2 * (ladoA + ladoB);
  }
}

void main() {

  double ladoA;
  double ladoB;
  String? inputLadoA;
  String? inputLadoB;

  do {
    print('Informe as medida do Lado A:');
    inputLadoA = stdin.readLineSync();

    ladoA = double.tryParse(inputLadoA!) ?? -1;
    if (ladoA < 0) {
      print("Medida inválida! Digite um número válido.\n");
    }
  } while (ladoA < 0);

  do {
    print('Informe as medidas do Lado B:');
    inputLadoB = stdin.readLineSync();

    ladoB = double.tryParse(inputLadoB!) ?? -1;
    if (ladoB < 0) {
      print("Medida inválida! Digite um número válido.\n");
    }
  } while (ladoB < 0);

  Retangulo retangulo = Retangulo(ladoA, ladoB);

  double area = retangulo.calcularArea();
  double perimetro = retangulo.calcularPerimetro();

  double areaPiso = 0.25; // Área de cada piso
  double comprimentoRodape = 2.5; // Comprimento de cada rodapé

  int quantidadePisos = (area / areaPiso).ceil();
  int quantidadeRodapes = (perimetro / comprimentoRodape).ceil();

  print('\nQuantidade de pisos necessários: $quantidadePisos');
  print('Quantidade de rodapés necessários: $quantidadeRodapes');
}