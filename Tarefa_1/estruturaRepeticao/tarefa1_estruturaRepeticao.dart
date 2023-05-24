import 'dart:io';
import 'Cliente.dart';

void main() {
  String? altura, peso, codigo;
  int codigoCliente;
  double alturaCliente, pesoCliente;

  List<Cliente> clientes = [];

  do {
    do {
      print("\nDigite o código do cliente (0 para encerrar):");
      codigo = stdin.readLineSync();

      codigoCliente = int.tryParse(codigo!) ?? -1;
      if (codigoCliente < 0) {
        print(
            "Código do cliente inválido! Digite o código do cliente válido.\n");
      }
    } while (codigoCliente < 0);

    if (codigoCliente != 0) {
      do {
        print("Digite a altura do cliente: ");
        altura = stdin.readLineSync();

        alturaCliente = double.tryParse(altura!) ?? -1;
        if (alturaCliente < 0) {
          print(
              "Altura do cliente inválida! Digite uma altura do cliente válida.\n");
        }
      } while (alturaCliente < 0);

      do {
        print("Digite o peso do cliente: ");
        peso = stdin.readLineSync();

        pesoCliente = double.tryParse(peso!) ?? -1;
        if (pesoCliente < 0) {
          print(
              "Peso do cliente inválido! Digite um peso do cliente válido.\n");
        }
      } while (pesoCliente < 0);

      Cliente cliente = Cliente(codigoCliente, alturaCliente, pesoCliente);
      clientes.add(cliente);
    }
  } while (codigoCliente != 0);

  Cliente maisMagro = Cliente(0, 0, double.infinity);
  Cliente maisGordo = Cliente(0, 0, -double.infinity);
  Cliente maisAlto = Cliente(0, -double.infinity, 0);
  Cliente maisBaixo = Cliente(0, double.infinity, 0);

  double somaAlturas = 0;
  double somaPesos = 0;
  double mediaAltura = 0;
  double mediaPesos = 0;

  clientes.forEach((element) {
    if (element.altura > maisAlto.altura) {
      maisAlto = element;
    }
    if (element.altura < maisBaixo.altura) {
      maisBaixo = element;
    }

    if (element.peso > maisGordo.peso) {
      maisGordo = element;
    }
    if (element.peso < maisMagro.peso) {
      maisMagro = element;
    }

    somaAlturas += element.altura;
    somaPesos += element.peso;
  });

  mediaAltura = (somaAlturas / clientes.length);
  mediaPesos = (somaPesos / clientes.length);

  print("\nCliente mais alto: $maisAlto");
  print("Cliente mais baixo: $maisBaixo");
  print("Cliente mais gordo: $maisGordo");
  print("Cliente mais magro: $maisMagro");

  print("\nMédia das alturas: $mediaAltura");
  print("Média dos pesos: $mediaPesos");
}
