import 'dart:io';

void main() {

  print('Digite a primeira string:');
  String string1 = stdin.readLineSync()!;

  print('Digite a segunda string:');
  String string2 = stdin.readLineSync()!;


  print('\nConteúdo da primeira string: $string1');
  print('Comprimento da primeira string: ${string1.length} caracteres');

  print('\nConteúdo da segunda string: $string2');
  print('Comprimento da segunda string: ${string2.length} caracteres');


  if (string1.length == string2.length) {
    print('\nAs duas strings possuem o mesmo comprimento.');
  } else {
    print('\nAs duas strings possuem comprimentos diferentes.');
  }

  if (string1 == string2) {
    print('As duas strings possuem conteúdo igual.');
  } else {
    print('As duas strings possuem conteúdo diferente.');
  }
}
