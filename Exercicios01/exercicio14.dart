abstract class Veiculo {
  void acelerar();
}

class Carro extends Veiculo {
  @override
  void acelerar() => print('Carro acelerando: Vrummm!');
}

class Moto extends Veiculo {
  @override
  void acelerar() => print('Moto acelerando: Ziinnn!');
}

void main() {
  List<Veiculo> veiculos = [Carro(), Moto(), Carro(), Moto()];

  veiculos.forEach((v) => v.acelerar());
}