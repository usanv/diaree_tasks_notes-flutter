import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserProvider extends ChangeNotifier {
  bool _isDark = false;


  bool get isDark {
    return _isDark;
  }

  void setTheme(bool value) async {
    _isDark = value;
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('theme', _isDark);
  }

  void fetchTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDark = prefs.getBool('theme') ?? false;
    notifyListeners();
  }
}
