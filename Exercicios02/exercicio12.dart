import 'dart:async';

// AUTENTICAÇÃO
Future<String?> autenticarUsuario(String usuario, String senha) async {
  await Future.delayed(Duration(seconds: 1));
  if (usuario == 'admin' && senha == '1234') return 'token';
  return null;
}

// FONTES DE DADOS
Future<Map<String, dynamic>> buscarPerfil(String token) async {
  await Future.delayed(Duration(seconds: 2));
  return {'nome': 'João Silva', 'email': 'joao@email.com'};
}

Future<List<String>> buscarNotificacoes(String token) async {
  await Future.delayed(Duration(seconds: 1));
  return ['Nova mensagem', 'Atualização disponivel', 'Relatorio gerado'];
}

Future<Map<String, double>> buscarMetricas(String token) async {
  await Future.delayed(Duration(seconds: 3));
  return {'vendas': 1500.0, 'usuarios': 342.0, 'conversao': 4.7};
}

// STREAM DE ATUALIZAÇÕES
Stream<String> escutarAtualizacoes() async* {
  final eventos = ['Nova venda registrada', 'Usuario entrou no sistema', 'Relatorio atualizado', 'Alerta de estoque', 'Meta diária atingida',];
  for (final evento in eventos) {
    await Future.delayed(Duration(seconds: 1));
    yield evento;
  }
}

// DASHBOARD
void main() async {
  print('DASHBOARD ASSINCRONO\n');

  // 1. AUTENTICAÇÃO
  print('Autenticando usuário');
  String? token;
  try {
    token = await autenticarUsuario('admin', '1234');
    if (token == null) throw Exception('Credenciais invalidas');
    print('Autenticado com sucesso! Token: $token\n');
  } catch (e) {
    print('Erro na autenticacao: $e');
    return;
  }

  // 2. BUSCA PARALELA
  print('Buscando dados do dashboard');
  try {
    final resultados = await Future.wait([
      buscarPerfil(token),
      buscarNotificacoes(token),
      buscarMetricas(token),
    ]);

    final perfil = resultados[0] as Map<String, dynamic>;
    final notificacoes = resultados[1] as List<String>;
    final metricas = resultados[2] as Map<String, double>;

    print('Perfil');
    print('Nome: ${perfil['nome'] ?? 'Desconhecido'}');
    print('Email: ${perfil['email'] ?? 'Não informado'}');

    print('\n Notificações');
    for (final n in notificacoes) {
      print('• $n');
    }

    print('\n Métricas');
    metricas.forEach((chave, valor) {
      print('$chave: $valor');
    });
  } catch (e) {
    print('Erro ao buscar dados: $e');
    return;
  }

  // 3. ATUALIZAÇÕES EM TEMPO REAL
  print('\n Atualizações em Tempo Real');
  try {
    await escutarAtualizacoes().listen((evento) {
      print('[UPDATE] $evento');
    }).asFuture();
  } catch (e) {
    print('Erro nas atualizações: $e');
  }

  print('\nDashboard encerrado.');
}