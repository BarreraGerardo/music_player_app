import 'package:flutter/material.dart';
import 'package:music_player_app/themes/dark_mode.dart';  // Importa el tema oscuro
import 'package:music_player_app/themes/light_mode.dart';  // Importa el tema claro

class ThemeProvider extends ChangeNotifier {
  // Inicialmente, el tema es claro. 
  // Esto significa que cuando la aplicación se inicie, el modo claro será el tema por defecto.
  ThemeData _themeData = lightMode;

  // Getter: Devuelve el tema actual de la aplicación
  ThemeData get themeData => _themeData;

  // Getter: Verifica si el tema actual es el modo oscuro
  bool get isDarkMode => _themeData == darkMode;

  // Setter: Permite cambiar el tema de la aplicación.
  // Al cambiar el tema, se notifica a los widgets para que se reconstruyan.
  set themeData(ThemeData newThemeData) {
    _themeData = newThemeData;
    notifyListeners();  // Notifica a los widgets que están escuchando este cambio
  }

  // Método para alternar entre el modo claro y oscuro
  void toggleTheme() {
    // Si el tema actual es claro, cambia a oscuro
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      // Si el tema actual es oscuro, cambia a claro
      themeData = lightMode;
    }
  }
}
