import 'dart:math';

Future<String> buscarUsuario() {
  return Future.delayed(Duration(seconds: 2), () {
    if (Random().nextBool()) {throw Exception('Erro ao buscar usuário!');
    }
    return 'Maria Silva';
  });
}

void main() async {
  print('Buscando usuário...');

  try {
    String nome = await buscarUsuario();
    print('Usuário encontrado: $nome');
  } catch (e) {
    print('Erro: $e');
  }
}