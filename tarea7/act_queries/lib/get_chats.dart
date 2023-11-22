import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';

class GetChats extends StatelessWidget {
  const GetChats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Get Existing Chat'),
        ),
        body: FirestoreListView(
          padding: EdgeInsets.symmetric(horizontal: 18),
          pageSize: 15,
          query: FirebaseFirestore.instance.collection('chats'),
          itemBuilder: ( 
            BuildContext context,
            QueryDocumentSnapshot<Map<String,dynamic>> document
          ){
            print("test ${document.id}");
            return ListTile(title: Text("${document.id}"), subtitle: Text("${document.data()["createdAt"]}"),);
          }
        ),
    );
  }
}