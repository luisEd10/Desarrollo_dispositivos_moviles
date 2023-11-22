import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';

class GetMessage extends StatelessWidget {
  const GetMessage({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic  box;
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
    );
  }
}