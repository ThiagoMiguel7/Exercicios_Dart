import 'dart:math';

class Pessoa {
  String nome;
  String endereco;
  String telefone;
  int idade;
  double altura;

  Pessoa(this.nome, this.endereco, this.telefone, this.idade, this.altura);

  void imprimirMensagem() {
    print("Olá, meu nome é $nome. Tenho $idade anos e minha altura é $altura metros.");
    print("Moro em $endereco e meu telefone de contato é $telefone.");
  }
}

class Teste {
  List<double> vetor = List<double>.filled(5, 0);

  void alimentarVetor() {
    for (int i = 0; i < vetor.length; i++) {
      vetor[i] = Random().nextDouble() * 9 + 1; // numeros entre 1 e 10
    }
  }

  void mostrarVetor() {
    print("Valores do vetor:");
    for (int i = 0; i < vetor.length; i++) {
      print(vetor[i]);
    }
  }

  void mostrarParteInteiraVetor() {
    print("\nParte inteira dos valores do vetor:");
    for (int i = 0; i < vetor.length; i++) {
      print(vetor[i].toInt());
    }
  }

  void multiplicarVetorPorInteiro(int multiplicador) {
    for (int i = 0; i < vetor.length; i++) {
      vetor[i] *= multiplicador;
    }
  }

  List<List<int>> matriz = List<List<int>>.generate(3, (_) => List<int>.filled(4, 0));

  void alimentarMatriz() {
    for (int i = 0; i < matriz.length; i++) {
      for (int j = 0; j < matriz[i].length; j++) {
        matriz[i][j] = Random().nextInt(51);
      }
    }
  }

  int somarMatriz() {
    int soma = 0;
    for (int i = 0; i < matriz.length; i++) {
      for (int j = 0; j < matriz[i].length; j++) {
        soma += matriz[i][j];
      }
    }
    return soma;
  }

  void mostrarMenorEMaiorValor() {
    int menor = matriz[0][0];
    int maior = matriz[0][0];
    for (int i = 0; i < matriz.length; i++) {
      for (int j = 0; j < matriz[i].length; j++) {
        if (matriz[i][j] < menor) {
          menor = matriz[i][j];
        }
        if (matriz[i][j] > maior) {
          maior = matriz[i][j];
        }
      }
    }
    print("Menor valor: $menor");
    print("Maior valor: $maior");
  }

  double calcularMedia() {
    int soma = somarMatriz();
    int totalElementos = matriz.length * matriz[0].length;
    double media = soma / totalElementos;
    return media;
  }
}

void main() {
  Teste teste = Teste();

  teste.alimentarVetor();
  teste.mostrarVetor();
  teste.mostrarParteInteiraVetor();
  teste.multiplicarVetorPorInteiro(2);

  teste.alimentarMatriz();
  int somaMatriz = teste.somarMatriz();
  teste.mostrarMenorEMaiorValor();
  double media = teste.calcularMedia();

  Pessoa pessoa = Pessoa("\nJoão", "Rua A, 123", "123456789", 25, 1.75);
  pessoa.imprimirMensagem();
}