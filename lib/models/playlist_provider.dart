import 'package:audioplayers/audioplayers.dart';
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
        albumArtImagePath: "lib/assets/images/me_enamore_en_la_cola_de_las_tortillas.jpg", 
        audioPath: "lib/song/Me enamore en la cola de las tortillas.mp3",
        ),
    //Song 10
      Song(
      songName: "Mi cucu",
       artistName: "La sonora dinamita",
        albumArtImagePath: "lib/assets/images/Mi_cucu.jpg", 
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

  A U D I O P L A Y E R

  */
  //audio player
  final AudioPlayer _audioPlayer = AudioPlayer();
  //durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;
  //constructor
  PlaylistProvider() {
    listenToDuration();
  }
  //initialliy not playing
  bool _isPlaying = false;

  //play the song
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop(); // stop current song
    await _audioPlayer.play(AssetSource(path)); // play the new song
    _isPlaying = true;
    notifyListeners();
  }
  //pause curent song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }
  //resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying =true;
    notifyListeners();
  }
  //pause or resume
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }
  //seek to a specific position in the current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }
  //play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length -1) {
        // go to the next song if it's not the last song
       CurrentSongIndex = _currentSongIndex! + 1;
      } else {
        //if it's the last song, loop back to the first song
        CurrentSongIndex = 0;
      }
    }
  }
  //play previous song
  void playPreviusSong() async {
    // if more tha 2 seconds have passed, restart the current song
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    }
    // if it's within first 2 second of the song, go to previous song
    else {
      if (_currentSongIndex! > 0) {
        CurrentSongIndex = _currentSongIndex! - 1;
      } else {
        // if it's the first song, loop back to last song
        CurrentSongIndex = _playlist.length - 1;
      }
    }
  }
  //list to duration
  void listenToDuration() {
    //listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });
    //listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });
    //listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
      });
  }
  //dispose audio player

  /*

  G E T T E R S

  */

List<Song> get playList => _playlist;
// ignore: non_constant_identifier_names
int? get CurrentSongIndex => _currentSongIndex;
bool get isPlaying => _isPlaying;
Duration get currentDuration => _currentDuration;
Duration get totalDuration => _totalDuration;


/*

S E T T E R S

*/
// ignore: non_constant_identifier_names
set CurrentSongIndex(int? newIndex){
  //update current song index
  _currentSongIndex = newIndex;

if (newIndex != null) {
  play(); // play the song at the new index
}

  //update UI
  notifyListeners();
}
}