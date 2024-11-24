// Importación de los paquetes necesarios
import 'package:flutter/material.dart';  // Para utilizar Material Design en Flutter
import 'package:music_player_app/models/playlist_provider.dart';  // Proveedor para gestionar la lista de reproducción
import 'package:music_player_app/themes/theme_provider.dart';  // Proveedor para gestionar el tema de la aplicación
import 'package:provider/provider.dart';  // Paquete para la gestión del estado con Provider
import 'pages/home_pages.dart';  // Página principal de la aplicación (HomePage)

void main() {
  // La función main es el punto de entrada de la aplicación.
  runApp(
    // Usamos MultiProvider para envolver toda la aplicación con múltiples proveedores
    MultiProvider(
      // Se definen los proveedores que van a ser utilizados en toda la aplicación
      providers: [
        // Proveedor para gestionar el tema (modo claro/oscuro)
        ChangeNotifierProvider(create: (context) => ThemeProvider()),

        // Proveedor para gestionar la lista de reproducción
        ChangeNotifierProvider(create: (context) => PlaylistProvider()),
      ],
      // Inicia la aplicación pasándole el widget MyApp
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // El widget MyApp es el widget principal de la aplicación.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // Desactiva el banner de "debug" en la parte superior de la aplicación
      home: const HomePage(),  // Establece la página inicial de la aplicación
      theme: Provider.of<ThemeProvider>(context).themeData,  // Obtiene el tema actual desde el ThemeProvider y lo aplica
    );
  }
}
