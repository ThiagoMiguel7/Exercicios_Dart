import 'dart:io';

class BombaCombustivel {
  String tipoCombustivel;
  double valorLitro;
  double quantidadeCombustivel;

  BombaCombustivel(
      {required this.tipoCombustivel,
        required this.valorLitro,
        required this.quantidadeCombustivel});

  void abastecerPorValor(double valorAbastecido) {
    double quantidadeLitros = valorAbastecido / valorLitro;
    if (quantidadeLitros <= quantidadeCombustivel) {
      quantidadeCombustivel -= quantidadeLitros;
      print('Abastecido: $quantidadeLitros litros');
    } else {
      print('Não há combustível suficiente na bomba.');
    }
  }

  void abastecerPorLitro(double quantidadeLitros) {
    double valorPago = quantidadeLitros * valorLitro;
    if (quantidadeLitros <= quantidadeCombustivel) {
      quantidadeCombustivel -= quantidadeLitros;
      print('Valor a pagar: R\$ ${valorPago.toStringAsFixed(2)}');
    } else {
      print('Não há combustível suficiente na bomba.');
    }
  }

  void alterarValor(double novoValor) {
    valorLitro = novoValor;
  }

  void alterarCombustivel(String novoCombustivel) {
    tipoCombustivel = novoCombustivel;
  }

  void alterarQuantidadeCombustivel(double novaQuantidade) {
    quantidadeCombustivel = novaQuantidade;
  }
}

void main() {
  BombaCombustivel bomba = BombaCombustivel(
      tipoCombustivel: 'Gasolina Podium',
      valorLitro: 8.0,
      quantidadeCombustivel: 100.0);

  print('Bomba de Combustível');
  print('Tipo de combustível: ${bomba.tipoCombustivel}');
  print('Valor do litro: R\$ ${bomba.valorLitro.toStringAsFixed(2)}');
  print('Quantidade de combustível: ${bomba.quantidadeCombustivel} litros');

  print('\n--- Operações ---');
  print('1. Abastecer por valor');
  print('2. Abastecer por litro');
  print('3. Alterar valor do litro');
  print('4. Alterar tipo de combustível');
  print('5. Alterar quantidade de combustível');
  print('0. Sair');

  int opcao;
  do {
    stdout.write('\nInforme a opção desejada: ');
    opcao = int.parse(stdin.readLineSync()!);

    switch (opcao) {
      case 1:

        double valorAbastecido;
        String? inputValorAbastecido;
        do {
          print('Informe o valor a ser abastecido: ');
          inputValorAbastecido = stdin.readLineSync();

          valorAbastecido = double.tryParse(inputValorAbastecido!) ?? -1;
          if (valorAbastecido < 0) {
            print("Valor Abastecido inválido! Digite um número válido.\n");
          }
        } while (valorAbastecido < 0);
        bomba.abastecerPorValor(valorAbastecido);
        break;

      case 2:
        double quantidadeLitros;
        String? inputQuantidadeLitros;
        do {
          print('Informe a quantidade em litros de combustível: ');
          inputQuantidadeLitros = stdin.readLineSync();

          quantidadeLitros = double.tryParse(inputQuantidadeLitros!) ?? -1;
          if (quantidadeLitros < 0) {
            print("Quantidade de Litros inválido! Digite um número válido.\n");
          }
        } while (quantidadeLitros < 0);
        bomba.abastecerPorLitro(quantidadeLitros);
        break;

      case 3:
        double novoValor;
        String? inputNovoValor;
        do {
          print('Informe o novo valor do litro: ');
          inputNovoValor = stdin.readLineSync();

          novoValor = double.tryParse(inputNovoValor!) ?? -1;
          if (novoValor < 0) {
            print("Novo Valor inválido! Digite um número válido.\n");
          }
        } while (novoValor < 0);
        bomba.alterarValor(novoValor);
        break;

      case 4:
        stdout.write('Informe o novo tipo de combustível: ');
        String novoCombustivel = stdin.readLineSync()!;
        bomba.alterarCombustivel(novoCombustivel);
        break;

      case 5:
        double novaQuantidade;
        String? inputNovaQuantidade;
        do {
          print('Informe o novo valor do litro: ');
          inputNovaQuantidade = stdin.readLineSync();

          novaQuantidade = double.tryParse(inputNovaQuantidade!) ?? -1;
          if (novaQuantidade < 0) {
            print("Nova Quantidade inválido! Digite um número válido.\n");
          }
        } while (novaQuantidade < 0);
        bomba.alterarQuantidadeCombustivel(novaQuantidade);
        break;

      case 0:
        print('Encerrando o programa...');
        break;

      default:
        print('Opção inválida. Tente novamente.');
    }
  } while (opcao != 0);
}