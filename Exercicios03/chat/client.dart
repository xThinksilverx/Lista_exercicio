import 'dart:io';
import 'dart:convert';

void main() async {
  final socket = await Socket.connect('127.0.0.1', 4040);
  print('Conectado. Pode digitar.');

  socket.cast<List<int>>().transform(utf8.decoder).listen(
    (data) {
      final msg = data.trim();
      if (msg.isNotEmpty) print('Servidor: $msg');
    },
    onDone: () {
      print('Desconectado.');
      exit(0);
    },
  );

  stdin.transform(utf8.decoder).listen((input) {
    final msg = input.trim();
    if (msg.isNotEmpty) socket.write('$msg\n');
  });
}