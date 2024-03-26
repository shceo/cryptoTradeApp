import 'package:crypto_trader/domain/models/crytpo_coin.dart';
import 'package:flutter/material.dart';

class CryptoListProvider extends ChangeNotifier {
  List<CryptoCoin> _cryptoList = [];

  List<CryptoCoin> get cryptoList => _cryptoList;

  void addCrypto(CryptoCoin crypto) {
    _cryptoList.add(crypto);
    notifyListeners();
  }
}
 