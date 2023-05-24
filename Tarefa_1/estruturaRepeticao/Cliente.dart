class Cliente {
  int codigo;
  double altura;
  double peso;

  Cliente(this.codigo, this.altura, this.peso);

  @override
  String toString() {
    return 'Cliente{Código: $codigo, Altura: $altura, Peso: $peso}';
  }
}
