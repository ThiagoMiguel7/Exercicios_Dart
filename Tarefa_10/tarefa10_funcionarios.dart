abstract class Funcionario {
  String nome;
  String cpf;
  double salario;

  Funcionario(this.nome, this.cpf, this.salario);

  double calcularBonificacao();

  void adicionarBonificacao(Funcionario funcionario) {
    double bonificacao = funcionario.calcularBonificacao();
    print('Bonificação adicionada: $bonificacao');
  }
}

class Gerente extends Funcionario {
  double senhaEspecial;
  int quantidadeFuncionarios;

  Gerente(String nome, String cpf, double salario, this.senhaEspecial, this.quantidadeFuncionarios)
      : super(nome, cpf, salario);

  @override
  double calcularBonificacao() {
    return salario * 0.1;
  }
}

class Engenheiro extends Funcionario {
  String _crea;
  String _categoria;
  String _projetoAtual;

  Engenheiro(String nome, String cpf, double salario, this._crea, this._categoria, this._projetoAtual)
      : super(nome, cpf, salario);

  @override
  double calcularBonificacao() {
    return salario * 0.05;
  }
}

void main() {
  Gerente gerente = Gerente('Maria', '987654321', 3000.0, 1234.0, 5);
  Engenheiro engenheiro = Engenheiro('Pedro', '456789123', 2500.0, '123ABC', 'Civil', 'Projeto X');

  gerente.adicionarBonificacao(gerente);
  engenheiro.adicionarBonificacao(engenheiro);
}