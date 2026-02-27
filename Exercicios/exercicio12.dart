class Produto {
  String nome;
  double preco;
  int estoque;

  Produto(this.nome, this.preco, this.estoque);

  Produto.semEstoque(this.nome, this.preco) : estoque = 0;

  Produto.promocao(this.nome, double preco, this.estoque) : preco = preco * 0.8;

  void exibirInfo() {
    print('Produto: $nome | R\$ $preco | Estoque: $estoque');
  }
}

void main() {
  Produto p1 = Produto.semEstoque('Teclado', 150.0);
  Produto p2 = Produto.promocao('Monitor', 900.0, 5);

  p1.exibirInfo();
  p2.exibirInfo();
}