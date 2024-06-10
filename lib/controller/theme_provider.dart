import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode theme=ThemeMode.light;

  void changeTheme (){
    if(theme==ThemeMode.light){
      theme=ThemeMode.dark;
    }
    else if(theme==ThemeMode.dark){
      theme=ThemeMode.light;
    }
    notifyListeners();
  }
}