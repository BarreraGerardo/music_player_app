import 'package:flutter/material.dart';

// Definición del tema para el modo oscuro
ThemeData darkMode = ThemeData(
  // Utiliza un ColorScheme para especificar los colores del tema en el modo oscuro
  colorScheme: ColorScheme.dark(
    // Color para las superficies (por ejemplo, fondos de widgets) en el modo oscuro
    surface: Colors.grey.shade900, 

    // Color primario del tema (por ejemplo, para la barra de navegación, botones, etc.)
    primary: Colors.grey.shade600, 

    // Color secundario, utilizado para elementos secundarios (como botones o indicadores)
    secondary: Colors.grey.shade800,

    // Color para el texto y elementos invertidos (como en AppBar)
    inversePrimary: Colors.grey.shade300,
  ),
);
