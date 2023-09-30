

import 'package:flutter/material.dart';
import 'package:forage/forage.dart';
import 'package:provider/provider.dart';
import 'forage_provider.dart';

import 'forage_detail.dart'; // Import your details screen

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Items')),
      body: ListView.builder(
        itemCount: provider.getItems.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(provider.getItems[index].title),
                subtitle: Text(provider.getItems[index].location),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        ListDetails(item: provider.getItems[index]),
                  ));
                },
              ),
              Divider(
                thickness: 1.0, // Adjust the thickness as needed
                color: Colors.grey, // Adjust the color as needed
              ),
            ],
          );
        },
      ),
      
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Forge()));
      },
      child: Icon(Icons.add),),
    );
  }
}