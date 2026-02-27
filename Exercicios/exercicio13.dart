class ContaBancaria {
  String titular;
  double saldo;

  ContaBancaria(this.titular, this.saldo);

  void depositar(double valor) => saldo += valor;

  void sacar(double valor) {
    saldo >= valor ? saldo -= valor : print('Saldo insuficiente');
  }

  void exibirInfo() => print('$titular | Saldo: R\$ $saldo');
}

class ContaPoupanca extends ContaBancaria {
  ContaPoupanca(String titular, double saldo) : super(titular, saldo);

  void aplicarRendimento(double taxa) => saldo += saldo * taxa;
}

void main() {
  ContaPoupanca cp = ContaPoupanca('João', 1000.0);
  cp.exibirInfo();
  cp.depositar(500.0);
  cp.exibirInfo();
  cp.sacar(200.0);
  cp.exibirInfo();
  cp.aplicarRendimento(0.05);
  cp.exibirInfo();
}