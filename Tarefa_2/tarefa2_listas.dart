import 'dart:math';

void main() {
  List<int> resultados = [];
  List<int> contadores = List<int>.filled(6, 0);

  for (int i = 0; i < 100; i++) {
    int resultado = lancarDado();
    resultados.add(resultado);
    contadores[resultado - 1]++;
  }

  for (int i = 0; i < contadores.length; i++) {
    print("Número ${i + 1}: ${contadores[i]} vezes");
  }
}

int lancarDado() {
  Random random = Random();
  return random.nextInt(6) + 1;
}