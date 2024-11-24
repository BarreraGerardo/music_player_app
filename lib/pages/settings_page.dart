import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fondo de la página basado en el esquema de colores del tema
      backgroundColor: Theme.of(context).colorScheme.surface,
      
      // AppBar con título
      appBar: AppBar(
        title: const Text("S E T T I N G S"),
      ),
      
      // Cuerpo de la página que contiene la configuración de "Dark Mode"
      body: Container(
        decoration: BoxDecoration(
          // Fondo con color secundario del tema
          color: Theme.of(context).colorScheme.secondary,
          // Bordes redondeados para el contenedor
          borderRadius: BorderRadius.circular(12),
        ),
        // Espaciado interno
        padding: const EdgeInsets.all(16),
        // Espaciado externo
        margin: const EdgeInsets.all(25),
        
        // Row que organiza el texto y el switch horizontalmente
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espaciado entre los elementos
          children: [
            // Texto que indica la opción de "Dark Mode"
            const Text(
              "Dark Mode", 
              style: TextStyle(fontWeight: FontWeight.bold), // Negrita para el texto
            ),
            // CupertinoSwitch: un interruptor estilo iOS para cambiar entre modos
            CupertinoSwitch(
              // Valor del switch basado en el estado del tema (si es oscuro o claro)
              value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
              onChanged: (value) => 
                // Cambia el tema cuando el valor del interruptor cambia
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme(),
            ),
          ],
        ),
      ),
    );
  }
}
