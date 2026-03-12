import 'dart:async';

class Perfil {
  final String nome;
  final String email;

  const Perfil({required this.nome, required this.email});

  factory Perfil.fromMap(Map<String, dynamic> map) => Perfil(
        nome: map['nome'] as String? ?? 'Desconhecido',
        email: map['email'] as String? ?? 'Não informado',
      );
}

class Metricas {
  final double vendas;
  final double usuarios;
  final double conversao;

  const Metricas({
    required this.vendas,
    required this.usuarios,
    required this.conversao,
  });

  factory Metricas.fromMap(Map<String, double> map) => Metricas(
        vendas: map['vendas'] ?? 0.0,
        usuarios: map['usuarios'] ?? 0.0,
        conversao: map['conversao'] ?? 0.0,
      );
}

class DadosDashboard {
  final Perfil perfil;
  final List<String> notificacoes;
  final Metricas metricas;

  const DadosDashboard({
    required this.perfil,
    required this.notificacoes,
    required this.metricas,
  });
}

Future<String?> autenticarUsuario(String usuario, String senha) async {
  await Future.delayed(const Duration(seconds: 1));
  if (usuario == 'admin' && senha == '1234') return 'token';
  return null;
}

Future<Perfil> buscarPerfil(String token) async {
  await Future.delayed(const Duration(seconds: 2));
  final map = <String, dynamic>{'nome': 'João Silva', 'email': 'joao@email.com'};
  return Perfil.fromMap(map);
}

Future<List<String>> buscarNotificacoes(String token) async {
  await Future.delayed(const Duration(seconds: 1));
  return const ['Nova mensagem', 'Atualização disponível', 'Relatório gerado'];
}

Future<Metricas> buscarMetricas(String token) async {
  await Future.delayed(const Duration(seconds: 3));
  final map = <String, double>{'vendas': 1500.0, 'usuarios': 342.0, 'conversao': 4.7};
  return Metricas.fromMap(map);
}

Stream<String> escutarAtualizacoes() async* {
  const eventos = [
    'Nova venda registrada',
    'Usuário entrou no sistema',
    'Relatório atualizado',
    'Alerta de estoque',
    'Meta diária atingida',
  ];
  for (final evento in eventos) {
    await Future.delayed(const Duration(seconds: 1));
    yield evento;
  }
}

Future<DadosDashboard> buscarDadosDashboard(String token) async {
  final resultados = await (
    buscarPerfil(token),
    buscarNotificacoes(token),
    buscarMetricas(token),
  ).wait;

  return DadosDashboard(
    perfil: resultados.$1,
    notificacoes: resultados.$2,
    metricas: resultados.$3,
  );
}

void main() async {
  print('DASHBOARD ASSÍNCRONO\n');

  print('Autenticando usuário...');
  final String token;
  try {
    final tokenOuNulo = await autenticarUsuario('admin', '1234');
    if (tokenOuNulo == null) throw Exception('Credenciais inválidas');
    token = tokenOuNulo;
    print('Autenticado com sucesso! Token: $token\n');
  } catch (e) {
    print('Erro na autenticação: $e');
    return;
  }

  print('Buscando dados do dashboard...');
  try {
    final dados = await buscarDadosDashboard(token);

    print('Perfil');
    print('Nome: ${dados.perfil.nome}');
    print('Email: ${dados.perfil.email}');

    print('\nNotificaçoes');
    for (final n in dados.notificacoes) {
      print('* $n');
    }

    print('\nMetricas');
    print('Vendas: ${dados.metricas.vendas}');
    print('Usuarios: ${dados.metricas.usuarios}');
    print('Conversao: ${dados.metricas.conversao}');
  } catch (e) {
    print('Erro ao buscar daos: $e');
    return;
  }

  print('\nAtualizações em Tempo Real');
  try {
    await escutarAtualizacoes().listen((evento) {
      print('[UPDATE] $evento');
    }).asFuture<void>();
  } catch (e) {
    print('Erro nas atualizações $e');
  }

  print('\nDashboard encerrado');
}