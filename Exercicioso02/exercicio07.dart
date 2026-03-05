import 'dart:async';

void main() async {
  final controller = StreamController<String>();

  controller.stream.listen((mensagem) {
    print(mensagem);
  });

  final mensagens = ['Oi', 'Td bem?', 'Como vai vc?', 'vlw', 'xau!'];

  for (final mensagem in mensagens) {
    await Future.delayed(Duration(seconds: 1));
    controller.sink.add(mensagem);
  }

  await Future.delayed(Duration(seconds: 1));
  controller.close();
}