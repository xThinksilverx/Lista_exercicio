import 'dart:io';

class Livro {
  int id;
  String titulo;
  String autor;
  bool alugado;
  String? locatario;

  Livro(this.id, this.titulo, this.autor)
      : alugado = false,
        locatario = null;

  @override
  String toString() {
    String status = alugado ? 'Alugado por: $locatario' : 'Disponível';
    return '[$id] "$titulo" - $autor | $status';
  }
}

class Biblioteca {
  List<Livro> livros = [];
  int _proximoId = 1;

  void cadastrarLivro(String titulo, String autor) {
    livros.add(Livro(_proximoId++, titulo, autor));
    print('Livro cadastrado com sucesso!');
  }

  void listarLivros() {
    if (livros.isEmpty) {
      print('Nenhum livro cadastrado.');
      return;
    }
    print('\n--- Lista de Livros ---');
    for (var livro in livros) {
      print(livro);
    }
    print('-----------------------');
  }

  void alugarLivro(int id, String locatario) {
    Livro? livro = _buscarPorId(id);

    if (livro == null) {
      print('Livro não encontrado.');
      return;
    }
    if (livro.alugado) {
      print('Este livro já está alugado para ${livro.locatario}.');
      return;
    }

    livro.alugado = true;
    livro.locatario = locatario;
    print('Livro "${livro.titulo}" alugado para $locatario com sucesso!');
  }

  void devolverLivro(int id) {
    Livro? livro = _buscarPorId(id);

    if (livro == null) {
      print('Livro não encontrado.');
      return;
    }
    if (!livro.alugado) {
      print('Este livro não está alugado.');
      return;
    }

    print('Livro "${livro.titulo}" devolvido por ${livro.locatario}.');
    livro.alugado = false;
    livro.locatario = null;
  }

  Livro? _buscarPorId(int id) {
    try {
      return livros.firstWhere((l) => l.id == id);
    } catch (e) {
      return null;
    }
  }
}

void main() {
  Biblioteca biblioteca = Biblioteca();

  while (true) {
    print('\n===== BIBLIOTECA =====');
    print('1. Cadastrar livro');
    print('2. Listar livros');
    print('3. Alugar livro');
    print('4. Devolver livro');
    print('0. Sair');
    print('======================');
    stdout.write('Escolha uma opção: ');

    String? opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        stdout.write('Título: ');
        String? titulo = stdin.readLineSync();
        stdout.write('Autor: ');
        String? autor = stdin.readLineSync();
        if (titulo != null && autor != null && titulo.isNotEmpty && autor.isNotEmpty) {
          biblioteca.cadastrarLivro(titulo, autor);
        } else {
          print('Título e autor não podem ser vazios.');
        }
        break;

      case '2':
        biblioteca.listarLivros();
        break;

      case '3':
        biblioteca.listarLivros();
        stdout.write('ID do livro: ');
        int? id = int.tryParse(stdin.readLineSync() ?? '');
        stdout.write('Seu nome: ');
        String? nome = stdin.readLineSync();
        if (id != null && nome != null && nome.isNotEmpty) {
          biblioteca.alugarLivro(id, nome);
        } else {
          print('Dados inválidos.');
        }
        break;

      case '4':
        biblioteca.listarLivros();
        stdout.write('ID do livro a devolver: ');
        int? id = int.tryParse(stdin.readLineSync() ?? '');
        if (id != null) {
          biblioteca.devolverLivro(id);
        } else {
          print('ID inválido.');
        }
        break;

      case '0':
        print('Encerrando...');
        return;

      default:
        print('Opção inválida.');
    }
  }
}