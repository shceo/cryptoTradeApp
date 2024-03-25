import 'package:flutter/material.dart';

class NotificationModel extends ChangeNotifier {
  bool _isSwitched = true;

  bool get isSwitched => _isSwitched;

  void toggleSwitch(bool value) {
    _isSwitched = value;
    notifyListeners();
  }
}

class LanguageModel extends ChangeNotifier {
  bool _isSwitched = true;
  String _language = 'English';

  bool get isSwitched => _isSwitched;
  String get language => _language;

  void toggleSwitch(bool value) {
    _isSwitched = value;
    notifyListeners();
  }

  void setLanguage(String value) {
    _language = value;
    notifyListeners();
  }
}

class ThemeModel extends ChangeNotifier {
  bool _isSwitched = true;
  String _theme = 'Темная тема';

  bool get isSwitched => _isSwitched;
  String get theme => _theme;

  void toggleSwitch(bool value) {
    _isSwitched = value;
    notifyListeners();
  }

  void setTheme(String value) {
    _theme = value;
    notifyListeners();
  }
}
