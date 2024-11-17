import 'package:flutter/material.dart';
import 'package:music_player_app/themes/dark_mode.dart';
import 'package:music_player_app/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  // Inicialmente, modo claro
  ThemeData _themeData = lightMode;

  // Obtener el tema actual
  ThemeData get themeData => _themeData;

  // Comprobar si está en modo oscuro
  bool get isDarkMode => _themeData == darkMode;

  // Establecer un nuevo tema
  set themeData(ThemeData newThemeData) {
    _themeData = newThemeData;
    notifyListeners();
  }

  // Cambiar entre modo claro y oscuro
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
