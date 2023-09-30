import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiptime/home_page.dart';
import 'package:tiptime/tiptime_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TipTimeProvider(),
      child: MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)),
        home: HomePage(),
      ),
    ),
  );
}
