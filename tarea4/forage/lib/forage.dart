import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:forage/forage_provider.dart';
import 'package:provider/provider.dart';

class Forge extends StatelessWidget {
  Forge({super.key});

  bool check = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forage"),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        alignment: Alignment.center,
      child: SizedBox(
        width: 400,
        child: Column(
          children: [
            SizedBox(height: 24,),
            TextField(
              controller: context.read<HomeProvider>().nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Name"),
              ),
            ),
            SizedBox(height: 24,),
            TextField(
              controller: context.read<HomeProvider>().locationController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Location"),
              ),
            ),
            SizedBox(height: 40,),
            Row(
              children: [
                Checkbox(value: context.watch<HomeProvider>().getcheck, onChanged: (bool? value){
                  context.read<HomeProvider>().changeCheck();
                }),
                Text("currently season")
              ],
            ),
            SizedBox(height: 40,),
            TextField(
              controller: context.read<HomeProvider>().noteController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Notes"),
              ),
            ),
            SizedBox(height: 150,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () {
                    context.read<HomeProvider>().saveElements();
                    Navigator.of(context).pop();
                  },
                  child: Text("SAVE", style: TextStyle(color: Colors.white)),
                  color: Colors.indigo,
                ),
                MaterialButton(
                  onPressed: () {
                    context.read<HomeProvider>().nameController.clear();
                    context.read<HomeProvider>().locationController.clear();
                    context.read<HomeProvider>().noteController.clear();
                    context.read<HomeProvider>().changeCheck();
                  },
                  child: Text("DELETE", style: TextStyle(color: Colors.white),),
                  color: Colors.indigo,
                )
              ],
            )
          ],
        ),
      ),
    ),
    );
  }
}
