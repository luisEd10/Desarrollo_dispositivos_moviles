import 'package:act_queries/get_chats.dart';
import 'package:act_queries/get_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        ),
        body: Column(
          children: [
            MaterialButton( //Usar sizedbox para separar los botones y tambien para agrandar a los botones
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => GetChats()));
              },
              child: Text("get Existing Chats"),
            ),
            MaterialButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => GetMessage()));
              },
              child: Text("get Chat Messages"),
            ),
            MaterialButton(
              onPressed: () async{
                CollectionReference chat = FirebaseFirestore.instance.collection('chats');
                DocumentReference chatDocument = await chat.add(
                  {
                    'chatters':[
                      "usr1",
                      "usr2"
                    ],
                    'createdAt':DateTime.now(),
                    'lastModifiedAt':DateTime.now(),
                  }
                );
                CollectionReference message = chatDocument.collection('messages');
                message.add({
                  'content':{
                    "files":"",
                    "msg":"Como estas?"
                  },
                  'createdAt':DateTime.now(),
                  'senderId':"usr2",
                  'senderName': "Pepe"
                }).then((value) => print("datos subido a la db"))
                .catchError((error) => print("error $error"));
              },
              child: Text("add New Chat"),
            ),
            MaterialButton(
              onPressed: (){
                CollectionReference newMessage = FirebaseFirestore.instance.collection('chats/rFvY60ICF2xmiN5PzPbA/messages');
                newMessage.add({
                  'content':{
                    "files":"",
                    "msg":"Holaaa"
                  },
                  'createdAt':DateTime.now(),
                  'senderId':"usr2",
                  'senderName': "Pedro"
                }).then((value) => print("Nuevo mensaje subido"))
                .catchError((error) => print("error $error"));
              },
              child: Text("update Existing Chat"),
            )
          ],
        )
      );
  }
}