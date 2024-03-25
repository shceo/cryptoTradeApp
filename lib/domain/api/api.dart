import 'package:crypto_trader/domain/models/crypto_history.dart';
import 'package:crypto_trader/domain/models/crytpo_coin.dart';
import 'package:dio/dio.dart';

class CryptoCoinRepository {
  CryptoCoinRepository();
  Future<List<CryptoHistory>> getCryptoHistory(
      String? name, String? interval) async {
    final dio = Dio();
    final response = await dio.get(
        'https://api.coincap.io/v2/assets/${name}/history?interval=${interval}');
    final json = response.data as Map<String, dynamic>;
    final data = json['data'] as List;
    final crytpoHistory = data
        .map((e) =>
            CryptoHistory(price: double.parse(e['priceUsd']), time: e['time']))
        .toList();
    return crytpoHistory;
  }

  Future<List<CryptoCoin>> getCryptoCoinList() async {
    final dio = Dio();
    final response =
        await dio.get('https://api.coincap.io/v2/assets', queryParameters: {});
    final json = response.data as Map<String, dynamic>;
    final data = json['data'] as List;
    final cryptolist = data.map((e) {
      final list;
      if (e['symbol'] == 'IOTA') {
        list = 'iotx';
      } else {
        list = e['symbol'].toString().toLowerCase();
      }
      return CryptoCoin(
          name: e['name'],
          symbol: e['symbol'],
          price: double.parse(
            e['priceUsd'],
          ),
          image: 'https://assets.coincap.io/assets/icons/${list}@2x.png',
          rank: int.parse(e['rank']),
          change: double.parse(e['changePercent24Hr']));
    }).toList();
    return cryptolist;
  }
}

Future<double> calculateMarketChange() async {
  final repository = CryptoCoinRepository();
  final cryptolist = await repository.getCryptoCoinList();
  double totalChange = 0;
  for (var coin in cryptolist) {
    totalChange += coin.change;
  }
  return totalChange;
}

// запросы к серверу