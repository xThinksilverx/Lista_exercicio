Map<int, String> produtos = {
  1: 'Teclado',
  2: 'Mouse',
  3: 'Monitor',
  4: 'Headset',
  5: 'Webcam',
};

String buscar(int id) {
  return produtos.containsKey(id) ? produtos[id]! : 'Produto não encontrado';
}

void listar() {
  produtos.forEach((id, nome) => print('$id: $nome'));
}

void remover(int id) {
  produtos.containsKey(id) ? produtos.remove(id) : print('ID não encontrado');
}

void main() {
  print(buscar(2));
  listar();
  remover(3);
  listar();
}