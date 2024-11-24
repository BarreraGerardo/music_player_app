// Definición de la clase Song
class Song {
  // Propiedad para almacenar el nombre de la canción
  final String songName;
  
  // Propiedad para almacenar el nombre del artista
  final String artistName;
  
  // Propiedad para almacenar la ruta de la imagen del arte del álbum
  final String albumArtImagePath;
  
  // Propiedad para almacenar la ruta del archivo de audio de la canción
  final String audioPath;

  // Constructor de la clase Song, que requiere todos los parámetros
  // 'required' indica que estos valores deben ser proporcionados cuando se crea una instancia de Song
  Song({
    required this.songName, // Inicializa la propiedad songName con el valor pasado al constructor
    required this.artistName, // Inicializa la propiedad artistName con el valor pasado al constructor
    required this.albumArtImagePath, // Inicializa la propiedad albumArtImagePath con el valor pasado al constructor
    required this.audioPath, // Inicializa la propiedad audioPath con el valor pasado al constructor
  });
}
