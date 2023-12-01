import 'package:dio/dio.dart';

class CryptoCoinRepository{
  Future<void> getCoinsList() async{
    final dio = Dio();
    final response = await dio.get('https://api.coincap.io/v2/assets');
    print(response.data);
  }
}