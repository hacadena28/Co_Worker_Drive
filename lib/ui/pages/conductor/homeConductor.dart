import 'package:flutter/material.dart';

import '../navegador/menunavConductor.dart';

class homeConductor extends StatefulWidget {
  const homeConductor({super.key});

  @override
  State<homeConductor> createState() => _homeConductorState();
}

class _homeConductorState extends State<homeConductor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: DemoBottomAppBar(),
         appBar: AppBar(
          title: Center(
            child: Text(
              'Historial conductor',
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
