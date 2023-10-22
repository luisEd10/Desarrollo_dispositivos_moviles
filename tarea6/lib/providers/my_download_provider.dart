import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class MyDownloadProvider with ChangeNotifier {
  bool isPermissionGranted = false;
  bool? isSavedSuccess;
  bool isLoading = false;
  String videoName = "butterfly";
  String? videoPath;
  String videoUrl =
      "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";

  Future<void> descargarVideo() async {
    // hacer el metodo para descargar video
    try{
      isLoading = true;
      notifyListeners();
      final res = await get(Uri.parse(videoUrl));
      if(res.statusCode == 200){
        _saveFile(res.bodyBytes);
      }
      isLoading = false;
      notifyListeners();
    }catch(e){
      isLoading = false;
      isSavedSuccess = false;
      print("Error: ${e.toString()}");
      notifyListeners();
    }
  }

  Future<bool> _requestStoragePermission() async {
    // hacer el metodo para solicitar acceso al almacenamiento
    var permiso = await Permission.storage.status;
    if(permiso == PermissionStatus.denied){
      await Permission.storage.request();
    }
    return permiso == PermissionStatus.granted;
  }

  Future<void> _saveFile(Uint8List _content) async {
    //  revisar si tenemos permiso
    if(!await _requestStoragePermission()){
      isLoading = false;
      isPermissionGranted = false;
      notifyListeners();
      return;
    }

    // acceso al storage revisar plataformas y almacenamientos
    Directory? dir;
    if(Platform.isAndroid){
      dir = await getExternalStorageDirectory();
    }else if(Platform.isIOS){
      dir = await getApplicationSupportDirectory();
    }else{
      dir = await getApplicationSupportDirectory();
    }
    // escribir archivo en almacenamiento
    videoPath = "${dir!.path}/$videoName.mp4";
    File file = File(videoPath!);
    await file.writeAsBytes(_content);
    isSavedSuccess = true;
    isLoading = false;
    notifyListeners();
  }
}
