import 'dart:io';

void main() {
  double pesoLimite = 50.0;
  double valorMulta = 4.0;

  double pesoPeixes;
  String? inputPesoPeixes;
  do {
    print('Informe o peso dos peixes: ');
    inputPesoPeixes = stdin.readLineSync();

    pesoPeixes = double.tryParse(inputPesoPeixes!) ?? -1;
    if (pesoPeixes < 0) {
      print("Medida inválida! Digite um número válido.\n");
    }
  } while (pesoPeixes < 0);

  double excesso = 0.0;
  double multa = 0.0;

  if (pesoPeixes > pesoLimite) {
    excesso = pesoPeixes - pesoLimite;
    multa = excesso * valorMulta;
  }

  print('\nPeso dos peixes: $pesoPeixes kg');

  if (excesso > 0.0) {
    print('Excesso de peso: $excesso kg');
    print('Valor da multa a pagar: R\$ ${multa.toStringAsFixed(2)}');
  } else {
    print('Dentro do limite de peso. Nenhuma multa será aplicada.');
  }
}



