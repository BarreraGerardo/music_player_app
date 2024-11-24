import 'package:flutter/material.dart';
import 'package:music_player_app/components/neu_box.dart'; // Componente para un contorno tipo "neumorphism"
import 'package:music_player_app/models/playlist_provider.dart'; // Proveedor de datos de la lista de reproducción
import 'package:provider/provider.dart'; // Paquete para gestionar el estado con Provider

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  // Función para formatear la duración de la canción en minutos:segundos
  String formatTime(Duration duration) {
    String twoDigitSeconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String formattedTime = "${duration.inMinutes}:$twoDigitSeconds}";

    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>( // Escucha cambios en PlaylistProvider
      builder: (context, value, child) {
        // Obtiene la lista de canciones desde el PlaylistProvider
        final playlist = value.playList;
        // Obtiene la canción actual según el índice almacenado en PlaylistProvider
        final currentSong = playlist[value.CurrentSongIndex ?? 0];

        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface, // Fondo según el tema
          body: SafeArea( // Seguridad para evitar sobrelapamientos con la pantalla
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Centra los elementos en el eje vertical
                children: [
                  // Barra superior (app bar)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Botón de retroceso
                      IconButton(
                        onPressed: () => Navigator.pop(context), // Vuelve a la página anterior
                        icon: const Icon(Icons.arrow_back),
                      ),
                      // Título de la aplicación
                      const Text("P L A Y L I S T"),
                      // Botón de menú (vacío por ahora)
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu),
                      ),
                    ],
                  ),
                  
                  // Caja neumórfica para mostrar la carátula del álbum y el nombre de la canción
                  NeuBox(
                    child: Column(
                      children: [
                        // Imagen de la carátula
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(currentSong.albumArtImagePath), // Ruta de la imagen de la canción
                        ),
                        
                        // Nombre de la canción, nombre del artista y icono de "me gusta"
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Nombre de la canción y el artista
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentSong.songName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(currentSong.artistName),
                                ],
                              ),
                              // Icono de "me gusta"
                              const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Mostrar la duración de la canción y el control deslizante de progreso
                  Column(
                    children: [
                      // Fila con los tiempos de inicio y fin, y los iconos de reproducción aleatoria y repetir
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Muestra el tiempo actual
                            Text(formatTime(value.currentDuration)),
                            // Icono de "shuffle"
                            const Icon(Icons.shuffle),
                            // Icono de "repeat"
                            const Icon(Icons.repeat),
                            // Muestra el tiempo total
                            Text(formatTime(value.totalDuration)),
                          ],
                        ),
                      ),

                      // Control deslizante para la duración de la canción
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0), // Sin ícono de deslizamiento
                        ),
                        child: Slider(
                          min: 0,
                          max: value.totalDuration.inSeconds.toDouble(),
                          value: value.currentDuration.inSeconds.toDouble(),
                          activeColor: Colors.green, // Color del control deslizante
                          onChanged: (double double) {
                            // Controla el deslizamiento
                          },
                          onChangeEnd: (double double) {
                            // Cuando el usuario termina de deslizar, se ajusta la posición en la canción
                            value.seek(Duration(seconds: double.toInt()));
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Controles de reproducción (anterior, pausa/play, siguiente)
                  Row(
                    children: [
                      // Botón de "salto anterior"
                      Expanded(
                        child: GestureDetector(
                          onTap: value.playPreviusSong, // Reproduce la canción anterior
                          child: const NeuBox(
                            child: Icon(Icons.skip_previous),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Botón de "pausa/reproducción"
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: value.pauseOrResume, // Alterna entre pausa y reproducción
                          child: NeuBox(
                            child: Icon(value.isPlaying ? Icons.pause : Icons.play_arrow),
                          ),
                        ),
                      ),
                      // Botón de "salto siguiente"
                      Expanded(
                        child: GestureDetector(
                          onTap: value.playNextSong, // Reproduce la siguiente canción
                          child: const NeuBox(
                            child: Icon(Icons.skip_next),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
