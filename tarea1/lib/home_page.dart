import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mc Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 170,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(border: Border.all(width: 1)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 48,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Flutter McFlutter",
                        style: TextStyle(fontSize: 25),
                      ),
                      Text("Experienced App Developer")
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("123 Main Street"), Text("(415) 555-0198")],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DemoIconToggleButtons())
            ],
          ),
        ),
      ),
    );
  }
}

class DemoIconToggleButtons extends StatefulWidget {
  const DemoIconToggleButtons({super.key});

  @override
  State<DemoIconToggleButtons> createState() => _DemoIconToggleButtonsState();
}

class _DemoIconToggleButtonsState extends State<DemoIconToggleButtons> {
  Color _iconColorAccess = Colors.black;
  Color _iconColorTime = Colors.black;
  Color _iconColorAndroid = Colors.black;
  Color _iconColorIphone = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text("Accesibilidad")));
              setState(() {
                if (_iconColorAccess == Colors.black) {
                  _iconColorAccess = Colors.indigo;
                } else {
                  _iconColorAccess = Colors.black;
                }
              });
            },
            icon: Icon(
              Icons.accessibility,
              color: _iconColorAccess,
            )),
        IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text("Tiempo")));
              setState(() {
                if (_iconColorTime == Colors.black) {
                  _iconColorTime = Colors.indigo;
                } else {
                  _iconColorTime = Colors.black;
                }
              });
            },
            icon: Icon(
              Icons.timer,
              color: _iconColorTime,
            )),
        IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text("Android")));
              setState(() {
                if (_iconColorAndroid == Colors.black) {
                  _iconColorAndroid = Colors.indigo;
                } else {
                  _iconColorAndroid = Colors.black;
                }
              });
            },
            icon: Icon(
              Icons.phone_android,
              color: _iconColorAndroid,
            )),
        IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text("Iphone")));
              setState(() {
                if (_iconColorIphone == Colors.black) {
                  _iconColorIphone = Colors.indigo;
                } else {
                  _iconColorIphone = Colors.black;
                }
              });
            },
            icon: Icon(
              Icons.phone_iphone,
              color: _iconColorIphone,
            ))
      ],
    );
  }
}
