import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class thremonthtoget with ChangeNotifier {
  late int _remainingTime;

  int get remainingTime => _remainingTime;

  thremonthtoget() {
    _remainingTime = 3 * 30 * 24 * 60 * 60 * 2;
    Timer.periodic(Duration(seconds: 1), (timer) {
      _remainingTime--;
      notifyListeners();
    });
  }
}

Future<int> _loadRemainingTime() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt('remainingTime') ?? 3 * 30 * 24 * 60 * 60 * 3;
}

Future<void> _saveRemainingTime(int time) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('remainingTime', time);
}
