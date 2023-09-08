import 'package:flutter/material.dart';
import 'package:info_lugar/info_lugar.dart';
import 'package:info_lugar/item_actividad.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> _listElements = [
    {
      "Dia": "Day 1",
      "Lugar": "Tokyo",
      "image": "build/flutter_assets/image/Tokyo.jpg"
    },
    {
      "Dia": "Day 2",
      "Lugar": "Cancun",
      "image": "build/flutter_assets/image/cancun.jpg"
    },
    {
      "Dia": "Day 3",
      "Lugar": "Londres",
      "image": "build/flutter_assets/image/londres.png"
    },
    {
      "Dia": "Day 4",
      "Lugar": "New York",
      "image": "build/flutter_assets/image/New_york.jpg"
    },
    {
      "Dia": "Day 5",
      "Lugar": "Paris",
      "image": "build/flutter_assets/image/Paris.jpg"
    }
  ];

  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserva tu hotel'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    child: Image.asset('build/flutter_assets/image/hotel.jpg',)
                  ),
                )
              ),
              // para poder poner column o listview en stack hay que encerrarlas en positioned y anclarla a todos lados
              Positioned(
                top: 200,
                bottom: 0,
                left: 0,
                right: 0,
                child: ListView(
                  children: [
                    InfoLugar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Details"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.grey[200],
                          ),
                        ),
                        Text("Walkthrough Flight Detail"),
                      ],
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _listElements.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemActividad(cityMap: _listElements[index],);
                        },
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: MaterialButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text("Reservacion en progreso")));
                        },
                        child: Text("Start booking", style: TextStyle(color: Colors.white),),
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
