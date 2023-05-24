import 'dart:io';

class Automovel {
  String placa;
  String modelo;
  int combustivel;
  String cor;
  int ano;

  static const int GASOLINA = 1;
  static const int ALCOOL = 2;
  static const int DIESEL = 3;
  static const int GAS = 4;

  Automovel(this.placa, this.modelo, this.combustivel, this.cor, this.ano);

  double calcularCusto() {
    double custoCombustivel;
    switch (combustivel) {
      case GASOLINA:
        custoCombustivel = 12000.0;
        break;
      case ALCOOL:
        custoCombustivel = 10500.0;
        break;
      case DIESEL:
        custoCombustivel = 11000.0;
        break;
      case GAS:
        custoCombustivel = 13000.0;
        break;
      default:
        custoCombustivel = 0.0;
    }
    return custoCombustivel;
  }
}

class AutomovelLuxo extends Automovel {
  bool direcaoHidraulica;
  bool arCondicionado;
  bool vidrosEletricos;

  static const double AR_CONDICIONADO = 2000.0;
  static const double DIRECAO_HIDRAULICA = 1500.0;
  static const double VIDROS_ELETRICOS = 800.0;

  AutomovelLuxo(
      String placa,
      String modelo,
      int combustivel,
      String cor,
      int ano,
      this.direcaoHidraulica,
      this.arCondicionado,
      this.vidrosEletricos)
      : super(placa, modelo, combustivel, cor, ano);

  @override
  double calcularCusto() {
    double custo = super.calcularCusto();
    if (arCondicionado) {
      custo += AR_CONDICIONADO;
    }
    if (direcaoHidraulica) {
      custo += DIRECAO_HIDRAULICA;
    }
    if (vidrosEletricos) {
      custo += VIDROS_ELETRICOS;
    }
    return custo;
  }
}

void main() {
  String placa, modelo, cor;
  int combustivel, ano;
  bool direcaoHidraulica, arCondicionado, vidrosEletricos;

  stdout.write("Entre com a placa do automóvel: ");
  placa = stdin.readLineSync()!;

  stdout.write("Entre com o modelo do automóvel: ");
  modelo = stdin.readLineSync()!;

  bool valid = false;
  do {
    print("\nEntre com o combustível do automóvel\n "
        "\n1 - GASOLINA \n2 - ALCOOL \n3 - DIESEL \n4 - GAS\n ");
    combustivel = int.parse(stdin.readLineSync()!);

    valid = RegExp(r'^[1-4]$').hasMatch(combustivel.toString());

    if (!valid) {
      print("Opção inválida\n");
    }
  } while (!valid);

  stdout.write("Entre com a cor do automóvel: ");
  cor = stdin.readLineSync()!;

  String? inputAno;
  do {
    print("Entre com o ano do automóvel: ");
    inputAno = stdin.readLineSync();

    ano = int.tryParse(inputAno!) ?? -1;
    if (ano < 0) {
      print("Ano inválida! Digite um número válido.\n");
    }
  } while (ano < 0);

  Automovel automovel = Automovel(placa, modelo, combustivel, cor, ano);
  double custoAutomovel = automovel.calcularCusto();
  print("Custo do automóvel: R\$${custoAutomovel.toStringAsFixed(2)}");

  // entrada de dados para o automóvel de luxo
  stdout.write("Entre com a placa do automóvel de luxo: ");
  placa = stdin.readLineSync()!;

  stdout.write("Entre com o modelo do automóvel de luxo: ");
  modelo = stdin.readLineSync()!;

  valid = false;
  do {
    print("\nEntre com o combustível do automóvel\n "
        "\n1 - GASOLINA \n2 - ALCOOL \n3 - DIESEL \n4 - GAS\n ");
    combustivel = int.parse(stdin.readLineSync()!);

    valid = RegExp(r'^[1-4]$').hasMatch(combustivel.toString());

    if (!valid) {
      print("Opção inválida\n");
    }
  } while (!valid);


  stdout.write("Entre com a cor do automóvel de luxo: ");
  cor = stdin.readLineSync()!;

  do {
    print("Entre com o ano do automóvel de Luxo: ");
    inputAno = stdin.readLineSync();

    ano = int.tryParse(inputAno!) ?? -1;
    if (ano < 0) {
      print("Ano inválido! Digite um número válido.\n");
    }
  } while (ano < 0);

  stdout.write("O automóvel de luxo tem direção hidráulica? (true ou false): ");
  direcaoHidraulica = (stdin.readLineSync()!.toLowerCase() == 'true');
  stdout.write("O automóvel de luxo tem ar-condicionado? (true ou false): ");
  arCondicionado = (stdin.readLineSync()!.toLowerCase() == 'true');
  stdout.write("O automóvel de luxo tem vidros elétricos? (true ou false): ");
  vidrosEletricos = (stdin.readLineSync()!.toLowerCase() == 'true');

  AutomovelLuxo automovelLuxo = AutomovelLuxo(placa, modelo, combustivel, cor,
      ano, direcaoHidraulica, arCondicionado, vidrosEletricos);
  double custoAutomovelLuxo = automovelLuxo.calcularCusto();
  print(
      "Custo do automóvel de luxo: R\$${custoAutomovelLuxo.toStringAsFixed(2)}");
}
