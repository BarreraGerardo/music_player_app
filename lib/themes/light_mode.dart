import 'package:flutter/material.dart';

// Definición del tema para el modo claro
ThemeData lightMode = ThemeData(
  // Utiliza un ColorScheme para especificar los colores del tema
  colorScheme: ColorScheme.light(
    // Color para las superficies (por ejemplo, fondos de widgets)
    surface: Colors.grey.shade300, 

    // Color principal del tema (por ejemplo, para la barra de navegación, botones, etc.)
    primary: Colors.grey.shade500, 

    // Color secundario, utilizado para elementos secundarios (como botones o indicadores)
    secondary: Colors.grey.shade200,

    // Color para el texto y elementos invertidos (como en AppBar)
    inversePrimary: Colors.grey.shade900,
  ),
);
