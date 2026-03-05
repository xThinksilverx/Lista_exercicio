Future<String> buscarUsuario() {
  return Future.delayed( Duration(seconds: 2), () => 'Maria Silva',
  );
}

void main() {
  print('Buscando usuário...');

  buscarUsuario().then((nome) {
    print('Usuário encontrado: $nome');
  });
}