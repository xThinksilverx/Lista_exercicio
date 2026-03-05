void main() {
  const pi = 3.14159;
  dataAtual = DateTime.now();
  
  print('pi é $pi e a data é $dataAtual');
  
  pi = 69.69;
  dataAtual = DateTime.now();
}

/* compileNewDDC
main.dart:3:3: Error: Setter not found: 'dataAtual'.
  dataAtual = DateTime.now();
  ^^^^^^^^^
main.dart:5:31: Error: Undefined name 'dataAtual'.
  print('pi é $pi e a data é $dataAtual');
                              ^^^^^^^^^
main.dart:7:3: Error: Can't assign to the const variable 'pi'.
  pi = 69.69;
  ^^
main.dart:8:3: Error: Setter not found: 'dataAtual'.
  dataAtual = DateTime.now();*/