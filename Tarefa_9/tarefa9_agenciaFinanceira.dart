class Contrato {
  int numero;
  String contratante;
  double valor;
  int prazo;

  Contrato(this.numero, this.contratante, this.valor, this.prazo);

  void exibirInfo() {
    print('Número do contrato: $numero');
    print('Contratante: $contratante');
    print('Valor do contrato: R\$$valor');
    print('Prazo: $prazo meses');
  }

  double calcularPrestacao() {
    return valor / prazo;
  }

  static double calcularPrestacaoPara(Contrato contrato) {
    return contrato.calcularPrestacao();
  }
}

class ContratoPessoaFisica extends Contrato {
  String cpf;
  int idade;

  ContratoPessoaFisica(int numero, String contratante, double valor, int prazo, this.cpf, this.idade)
      : super(numero, contratante, valor, prazo);

  @override
  void exibirInfo() {
    super.exibirInfo();
    print('CPF do contratante: $cpf');
    print('Idade do contratante: $idade');
  }

  @override
  double calcularPrestacao() {
    double prestacao = super.calcularPrestacao();
    if (idade <= 30) {
      prestacao += 1.0;
    } else if (idade <= 40) {
      prestacao += 2.0;
    } else if (idade <= 50) {
      prestacao += 3.0;
    } else {
      prestacao += 4.0;
    }
    return prestacao;
  }
}

class ContratoPessoaJuridica extends Contrato {
  String cnpj;
  String inscricaoEstadual;

  ContratoPessoaJuridica(int numero, String contratante, double valor, int prazo, this.cnpj, this.inscricaoEstadual)
      : super(numero, contratante, valor, prazo);

  @override
  void exibirInfo() {
    super.exibirInfo();
    print('CNPJ da empresa contratante: $cnpj');
    print('Inscrição Estadual da empresa contratante: $inscricaoEstadual');
  }

  @override
  double calcularPrestacao() {
    double prestacao = super.calcularPrestacao();
    prestacao += 3.0;
    return prestacao;
  }
}

void main() {
  Contrato contratoPF = ContratoPessoaFisica(1, 'João', 10000.0, 12, '123.456.789-00', 35);
  contratoPF.exibirInfo();
  print('Valor da prestação: R\$${contratoPF.calcularPrestacao()}');

  print('-----------------------');

  Contrato contratoPJ = ContratoPessoaJuridica(2, 'Empresa ABC', 50000.0, 24, '12.345.678/0001-90', '12345678');
  contratoPJ.exibirInfo();
  print('Valor da prestação: R\$${contratoPJ.calcularPrestacao()}');




  print('Valor da prestação PF: R\$${Contrato.calcularPrestacaoPara(contratoPF)}');

  print('Valor da prestação PJ: R\$${Contrato.calcularPrestacaoPara(contratoPJ)}');

}