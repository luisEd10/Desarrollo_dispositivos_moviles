import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';

class GetMessage extends StatelessWidget {
  const GetMessage({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic  box;
    dynamic url;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Get Existing Chat'),
        ),
        body: FirestoreListView(
          padding: EdgeInsets.symmetric(horizontal: 18),
          pageSize: 15,
          query: FirebaseFirestore.instance.collection('chats/rFvY60ICF2xmiN5PzPbA/messages'),
          itemBuilder: ( 
            BuildContext context,
            QueryDocumentSnapshot<Map<String,dynamic>> document
          ){
            print("test ${document.id}");
            box = document.data()["content"];
            if(document.data()["senderId"] == "usr1"){
               return ListTile(
                leading: CircleAvatar(
                  child: Text("L"),
                ),
                title: Text("${box["msg"]}"), 
                subtitle: Text("${document.data()["senderName"]}"),
              );
            }
            return ListTile(
              title: Text("${box["msg"]}"), 
              subtitle: Text("${document.data()["senderName"]}"),
              trailing: CircleAvatar(
                child:Text("P")
              ),
              
            );
          }
        ),
        floatingActionButton: FloatingActionButton(onPressed: () async{
         FilePickerResult? result = await FilePicker.platform.pickFiles();

          if (result != null) {
            File file = File(result.files.single.path!);
            
            var stamp = DateTime.now();
            UploadTask task = FirebaseStorage.instance.ref("usr1/file_${stamp}").putFile(file);
            await task;
            url = await task.storage.ref("usr1/file_${stamp}").getDownloadURL();

            CollectionReference users = FirebaseFirestore.instance.collection('chats/rFvY60ICF2xmiN5PzPbA/messages');
            users
                .doc('Dl0KczqFj3H6KguVxGF6')
                .update({'content':{'files':'$url'}})
                .then((value) => print("User Updated"))
                .catchError((error) => print("Failed to update user: $error"));
          }
        },
        child: Icon(Icons.add),),
    );
  }
}