class Compra {
  double preco;
  int parcelas;
  String tipo;

  Compra(this.preco, this.parcelas, this.tipo);

  void pagarParcela() {
    if (parcelas > 0) {
      parcelas--;
      print('\nParcela paga! Parcelas restantes: $parcelas');
    } else {
      print('\nNão há mais parcelas a serem pagas.');
    }
  }

  void quitarCompra() {
    parcelas = 0;
    print('\nCompra quitada!');
  }

  void cancelarCompra() {
    parcelas = 0;
    print('\nCompra cancelada!');
  }

  void atualizarParcela(double juros, int novaQuantidadeParcelas) {
    double precoFinal = preco + preco * juros * novaQuantidadeParcelas;
    parcelas = novaQuantidadeParcelas;
    preco = precoFinal;
    print('Parcelas atualizadas para $novaQuantidadeParcelas. Novo preço: $preco');
  }
}

class ContaEstudante extends Compra {
  ContaEstudante(double preco, int parcelas, String tipo)
      : super(preco, parcelas, tipo);

  @override
  void pagarParcela() {
    if (parcelas > 0) {
      parcelas--;
      print('\nParcela paga! Parcelas restantes: $parcelas');
    } else {
      print('\nNão há mais parcelas a serem pagas.');
    }
  }

  @override
  void quitarCompra() {
    parcelas = 0;
    print('\nConta de estudante quitada!');
  }
}

void imprimirValores(Object objeto) {
  if (objeto is Compra) {
    Compra compra = objeto;
    double totalPreco = compra.preco * compra.parcelas;
    int totalParcelas = compra.parcelas;
    print('\nTotal do preço das compras: $totalPreco');
    print('Total de parcelas das compras: $totalParcelas');
  } else if (objeto is ContaEstudante) {
    ContaEstudante contaEstudante = objeto;
    double precoDividido = contaEstudante.preco / 2;
    int parcelasDivididas = contaEstudante.parcelas ~/ 2;
    print('\nPreço dividido pela metade: $precoDividido');
    print('Parcelas divididas pela metade: $parcelasDivididas');
  } else {
    print('Objeto inválido.');
  }
}

void main() {
  Compra compra = Compra(1000.0, 2, 'Eletrônicos');
  compra.pagarParcela();
  compra.pagarParcela();
  compra.pagarParcela();
  compra.quitarCompra();

  ContaEstudante contaEstudante = ContaEstudante(500.0, 5, 'Educação');
  contaEstudante.pagarParcela();
  contaEstudante.quitarCompra();

  imprimirValores(compra);
  imprimirValores(contaEstudante);
}