void main() {

  String texto = '42';

  int inteiro = int.parse(texto);
  double real = double.parse(texto);
  int valor = 100;
  String textoValor = valor.toString();

  print('texto: $texto (tipo: ${texto.runtimeType})');
  print('inteiro: $inteiro (tipo: ${inteiro.runtimeType})');
  print('real: $real (tipo: ${real.runtimeType})');
  print('valor: $valor (tipo: ${valor.runtimeType})');
  print('textoValor: $textoValor (tipo: ${textoValor.runtimeType})');
}
