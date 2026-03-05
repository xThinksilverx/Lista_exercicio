double calcularArea(double largura, double altura) {
  return largura * altura;
}

double calcularAreaArrow(double l, double h) => l * h;

void main() {
  double a1 = calcularArea(5, 10);
  double a2 = calcularAreaArrow(5, 10);
  print('Área (função tradicional): $a1');
  print('Área (arrow function): $a2');
}