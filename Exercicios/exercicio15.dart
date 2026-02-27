mixin Voador {
  void voar() => print('Voando!');
}

mixin Nadador {
  void nadar() => print('Nadando!');
}

mixin Corredor {
  void correr() => print('Correndo!');
}

class Pato with Nadador, Voador {
  String nome;
  Pato(this.nome);
}

class Golfinho with Nadador {
  String nome;
  Golfinho(this.nome);
}

class Avestruz with Corredor {
  String nome;
  Avestruz(this.nome);
}

void main() {
  Pato p = Pato('Pato');
  Golfinho g = Golfinho('Golfinho');
  Avestruz a = Avestruz('Avestruz');

  p.voar();
  p.nadar();
  g.nadar();
  a.correr();
}