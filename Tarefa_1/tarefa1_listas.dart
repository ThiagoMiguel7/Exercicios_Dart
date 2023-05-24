import 'dart:io';

void main() {
  List<double> temperaturas = [];

  List<String> meses = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro'
  ];

  double? temperatura;
  String? input;
  int i = 0;

  do {
    stdout.write('Digite a temperatura média de ${meses[i]}: ');
    input = stdin.readLineSync();
    temperatura = double.tryParse(input!);

    if (temperatura != null) {
      temperaturas.add(temperatura);
      i++;
    } else {
      print('Por favor, digite um número válido.');
    }

  } while (i < 12);


  double soma = 0;
  for (var temperatura in temperaturas) {
    soma += temperatura;
  }
  double mediaAnual = soma / temperaturas.length;


  print('\n Temperaturas acima da média anual (${mediaAnual.toStringAsFixed(2)}ºC):');
  for (var i = 0; i < 12; i++) {
    if (temperaturas[i] > mediaAnual) {
      print('${meses[i]}: ${temperaturas[i].toStringAsFixed(2)}ºC');
    }
  }
}
