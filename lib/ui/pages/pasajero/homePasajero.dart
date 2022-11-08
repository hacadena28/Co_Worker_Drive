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
    );
  }
}
