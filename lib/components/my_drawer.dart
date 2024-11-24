import 'package:flutter/material.dart';
import 'package:music_player_app/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Drawer es el menú lateral que se muestra al deslizar desde el lado izquierdo
    return Drawer(
      // Color de fondo del Drawer basado en el tema de la aplicación
      backgroundColor: Theme.of(context).colorScheme.surface,
      
      // La estructura del contenido dentro del Drawer
      child: Column(
        children: [
          // DrawerHeader se usa para mostrar el encabezado del menú
          DrawerHeader(
            child: Center(
              child: Icon(
                // Icono de nota musical para representar la música
                Icons.music_note,
                size: 40,
                // El color del icono depende del tema de la aplicación
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          
          // Primer ListTile: Opción de "Home" en el menú
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 25), // Espaciado
            child: ListTile(
              title: const Text("H O M E"),  // Título de la opción
              leading: const Icon(Icons.home),  // Icono de inicio
              onTap: () {
                // Al hacer tap en "Home", se cierra el Drawer (navegación local)
                Navigator.pop(context);
              },
            ),
          ),
          
          // Segundo ListTile: Opción de "Settings" en el menú
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0), // Espaciado
            child: ListTile(
              title: const Text("S E T T I N G S"),  // Título de la opción
              leading: const Icon(Icons.settings),  // Icono de configuración
              onTap: () {
                // Al hacer tap en "Settings", se cierra el Drawer y se navega a la página de configuración
                Navigator.pop(context);

                // Navegación hacia la página de configuración
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),  // Página a la que se navega
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
