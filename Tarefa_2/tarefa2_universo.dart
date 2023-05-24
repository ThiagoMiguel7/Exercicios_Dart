import 'dart:io';

const String asteroide = 'asteroide';
const String planeta = 'planeta';
const String nebulosa = 'nebulosa';

void main() {
  List<CorpoCeleste> corposCelestes = [];

  for (int i = 1; i <= 6; i++) {
    print('--- Corpo Celeste $i ---');
    String nome = lerEntrada('Nome: ');
    String tipo = lerTipo();
    double massa = lerEntradaNumerica('Massa: ');
    double tamanho = lerEntradaNumerica('Tamanho: ');

    CorpoCeleste corpoCeleste = CorpoCeleste(nome, tipo, massa, tamanho);
    corposCelestes.add(corpoCeleste);
  }

  int quantidadeAsteroides = contarCorposCelestes(corposCelestes, 'asteroide');
  int quantidadePlanetas = contarCorposCelestes(corposCelestes, 'planeta');
  int quantidadeNebulosas = contarCorposCelestes(corposCelestes, 'nebulosa');

  print('\nQuantidade de asteroides: $quantidadeAsteroides');
  print('Quantidade de planetas: $quantidadePlanetas');
  print('Quantidade de nebulosas: $quantidadeNebulosas');
}

String lerEntrada(String prompt) {
  stdout.write(prompt);
  return stdin.readLineSync()!;
}

double lerEntradaNumerica(String prompt) {
  String input;
  bool valid = false;
  do {
    input = lerEntrada(prompt);
    valid = isNumber(input);
    if(!valid) {
      print("Número inválido!");
    }
  } while(!valid);
  return double.parse(input);
}

String lerTipo() {
  bool valid = false;
  String tipo = "";
  do {
    tipo = lerEntrada('Tipo (asteroide, planeta, nebulosa): ');
    tipo = tipo.toLowerCase();
    valid = tipo == asteroide || tipo == planeta || tipo == nebulosa;
    if(!valid) {
      print("Tipo inválido");
    }
  } while(!valid);
  return tipo;
}

bool isNumber(String input) {
  final regex = RegExp(r'^\d+(\.\d+)?$');
  return regex.hasMatch(input);
}

int contarCorposCelestes(List<CorpoCeleste> corposCelestes, String tipo) {
  return corposCelestes.where((corpoCeleste) => corpoCeleste.tipo == tipo).length;
}

class CorpoCeleste {
  String nome;
  String tipo;
  double? _massa;
  double? _tamanho;

  CorpoCeleste(this.nome, this.tipo, double massa, double tamanho) {
    _massa = massa;
    _tamanho = tamanho;
  }

  double get massa => _massa ?? 0.0;
  set massa(double value) => _massa = value;

  double get tamanho => _tamanho ?? 0.0;
  set tamanho(double value) => _tamanho = value;
}