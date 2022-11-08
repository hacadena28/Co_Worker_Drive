import 'package:flutter/material.dart';

import '../navegador/menunavPasajero.dart';

class homePasajero extends StatefulWidget {
  const homePasajero({super.key});

  @override
  State<homePasajero> createState() => _homeConductorState();
}

class _homeConductorState extends State<homePasajero> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: DemoBottomAppBarPasajero(),
        appBar: AppBar(
          title: Center(
            child: Text(
              'Historial Pasajero',
              style: TextStyle(
                color: Colors.amber,
                fontFamily: 'Montserrat',
                fontSize: 20,
              ),
            ),
          ),
          backgroundColor: Colors.indigo,
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                child: Table(
                  border: TableBorder.all(),
                  children: [
                    TableRow(children: [
                      Text('Origen',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Destino',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Tarifa',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Usuario',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ]),
                    TableRow(children: [
                      Text('calle 5', textAlign: TextAlign.center),
                      Text('universidad ', textAlign: TextAlign.center),
                      Text('2000 ', textAlign: TextAlign.center),
                      Text('juanchito ', textAlign: TextAlign.center),
                    ]),
                    TableRow(children: [
                      Text(' universidad', textAlign: TextAlign.center),
                      Text('calle 9 ', textAlign: TextAlign.center),
                      Text('2000 ', textAlign: TextAlign.center),
                      Text('juana ', textAlign: TextAlign.center),
                    ]),
                  ],
                ),
              ),
            ])));
  }
}
