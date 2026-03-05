void main() {
  List<String> frutas = ['Maçã', 'Banana', 'Manga', 'Uva', 'Melancia', 'Pera', 'Morango'];

  List<String> comM = frutas.where((f) => f.startsWith('M')).toList();
  print(comM);

  List<String> maiusculas = comM.map((f) => f.toUpperCase()).toList();
  print(maiusculas);
}