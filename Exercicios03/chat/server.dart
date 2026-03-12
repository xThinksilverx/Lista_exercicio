import 'dart:io';
import 'dart:convert';

void main() async {
  final server = await ServerSocket.bind(InternetAddress.loopbackIPv4, 4040);
  print('Servidor na porta 4040');

  await for (final socket in server) {
    print('Conectado: ${socket.remoteAddress.address}');
    _handleConnection(socket);
  }
}

void _handleConnection(Socket socket) {
  socket.cast<List<int>>().transform(utf8.decoder).listen(
    (data) {
      final msg = data.trim();
      if (msg.isNotEmpty) print('Cliente: $msg');
    },
    onDone: () => print('Desconectado.'),
  );

  stdin.transform(utf8.decoder).listen((input) {
    final msg = input.trim();
    if (msg.isNotEmpty) socket.write('$msg\n');
  });
}