import 'package:flutter/material.dart';
import 'list_item_tile.dart';

class ListDetails extends StatelessWidget {
  final Item item;

  ListDetails({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.title)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('${item.location}'),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text(item.onSeason
                  ? 'It\'s on season'
                  : 'It\'s not on season'),
            ),
            ListTile(
              leading: Icon(Icons.notes),
              title: Text('${item.notes}'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
      },
      child: Icon(Icons.edit),)
    );
  }
}
