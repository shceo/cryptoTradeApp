import 'package:flutter/material.dart';

class CardModel with ChangeNotifier {
  int _selectedCompany = 0;
  int _selectedIndex = 0;

  int get selectedCompany => _selectedCompany;
  int get selectedIndex => _selectedIndex;

  void selectCompany(int value) {
    _selectedCompany = value;
    notifyListeners();
  }

  void selectIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    monthController.dispose();
    yearController.dispose();
    cvvController.dispose();
    super.dispose();
  }
}