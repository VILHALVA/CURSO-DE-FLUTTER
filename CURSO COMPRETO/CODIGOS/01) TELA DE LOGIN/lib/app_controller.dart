import 'package:flutter/material.dart';

class AppController extends ChangeNotifier {
  bool isDarkTheme = true;

  static AppController instance = AppController();

  changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
