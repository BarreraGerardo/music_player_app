// Importación de librerías
import 'package:audioplayers/audioplayers.dart'; // Para la reproducción de audio
import 'package:flutter/material.dart'; // Framework para crear la interfaz de usuario
import 'package:music_player_app/models/song.dart'; // Modelo de la clase Song

// PlaylistProvider es un ChangeNotifier que gestiona la lista de canciones y su reproducción
class PlaylistProvider extends ChangeNotifier {
  // Playlist de canciones, inicializada con 12 canciones
  final List<Song> _playlist = [
    // Cada Song es un objeto que tiene un nombre, un artista, una imagen del álbum y la ruta del archivo de audio
    Song(
      songName: "Ahora te puedes marchar",
      artistName: "Luis Miguel",
      albumArtImagePath: "lib/assets/images/Ahora_te_puedes_marchar.jpg",
      audioPath: "lib/song/ahora_te_puedes_marchar.mp3",
    ),
    // ... otras canciones aquí
  ];

  // Índice de la canción actualmente en reproducción
  int? _currentSongIndex;

  // Instancia del reproductor de audio (audioplayers)
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Duraciones de la canción actual y total
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  // Constructor: escucha los cambios en la duración de la canción
  PlaylistProvider() {
    listenToDuration();
  }

  // Estado de reproducción (si está reproduciendo una canción)
  bool _isPlaying = false;

  // Reproducir la canción actual
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop(); // Detiene la canción actual
    await _audioPlayer.play(AssetSource(path)); // Reproduce la nueva canción
    _isPlaying = true; // Cambia el estado de reproducción
    notifyListeners(); // Notifica a los escuchadores (UI)
  }

  // Pausar la canción actual
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // Reanudar la canción si está pausada
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  // Alternar entre pausar y reanudar
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  // Buscar una posición específica dentro de la canción
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  // Reproducir la siguiente canción en la lista
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        // Si no es la última canción, va a la siguiente
        CurrentSongIndex = _currentSongIndex! + 1;
      } else {
        // Si es la última canción, vuelve a la primera
        CurrentSongIndex = 0;
      }
    }
  }

  // Reproducir la canción anterior
  void playPreviusSong() async {
    if (_currentDuration.inSeconds > 2) {
      // Si han pasado más de 2 segundos, reinicia la canción actual
      seek(Duration.zero);
    } else {
      // Si estamos en los primeros 2 segundos, va a la canción anterior
      if (_currentSongIndex! > 0) {
        CurrentSongIndex = _currentSongIndex! - 1;
      } else {
        // Si es la primera canción, va a la última
        CurrentSongIndex = _playlist.length - 1;
      }
    }
  }

  // Escuchar la duración de la canción
  void listenToDuration() {
    // Escuchar el cambio en la duración total de la canción
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    // Escuchar el cambio en la posición actual de la canción
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    // Cuando la canción termina, reproducir la siguiente
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  // Métodos Getter y Setter

  // Obtener la lista de canciones
  List<Song> get playList => _playlist;

  // Obtener el índice de la canción actual
  int? get CurrentSongIndex => _currentSongIndex;

  // Obtener el estado de reproducción
  bool get isPlaying => _isPlaying;

  // Obtener la duración actual de la canción
  Duration get currentDuration => _currentDuration;

  // Obtener la duración total de la canción
  Duration get totalDuration => _totalDuration;

  // Setter para actualizar el índice de la canción actual
  set CurrentSongIndex(int? newIndex) {
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      play(); // Reproducir la canción en el nuevo índice
    }

    // Notificar a los escuchadores para actualizar la UI
    notifyListeners();
  }
}
