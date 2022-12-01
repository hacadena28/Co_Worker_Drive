import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EsperandoConductor extends StatefulWidget {
  @override
  _EsperandoConductorState createState() => _EsperandoConductorState();
}

class _EsperandoConductorState extends State<EsperandoConductor>
    with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 10.0),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('E S P E R A N D O   C O N D U C T O R',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 14.0)),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60.0),
                  topRight: Radius.circular(60.0)),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          Get.offAllNamed('/HomeMApsPasajero');
                        },
                      ),
                      Text('Cancelar'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
