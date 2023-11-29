import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';

part 'att_img_event.dart';
part 'att_img_state.dart';

class AttImgBloc extends Bloc<AttImgEvent, AttImgState> {
  AttImgBloc() : super(AttImgInitial()) {
    on<AttImgEvent>((event, emit) {

      // TODO: implement event handler
    });
  }
  Future<String> _uploadFileToStorage(File myFile) async{
    var stamp = DateTime.now();
    UploadTask task = FirebaseStorage.instance.ref("usr1/file_${stamp}").putFile(myFile);
    await task;
    return await task.storage.ref("usr1/file_${stamp}").getDownloadURL();
  }
}
