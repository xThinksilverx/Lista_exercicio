import 'dart:async';

Future<String> buscarDadosLentos() async {
  await Future.delayed(Duration(seconds: 5));
  return 'Dados recebidos';
}

void main() async {
  try {
    final resultado = await buscarDadosLentos().timeout(Duration(seconds: 3));
    print(resultado);
  } on TimeoutException {
    print('demorou muito tempo. Tente novamente depois');
  }
}