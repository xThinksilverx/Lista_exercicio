Stream<int> contadorStream() async* {
  for (int i = 1; i <= 10; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() async {
  contadorStream().listen((numero) {
    print(numero);
  });

  await Future.delayed(Duration(seconds: 11));
}