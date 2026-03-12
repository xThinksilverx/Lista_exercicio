Future<List<String>> buscarProdutos() async {
  await Future.delayed(Duration(seconds: 2));
  return ['Notebook', 'Mouse', 'Teclado'];
}

Future<List<String>> buscarCategorias() async {
  await Future.delayed(Duration(seconds: 3));
  return ['Eletrônicos', 'Acessórios', 'Jogos'];
}

Future<List<String>> buscarPromocoes() async {
  await Future.delayed(Duration(seconds: 2));
  return ['10% no Notebook', 'Frete gratis acima de 200'];
}

Future<List<String>> buscarDestaques() async {
  await Future.delayed(Duration(seconds: 1));
  return ['Headset Gamer', 'Monitor 4K'];
}

Future<void> executarSequencial() async {
  print('\n--- SEQUENCIAL ---');
  final inicio = DateTime.now();

  final produtos    = await buscarProdutos();
  final categorias  = await buscarCategorias();
  final promocoes   = await buscarPromocoes();
  final destaques   = await buscarDestaques();

  final tempo = DateTime.now().difference(inicio).inSeconds;
  print('Produtos: $produtos');
  print('Categorias: $categorias');
  print('Promoções: $promocoes');
  print('Destaques: $destaques');
  print('Tempo sequencial: ${tempo}s');
}

Future<void> executarParalelo() async {
  print('\n--- PARALELO ---');
  final inicio = DateTime.now();

  final resultados = await Future.wait([
    buscarProdutos(),
    buscarCategorias(),
    buscarPromocoes(),
    buscarDestaques(),
  ]);

  final tempo = DateTime.now().difference(inicio).inSeconds;
  print('Produtos: ${resultados[0]}');
  print('Categorias: ${resultados[1]}');
  print('Promoções: ${resultados[2]}');
  print('Destaques: ${resultados[3]}');
  print('Tempo paralelo: ${tempo}s');
}

void main() async {
  await executarSequencial();
  await executarParalelo();
}