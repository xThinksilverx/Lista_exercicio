import 'dart:async';
import 'dart:math';

Stream<String> eventoStream() {
  final eventos = ['clique', 'scroll', 'input'];
  final random = Random();

  return Stream.periodic(
    Duration(milliseconds: 500),
    (_) => eventos[random.nextInt(eventos.length)],
  ).take(10);
}

void main() async {
  Timer? debounceTimer;
  String? ultimoEvento;

  eventoStream().listen((evento) {
    ultimoEvento = evento;
    print('Evento recebido: $evento');

    debounceTimer?.cancel();
    debounceTimer = Timer(Duration(seconds: 1), () {
      print('ultimo evento: $ultimoEvento');
    });
  });

  await Future.delayed(Duration(seconds: 8));
}