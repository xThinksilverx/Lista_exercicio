String saudar({required String nome, String titulo = 'Sr.', bool mostrarHora = false}) {
	String hora = '';
	if (mostrarHora) {
		final now = DateTime.now();
		final hh = now.hour.toString().padLeft(2, '0');
		final mm = now.minute.toString().padLeft(2, '0');
		final ss = now.second.toString().padLeft(2, '0');
		hora = ' às $hh:$mm:$ss';
	}
	return 'Olá, $titulo $nome$hora!';
}

void main() {
  print(saudar(nome: 'João'));
  print(saudar(nome: 'Maria', titulo: 'Sra.'));
  print(saudar(nome: 'Carlos', mostrarHora: true));
}

