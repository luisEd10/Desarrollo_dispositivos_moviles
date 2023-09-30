import 'package:flutter/material.dart';
import 'list_item_tile.dart';

class HomeProvider extends ChangeNotifier {
  bool _check = false;
  bool get getcheck => _check;
  var nameController = TextEditingController();
  var locationController = TextEditingController();
  var noteController = TextEditingController();
  List<Item> _items = [
   
  ];

  List<Item> get getItems => _items;

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void saveElements(){
    _items.add(Item(title: nameController.text, location: locationController.text, onSeason: _check, notes: noteController.text));
    notifyListeners();
    nameController.clear();
    locationController.clear();
    noteController.clear();
    _check = false;
  }

  void changeCheck(){
    if(_check == false){
      _check = true;
    }else{
      _check = false;
    }
    notifyListeners();
  }
}
