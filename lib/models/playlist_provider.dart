import 'package:flutter/material.dart';
import 'package:music_player_app/models/song.dart';

class PlaylistProvider extends ChangeNotifier{
  //playlist of songs
  final List<Song> _playlist = [
    //Song 1
      Song(
      songName: "Ahora te puedes marchar",
       artistName: "Luis Miguel",
        albumArtImagePath: "lib/assets/images/Ahora_te_puedes_marchar.jpg", 
        audioPath: "lib/song/ahora_te_puedes_marchar.mp3",
        ),
    //Song 2 
      Song(
      songName: "Bad",
       artistName: "Michael Jackson",
        albumArtImagePath: "lib/assets/images/Bad.jpg", 
        audioPath: "lib/song/bad.mp3",
        ),
    //Song 3
      Song(
      songName: "Ballad of a homeschooled girl",
       artistName: "Olivia Rodrigo",
        albumArtImagePath: "lib/assets/images/ballad_of_a_homeschooled_girl.jpg", 
        audioPath: "lib/song/ballad of a homeschool girl.mp3",
        ),
    //Song 4
      Song(
      songName: "Beat it",
       artistName: "Michael Jackson",
        albumArtImagePath: "lib/assets/images/Beat_it.jpg", 
        audioPath: "lib/song/Beat it.mp3",
        ),
    //Song 5
      Song(
      songName: "Enemy",
       artistName: "Imagine Dragons X JID",
        albumArtImagePath: "lib/assets/images/Enemy.jpg", 
        audioPath: "lib/song/Enemy.mp3",
        ),
    //Song 6
      Song(
      songName: "eternal sunshine",
       artistName: "Ariana Grande",
        albumArtImagePath: "lib/assets/images/eternal_sunshine.jpg", 
        audioPath: "lib/song/eternal sunshine.mp3",
        ),
    //Song 7
      Song(
      songName: "Levitating",
       artistName: "Dua Lipa",
        albumArtImagePath: "lib/assets/images/Levitating.jpg",  
        audioPath: "lib/song/Levitating.mp3",
        ),
    //Song 8
      Song(
      songName: "Link in park",
       artistName: "Link in park",
        albumArtImagePath: "lib/assets/images/link_in_park.jpg", 
        audioPath: "lib/song/link in park.mp3",
        ),
    //Song 9
      Song(
      songName: "Me enamore en la cola de las tortillas",
       artistName: "Los Estrambólicos",
        albumArtImagePath: "me_enamore_en_la_cola_de_las_tortillas.jpg", 
        audioPath: "lib/song/Me enamore en la cola de las tortillas.mp3",
        ),
    //Song 10
      Song(
      songName: "Mi cucu",
       artistName: "La sonora dinamita",
        albumArtImagePath: "lib/assets/images/Mi cucu.jpg", 
        audioPath: "lib/song/Mi cucu.mp3",
        ),
    //Song 11
      Song(
      songName: "secreto de amor",
       artistName: "Joan Sebastian",
        albumArtImagePath: "lib/assets/images/secreto_de_amor.jpg", 
        audioPath: "lib/song/Secreto de amor.mp3",
        ),
    //Song 12
      Song(
      songName: "Suave",
       artistName: "Luis Miguel",
        albumArtImagePath: "lib/assets/images/suave.jpg",  
        audioPath: "lib/song/suave.mp3",
        ),
  ];
  //current song playing index
  int? _currentSongIndex;

  /*

  G E T T E R S

*/

List<Song> get playList => _playlist;
int? get CurrentSongIndex => _currentSongIndex;


/*

S E T T E R S

*/
set CurrentSongIndex(int? newIndex){

  //update current song index
  _currentSongIndex = newIndex;

  //update UI
  notifyListeners();
}
}