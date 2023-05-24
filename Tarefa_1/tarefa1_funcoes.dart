import 'dart:io';

void main() {
  String data = lerData();
  List<String> partes = data.split('/');

  int dia = int.parse(partes[0]);
  int mes = int.parse(partes[1]);
  int ano = int.parse(partes[2]);

  print(obterDataCompleta(dia, mes, ano));
}

String lerData() {
  String? data;
  RegExp regex = RegExp(r'^\d{2}/\d{2}/\d{4}$'); // Regex para validar o formato dd/mm/yyyy
  bool dataValida = false;

  do {
    print('Entre com a data no formato dd/mm/aaaa:\n');
    data = stdin.readLineSync();
    dataValida = regex.hasMatch(data!);
    if(!dataValida) {
      print("\n\nFormato inválido\n\n");
    }
  } while(!dataValida);

  return data;
}

String? obterDataCompleta(int dia, int mes, int ano) {
  if (isDiaValido(dia, mes, ano) && isMesValido(mes)) {
    return "$dia de ${obterNomeMes(mes)} de $ano";
  }
  return null;
}

bool isMesValido(int mes) {
  return mes >= 1 && mes <= 12;
}

bool isDiaValido(int dia, int mes, int ano) {
  int diasNoMes = DateTime(ano, mes + 1, 0).day;
  return dia >= 1 && dia <= diasNoMes;
}

String obterNomeMes(int mes) {
  switch (mes) {
    case 1:
      return 'Janeiro';
    case 2:
      return 'Fevereiro';
    case 3:
      return 'Março';
    case 4:
      return 'Abril';
    case 5:
      return 'Maio';
    case 6:
      return 'Junho';
    case 7:
      return 'Julho';
    case 8:
      return 'Agosto';
    case 9:
      return 'Setembro';
    case 10:
      return 'Outubro';
    case 11:
      return 'Novembro';
    case 12:
      return 'Dezembro';
    default:
      return 'Mês inválido';
  }
}