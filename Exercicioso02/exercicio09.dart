import 'dart:async';

void main() async {
  final controller = StreamController<int>.broadcast();

  int contagem = 0;
  int soma = 0;

  controller.stream.listen((n) {
    print('Número recebido: $n');
  });

  controller.stream.listen((n) {
    contagem++;
    print('Contagem: $contagem');
  });

  controller.stream.listen((n) {
    soma += n;
    print('Soma: $soma');
  });

  for (int i = 1; i <= 10; i++) {
    await Future.delayed(Duration(milliseconds: 500));
    controller.sink.add(i);
  }

  await Future.delayed(Duration(seconds: 1));
  controller.close();
}