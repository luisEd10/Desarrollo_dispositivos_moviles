import 'package:flutter/material.dart';
//REVISAR PARA PODER IMPRIMIR EL NUMERO DE LIKES Y AGREGAR EL BOTON DE DISLIKES
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int like = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App ITESO'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network(
                "https://keystoneacademic-res.cloudinary.com/image/upload/element/12/121980_121891__MG_2277.jpg"),
            ListTile(
               title: Text("El ITESO"),
              subtitle: Text("San Pedro Tlaquepaque, Jal"),
              trailing: new Container(
                width: 110,
                child: new Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        like += 1;
                        setState(() {
                        });
                      },
                      icon: Icon(
                        Icons.thumb_up,
                        color: Colors.blue,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if(like != 0){
                          like -= 1;
                        }else{
                          like = 0;
                        }
                        setState(() {
                          
                        });
                      }, 
                      icon: Icon(Icons.thumb_down, color: Colors.blue,)),
                    Text('$like')
                  ],
                ),
              ),
            ),
            DemoIconToggleButtons(),
            SizedBox(height: 64),
            Text(
                '''El ITESO, Universidad Jesuita de Guadalajara (Instituto Tecnológico y de Estudios Superiores de Occidente) es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957.
        
        La institución forma parte del Sistema Universitario Jesuita (SUJ) que integra a ocho universidades en México. La universidad es nombrada como la Universidad Jesuita de Guadalajara.2​''',
                textAlign: TextAlign.justify)
          ],
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
  Color _iconColorCorreo = Colors.black;
  Color _iconColorLlamada = Colors.black;
  Color _iconColorRuta = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            IconButton(
                iconSize: 48,
                onPressed: () {
                  setState(() {
                    if (_iconColorCorreo == Colors.black) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(
                          content: Text("El correo es ..."),
                        ));
                      _iconColorCorreo = Colors.indigo;
                    } else {
                      _iconColorCorreo = Colors.black;
                    }
                  });
                },
                icon: Icon(
                  Icons.message,
                  color: _iconColorCorreo,
                )),
            Text("Correo")
          ],
        ),
        Column(
          children: [
            IconButton(
                iconSize: 48,
                onPressed: () {
                  setState(() {
                    if (_iconColorLlamada == Colors.black) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(
                          content: Text("El numero telefonico es..."),
                        ));
                      _iconColorLlamada = Colors.indigo;
                    } else {
                      _iconColorLlamada = Colors.black;
                    }
                  });
                },
                icon: Icon(
                  Icons.phone,
                  color: _iconColorLlamada,
                )),
            Text("Llamada")
          ],
        ),
        Column(
          children: [
            IconButton(
                iconSize: 48,
                onPressed: () {
                  setState(() {
                    if (_iconColorRuta == Colors.black) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(
                          content: Text(
                              "Se encuentra ubicado en Periférico Sur 8585"),
                        ));
                      _iconColorRuta = Colors.indigo;
                    } else {
                      _iconColorRuta = Colors.black;
                    }
                  });
                },
                icon: Icon(
                  Icons.directions,
                  color: _iconColorRuta,
                )),
            Text("Ruta")
          ],
        )
      ],
    );
  }
}
