import 'package:flutter/material.dart';
import 'package:music_player_app/themes/theme_provider.dart'; // Importa el proveedor de tema (para conocer si está activado el modo oscuro)
import 'package:provider/provider.dart'; // Importa el paquete provider para gestionar el estado

// Definición del widget NeuBox
class NeuBox extends StatelessWidget {
  final Widget? child; // El widget hijo que será pasado dentro de NeuBox

  // Constructor del widget NeuBox, donde 'child' es obligatorio
  const NeuBox({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // Obtiene el estado del modo oscuro desde ThemeProvider
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface, // Color de fondo según el tema (claro/oscuro)
        borderRadius: BorderRadius.circular(12), // Bordes redondeados del contenedor
        boxShadow: [
          // Sombra más oscura en la parte inferior derecha
          BoxShadow(
            color: isDarkMode ? Colors.black : Colors.grey.shade500, // Si es modo oscuro, usa color negro, sino gris
            blurRadius: 15, // Desenfoque de la sombra
            offset: const Offset(4, 4), // Desplazamiento de la sombra hacia abajo y a la derecha
          ),
          // Sombra más clara en la parte superior izquierda
          BoxShadow(
            color: isDarkMode ? Colors.grey.shade800 : Colors.white, // Si es modo oscuro, usa un gris oscuro, sino blanco
            blurRadius: 15, // Desenfoque de la sombra
            offset: const Offset(-4, -4), // Desplazamiento de la sombra hacia arriba y a la izquierda
          ),
        ],
      ),
      padding: const EdgeInsets.all(12), // Padding interno alrededor del widget hijo
      child: child, // El widget hijo que se pasa a este widget
    );
  }
}
