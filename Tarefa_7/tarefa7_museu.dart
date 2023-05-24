import 'dart:io';

class Visitante {
  String nome;
  String cpf;
  DateTime dataNascimento;
  int codTema;

  static const int VINTAGE = 1;
  static const int NUMISMATICA = 2;
  static const int HISTORIA_MUSICA = 3;
  static const int PINTURAS = 4;
  static const int ESCULTURAS = 5;

  Visitante(this.nome, this.cpf, this.dataNascimento, this.codTema);

  List<String> getTemasVisitados() {
    List<String> temas = [];
    if (codTema == VINTAGE) {
      temas.add("Vintage");
    }
    if (codTema == NUMISMATICA) {
      temas.add("Numismática");
    }
    if (codTema == HISTORIA_MUSICA) {
      temas.add("História da Música");
    }
    if (codTema == PINTURAS) {
      temas.add("Pinturas");
    }
    if (codTema == ESCULTURAS) {
      temas.add("Esculturas");
    }
    return temas;
  }
}

class VisitantePremium extends Visitante {
  double saldo = 0;
  int numeroVale = 0;
  static const double VALOR_VALE = 100.0;

  VisitantePremium(
      String nome, String cpf, DateTime dataNascimento, int codTema)
      : super(nome, cpf, dataNascimento, codTema) {
    saldo = VALOR_VALE;
    numeroVale = 1;
  }

  double calcularGastos(double valor) {
    saldo -= valor;
    return saldo;
  }
}

void main() {
  print("Informe os dados do visitante:");
  String nome = getInput("Nome: ", "Nome invalido", (input) => input.isNotEmpty);
  String cpf =  getInput("CPF: ", "CPF invalido", (input) => RegExp(r'^\d{3}\.\d{3}\.\d{3}-\d{2}$').hasMatch(input));
  String dataNascimentoStr = getInput("Data de Nascimento (dd/mm/aaaa): ", "Data invalida", (input) => RegExp(r'^\d{2}\/\d{2}\/\d{4}$').hasMatch(input));

  List<String> dataNascimentoParts = dataNascimentoStr.split("/");
  int dia = int.parse(dataNascimentoParts[0]);
  int mes = int.parse(dataNascimentoParts[1]);
  int ano = int.parse(dataNascimentoParts[2]);
  DateTime dataNascimento = DateTime(ano, mes, dia);

  String strCodTema = getInput("Código do tema (1 - Vintage, 2 - Numismática, 3 - História da Música, 4 - Pinturas, 5 - Esculturas): ", "Opção inválida\n", (input) => RegExp(r'^[1-5]$').hasMatch(input));
  int codTema = int.parse(strCodTema);

  Visitante visitante = Visitante(nome, cpf, dataNascimento, codTema);
  print("Temas visitados pelo visitante comum: ${visitante.getTemasVisitados()}");

  print("\nInforme os dados do visitante premium:");
  String nomePremium = getInput("Nome: ", "Nome invalido", (input) => input.isNotEmpty);
  String cpfPremium =  getInput("CPF: ", "CPF invalido", (input) => RegExp(r'^\d{3}\.\d{3}\.\d{3}-\d{2}$').hasMatch(input));
  String dataNascimentoStrPremium = getInput("Data de Nascimento (dd/mm/aaaa): ", "Data invalida", (input) => RegExp(r'^\d{2}\/\d{2}\/\d{4}$').hasMatch(input));

  List<String> dataNascimentoPartsPremium = dataNascimentoStrPremium.split("/");
  int diaPremium = int.parse(dataNascimentoPartsPremium[0]);
  int mesPremium = int.parse(dataNascimentoPartsPremium[1]);
  int anoPremium = int.parse(dataNascimentoPartsPremium[2]);
  DateTime dataNascimentoPremium = DateTime(anoPremium, mesPremium, diaPremium);

  String strCodTemaPremium = getInput("Código do tema (1 - Vintage, 2 - Numismática, 3 - História da Música, 4 - Pinturas, 5 - Esculturas): ", "Opção inválida\n", (input) => RegExp(r'^[1-5]$').hasMatch(input));
  int codTemaPremium = int.parse(strCodTemaPremium);

  VisitantePremium visitantePremium = VisitantePremium(nomePremium, cpfPremium, dataNascimentoPremium, codTemaPremium);
  print("Temas visitados pelo visitante premium: ${visitantePremium.getTemasVisitados()}");

  String strValorGastos = getInput("\nInforme o valor dos gastos do visitante premium:", "Valor inválido\n", (input) => RegExp(r'^\d+(\.\d+)?$').hasMatch(input));
  double valorGastos = double.parse(strValorGastos);

  double saldoRestante = visitantePremium.calcularGastos(valorGastos);
  print("Saldo restante do visitante premium: $saldoRestante");
}

String getInput(String titleMsg, String invalidMsg, bool Function(String) isValid) {
  bool valid = false;
  String input = "";
  do {
    print(titleMsg);
    input = stdin.readLineSync()!;
    valid = isValid(input);
    if(!valid) {
      print(invalidMsg);
    }
  } while(!valid);
  return input;
}


