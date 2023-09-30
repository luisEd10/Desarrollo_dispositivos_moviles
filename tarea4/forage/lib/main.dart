import 'package:flutter/material.dart';
import 'package:forage/forage.dart';
import 'forage_provider.dart';
import 'package:provider/provider.dart';
import 'package:forage/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: MaterialApp(
        title: 'Flutter ListView Example',
        home: HomePage(),
      ),
    );
  }
}
 
