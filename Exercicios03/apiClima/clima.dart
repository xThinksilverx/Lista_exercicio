import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

const double latitude = -26.3044;
const double longitude = -48.8487;

Future<Map<String, dynamic>> buscarClima() async {
  final uri = Uri.parse(
    'https://api.open-meteo.com/v1/forecast'
    '?latitude=$latitude&longitude=$longitude'
    '&current_weather=true'
    '&temperature_unit=celsius'
    '&windspeed_unit=kmh',
  );

  final response = await http.get(uri).timeout(const Duration(seconds: 10));

  if (response.statusCode != 200) {
    throw HttpException('Erro HTTP: ${response.statusCode}');
  }

  final dados = jsonDecode(response.body);

  if (!dados.containsKey('current_weather')) {
    throw const FormatException('Resposta inesperada');
  }

  return dados['current_weather'] as Map<String, dynamic>;
}

String descricaoClima(int codigo) {
  const codigos = {
    0: 'Céu limpo',
    1: 'Principalmente limpo',
    2: 'Parcialmente nublado',
    3: 'Nublado',
    45: 'Névoa',
    48: 'Névoa com gelo',
    51: 'Garoa leve',
    53: 'Garoa moderada',
    55: 'Garoa intensa',
    61: 'Chuva fraca',
    63: 'Chuva moderada',
    65: 'Chuva forte',
    71: 'Neve fraca',
    73: 'Neve moderada',
    75: 'Neve forte',
    80: 'Pancadas de chuva fracas',
    81: 'Pancadas de chuva moderadas',
    82: 'Pancadas de chuva violentas',
    95: 'Trovoada',
    99: 'Trovoada com granizo',
  };
  return codigos[codigo] ?? 'Condição desconhecida (código $codigo)';
}

void main() async {
  print('O clima para Joinville é\n');

  try {
    final clima = await buscarClima();

    final temperatura = clima['temperature'];
    final vento = clima['windspeed'];
    final codigo = clima['weathercode'] as int;
    final isDay = clima['is_day'] == 1 ? 'Dia' : 'Noite';

    print('Temperatura : $temperatura°C');
    print('Vento       : $vento kmh');
    print('Condição    : ${descricaoClima(codigo)}');
    print('Perodo      : $isDay');
  } on SocketException {
    print('Sem conexão');
  } on HttpException catch (e) {
    print('${e.message}');
  } on FormatException catch (e) {
    print('Erro ao processar resposta ${e.message}');
  } on TimeoutException {
    print('Tempo esgotado');
  } catch (e) {
    print('Erro não esperado $e');
  }
}