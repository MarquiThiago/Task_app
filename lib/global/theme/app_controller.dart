import 'package:flutter/cupertino.dart';

//mudança de tema (estado)
class AppController extends ChangeNotifier {
  static AppController instance = AppController();
  bool isDark = true;
  changeTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
