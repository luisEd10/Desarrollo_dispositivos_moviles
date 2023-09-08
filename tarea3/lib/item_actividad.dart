import 'package:flutter/material.dart';

class ItemActividad extends StatelessWidget {
  final Map<String, String> cityMap;
  ItemActividad({super.key, required this.cityMap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 120,
      width: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned.fill(child: Image.asset("${cityMap["image"]}", fit: BoxFit.fill)),
            Positioned(
              bottom: 10,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Text("${cityMap["Dia"]}", style: TextStyle(fontSize: 11, color: Colors.white)),
                  Text("${cityMap["Lugar"]}", style: TextStyle(color: Colors.white),),
                ],
              )
            )    
          ],
        ),
      )
    );
  }
}
