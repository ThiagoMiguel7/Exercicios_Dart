import 'dart:io';

class Livro {
  String? titulo;
  int isbn;
  int numPaginas;

  Livro(this.titulo, this.isbn, this.numPaginas);

  Livro.padrao()
      : titulo = "",
        isbn = 0,
        numPaginas = 0;

  void exibirDados() {
    print("Título: $titulo\nIsbn: $isbn\nNúmero de páginas: $numPaginas");
  }
}

void main() {
  List<Livro> livros = [];
  String? opcao, titulo;
  int? numPaginas;
  String? inputNumPag;

  int? isbn;
  String? inputIsbn;

  while (true) {
    print("\nO que você deseja fazer?\n1 - Inserir livro\n2 - Sair");
    opcao = stdin.readLineSync();

    if (opcao == "1") {
      print("\nDigite os dados do livro:");

      print("Título:");
      titulo = stdin.readLineSync();

      do {
        print("ISBN:");
        inputIsbn = stdin.readLineSync();

        isbn = int.tryParse(inputIsbn!) ?? -1;
        if (isbn < 0) {
          print("ISBN inválido.\n");
        }
      } while (isbn < 0);

      do {
        print("Número de páginas:");
        inputNumPag = stdin.readLineSync();

        numPaginas = int.tryParse(inputNumPag!) ?? -1;
        if (numPaginas < 0) {
          print("Número de páginas inválido.\n");
        }
      } while (numPaginas < 0);

      Livro livro = Livro(titulo, isbn, numPaginas);
      livros.add(livro);

      print("\nLivro adicionado com sucesso!");
    } else if (opcao == "2") {
      print("\nSaindo...\n");
      break;
    } else {
      print("\nOpção inválida.");
    }
  }

  if (livros.isNotEmpty) {
    Livro livroComMaisPaginas = livros.first;
    Livro livroComMenosPaginas = livros.first;

    for (Livro livro in livros) {
      if (livro.numPaginas > livroComMaisPaginas.numPaginas) {
        livroComMaisPaginas = livro;
      } else if (livro.numPaginas < livroComMenosPaginas.numPaginas) {
        livroComMenosPaginas = livro;
      }
    }

    print("---Livro com Mais páginas---");
    livroComMaisPaginas.exibirDados();
    print("\n---Livro com Menos páginas---");
    livroComMenosPaginas.exibirDados();
  } else {
    print("\nNenhum livro foi adicionado à biblioteca.");
  }
}
