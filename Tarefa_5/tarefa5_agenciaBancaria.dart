import 'dart:io';

class Conta {
  int numero;
  int agencia;
  double saldo;

  Conta(this.numero, this.agencia, this.saldo);
}

class ContaCorrente extends Conta {
  double mensalidade;

  ContaCorrente(int numero, int agencia, double saldo, this.mensalidade)
      : super(numero, agencia, saldo);

  void descontaMensalidade() {
    saldo -= mensalidade;
  }
}

class ContaPoupanca extends Conta {
  double rendimento;

  ContaPoupanca(int numero, int agencia, double saldo, this.rendimento)
      : super(numero, agencia, saldo);

  double calculaRendimento(int nMeses) {
    double saldoFinal = saldo + saldo * rendimento * nMeses;
    return saldoFinal;
  }
}

void main() {

  //conta corrente
  print('Entre com os dados da conta corrente:');

  int numeroCorrente;
  String? inputNumeroCorrente;
  do {
    print('Número: ');
    inputNumeroCorrente = stdin.readLineSync();

    numeroCorrente = int.tryParse(inputNumeroCorrente!) ?? -1;
    if (numeroCorrente < 0) {
      print("Numero de Conta Corrente inválida! Digite um número válido.\n");
    }
  } while (numeroCorrente < 0);

  int agenciaCorrente;
  String? inputAgenciaCorrente;
  do {
    print('Agência: ');
    inputAgenciaCorrente = stdin.readLineSync();

    agenciaCorrente = int.tryParse(inputAgenciaCorrente!) ?? -1;
    if (agenciaCorrente < 0) {
      print("Numero de Agencia Corrente inválida! Digite um número válido.\n");
    }
  } while (agenciaCorrente < 0);

  double saldoCorrente;
  String? inputSaldoCorrente;
  do {
    print('Saldo: ');
    inputSaldoCorrente = stdin.readLineSync();

    saldoCorrente = double.tryParse(inputSaldoCorrente!) ?? -1;
    if (saldoCorrente < 0) {
      print("Numero de saldo da conta inválida! Digite um número válido.\n");
    }
  } while (saldoCorrente < 0);


  double mensalidadeCorrente;
  String? inputMensalidadeCorrente;
  do {
    print('Mensalidade: ');
    inputMensalidadeCorrente = stdin.readLineSync();

    mensalidadeCorrente = double.tryParse(inputMensalidadeCorrente!) ?? -1;
    if (mensalidadeCorrente < 0) {
      print("Mensalidade inválida! Digite um número válido.\n");
    }
  } while (mensalidadeCorrente < 0);

  ContaCorrente contaCorrente = ContaCorrente(numeroCorrente, agenciaCorrente, saldoCorrente, mensalidadeCorrente);



  //conta poupança
  print('\nEntre com os dados da conta poupança:');

  int numeroPoupanca;
  String? inputNumeroPoupanca;
  do {
    print('Número: ');
    inputNumeroPoupanca = stdin.readLineSync();

    numeroPoupanca = int.tryParse(inputNumeroPoupanca!) ?? -1;
    if (numeroPoupanca < 0) {
      print("Numero de Conta Poupanca inválida! Digite um número válido.\n");
    }
  } while (numeroPoupanca < 0);

  int agenciaPoupanca;
  String? inputAgenciaPoupanca;
  do {
    print('Agência: ');
    inputAgenciaPoupanca = stdin.readLineSync();

    agenciaPoupanca = int.tryParse(inputAgenciaPoupanca!) ?? -1;
    if (agenciaPoupanca < 0) {
      print("Numero de Agencia Poupança inválida! Digite um número válido.\n");
    }
  } while (agenciaPoupanca < 0);

  double saldoPoupanca;
  String? inputSaldoPoupanca;
  do {
    print('Saldo: ');
    inputSaldoPoupanca = stdin.readLineSync();

    saldoPoupanca = double.tryParse(inputSaldoPoupanca!) ?? -1;
    if (saldoPoupanca < 0) {
      print("Numero de saldo da conta inválida! Digite um número válido.\n");
    }
  } while (saldoPoupanca < 0);


  double rendimentoPoupanca;
  String? inputRendimentoPoupanca;
  do {
    print('Rendimento: ');
    inputRendimentoPoupanca = stdin.readLineSync();

    rendimentoPoupanca = double.tryParse(inputRendimentoPoupanca!) ?? -1;
    if (rendimentoPoupanca < 0) {
      print("Rendimento inválida! Digite um número válido.\n");
    }
  } while (rendimentoPoupanca < 0);

  ContaPoupanca contaPoupanca = ContaPoupanca(numeroPoupanca, agenciaPoupanca, saldoPoupanca, rendimentoPoupanca);



  // Exibindo informações das contas
  print('\nConta Corrente:');
  print('Número: ${contaCorrente.numero}');
  print('Agência: ${contaCorrente.agencia}');
  print('Saldo: ${contaCorrente.saldo}');
  print('Mensalidade: ${contaCorrente.mensalidade}');
  contaCorrente.descontaMensalidade();
  print('Saldo com desconto da mensalidade: ${contaCorrente.saldo}');

  print('\nConta Poupança:');
  print('Número: ${contaPoupanca.numero}');
  print('Agência: ${contaPoupanca.agencia}');
  print('Saldo: ${contaPoupanca.saldo}');
  print('Rendimento: ${contaPoupanca.rendimento}');
  print('Saldo com rendimento após 6 meses: ${contaPoupanca.calculaRendimento(6)}');
}
