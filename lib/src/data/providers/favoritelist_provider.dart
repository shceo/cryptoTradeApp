import 'package:crypto_trader/src/data/models/crytpo_coin.dart';
import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  List<CryptoCoin> _favorites = [];

  List<CryptoCoin> get favorites => _favorites;

  void addToFavorites(CryptoCoin coin) {
    if (!_favorites.contains(coin)) {
      _favorites.add(coin);
      notifyListeners();
    }
  }

  void removeFromFavorites(CryptoCoin coin) {
    if (_favorites.contains(coin)) {
      _favorites.remove(coin);
      notifyListeners();
    }
  }

  void clearFavorites() {
    _favorites.clear();
    notifyListeners();
  }
}