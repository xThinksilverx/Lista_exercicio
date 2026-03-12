import 'dart:math';

Future<String> autenticar() async {
  await Future.delayed(Duration(seconds: 1));
  return 'token_${Random().nextInt(9999)}';
}

Future<Map<String, dynamic>> buscarPerfil(String token) async {
  await Future.delayed(Duration(seconds: 1));
  return {'id': 'user_1', 'nome': 'Maria Silva', 'email': 'maria@email.com'};
}

Future<List<String>> buscarPedidos(String userId) async {
  await Future.delayed(Duration(seconds: 1));
  return ['Pedido 1 - Livro', 'Pedido 2 - Fone', 'Pedido 3 - Teclado'];
}

void main() async {
  try {
    print('Autenticando');
    final token = await autenticar();
    print('Token: $token');

    print('Buscando perfil');
    final perfil = await buscarPerfil(token);
    print('Perfil: ${perfil['nome']} (${perfil['email']})');

    print('Buscando pedidos');
    final pedidos = await buscarPedidos(perfil['id']);
    print('Pedidos de ${perfil['nome']}:');
    pedidos.forEach((p) => print('  - $p'));

  } catch (e) {
    print('Erro: $e');
  }
}