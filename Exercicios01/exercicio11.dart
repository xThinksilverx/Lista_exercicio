class Produto {
  String nome;
  double preco;
  int estoque;

  Produto(this.nome, this.preco, this.estoque);

  void exibirInfo() {
    print('Produto: $nome | R\$ $preco | Estoque: $estoque');
  }
}

void main() {
  Produto p1 = Produto('Teclado', 150.0, 10);
  Produto p2 = Produto('Mouse', 80.0, 25);
  Produto p3 = Produto('Monitor', 900.0, 5);

  p1.exibirInfo();
  p2.exibirInfo();
  p3.exibirInfo();
}