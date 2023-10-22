import 'dart:io';

import 'package:sqlite3/sqlite3.dart';
import 'package:flutter/foundation.dart';
import 'package:video_player/video_player.dart';

class MyVideoProvider with ChangeNotifier {
  VideoPlayerController? _vCont;
  VideoPlayerController? get getVidCont => _vCont;
  bool isSaved = false;
   final db = sqlite3.openInMemory();

  void initializeVideoPlayer(String filePath) async {
    // inicializar el video player
    _vCont = await VideoPlayerController.file(File(filePath))
      ..addListener(() => notifyListeners())
      ..setLooping(false)
      ..initialize().then((value) async {
        // cargar el progreso guardado del video
        //await loadConfigs();
        notifyListeners();
      });
  }

  void isPlayOrPause(bool isPlay) {
    if (isPlay) {
      _vCont!.pause();
    } else {
      _vCont!.play();
    }
    notifyListeners();
  }

  // cargar datos
  Future<void> loadConfigs() async {
    if(_vCont != null){
      final milis = db.select('SELECT milisegundos FROM videos');
      print("datos " + "${db.select('SELECT milisegundos FROM videos')}");
     String miliseg_str = milis.first['milisegundos'].toString();
     int miliseg = int.parse(miliseg_str);
      Duration position = Duration(microseconds: miliseg);
      await _vCont!.seekTo(position);
      await _vCont!.setVolume(1);
    }
  }

  //  guardar datos
  Future saveConfigs() async {
    db.execute('''
    CREATE TABLE IF NOT EXISTS videos (
      id INTEGER PRIMARY KEY,
      milisegundos INTEGER UNIQUE
    )
  ''');
    try {
      Duration position = _vCont!.value.position;
      int mili = position.inMilliseconds;
      db.execute('INSERT INTO videos (milisegundos) VALUES (?)', [mili]);

      print("datos " + "${db.select('SELECT milisegundos FROM videos')}");
      isSaved = true;
      notifyListeners();
    } catch (e) {
      print("Error al guardar: ${e.toString()}");
      isSaved = false;
      notifyListeners();
    }
  }
}
