import 'package:flutter/material.dart';

class CurrencyModel with ChangeNotifier {
  String _selectedCurrency = 'USD';

  String get selectedCurrency => _selectedCurrency;

  void setSelectedCurrency(String newCurrency) {
    _selectedCurrency = newCurrency;
    notifyListeners(); 
  }
}