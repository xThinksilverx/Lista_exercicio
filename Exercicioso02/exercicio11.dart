import 'dart:async';

Map<String, String> cache = {};

Future<String?> buscarDaAPI(String chave) async {
  await Future.delayed(Duration(seconds: 1));
  final dados = {'tema': 'escuro','idioma': 'pt-BR','fonte': '16px',};
  return dados[chave];
}

Future<String?> buscarConfiguracao(String chave) async {
  return cache[chave] ?? await buscarDaAPI(chave);
}

void main() async {
  cache['idioma'] = 'PT BR';

  final chaves = ['tema', 'idioma', 'fonte', 'inexistente'];

  for (final chave in chaves) {
    final resultado = await buscarConfiguracao(chave);
    print('$chave: ${resultado ?? 'nao encontrado'}');

    if (resultado != null) {
      cache[chave] = resultado;
    }
  }
}