import 'package:flutter/material.dart';

class UserAccount extends ChangeNotifier {
  double _balance = 0.0;
  double _previousBalance = 0.0;
  double _percentChange = 0.0;

  double get balance => _balance;
  double get percentChange => _percentChange;

  void deposit(double amount) {
    _previousBalance = _balance;
    _balance += amount;
    _calculatePercentChange();
    notifyListeners();
  }

  void withdraw(double amount) {
    if (_balance >= amount) {
      _previousBalance = _balance;
      _balance -= amount;
      _calculatePercentChange();
    } else {
      print('Insufficient balance');
    }
    notifyListeners();
  }

  void _calculatePercentChange() {
    if (_previousBalance != 0) {
      _percentChange = ((_balance - _previousBalance) / _previousBalance) * 100;
    } else {
      _percentChange = 0.0;
    }
  }
}