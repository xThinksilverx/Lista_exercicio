typedef Operacao = double Function(double a, double b);

double executarOperacao(double a, double b, Operacao operacao) {
  return operacao(a, b);
}

void main() {
  print(executarOperacao(10, 3, (a, b) => a + b));
  print(executarOperacao(10, 3, (a, b) => a - b));
  print(executarOperacao(10, 3, (a, b) => a * b));
  print(executarOperacao(10, 3, (a, b) => a / b));
}