import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/controller/controladorRuta.dart';
import '../navegador/menunavPasajero.dart';

class homePasajero extends StatefulWidget {
  final db = FirebaseFirestore.instance;

  @override
  State<homePasajero> createState() => _homePasajeroState();
}

class _homePasajeroState extends State<homePasajero> {
  @override
  Widget build(BuildContext context) {
    RutaController controladorRuta = Get.put(RutaController());
    controladorRuta.consultaRutas().then((value) => null);
    return Scaffold(
      bottomNavigationBar: DemoBottomAppBarPasajero(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text("Historial De Viajes")),
      ),
      body: Obx(
        () => controladorRuta.getArticulosGral?.isEmpty == false
            ? ListView.builder(
                itemCount: controladorRuta.getArticulosGral?.isEmpty == true
                    ? 0
                    : controladorRuta.getArticulosGral!.length,
                itemBuilder: (context, posicion) {
                  return ExpansionTile(
                    /////////
                    collapsedBackgroundColor: Colors.indigo.shade100,
                    backgroundColor: Colors.indigo[400],
                    textColor: Colors.white,
                    title: Text("Origen: " +
                        controladorRuta.getArticulosGral![posicion].origen),
                    subtitle: Text("Destino: " +
                        controladorRuta.getArticulosGral![posicion].destiono),

                    /////////
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Container(
                            height: 230,
                            child: Stack(
                              children: [
                                Positioned(
                                    top: 35,
                                    left: 20,
                                    child: Material(
                                      child: Container(
                                        height: 210.0,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              spreadRadius: 4.0,
                                              blurRadius: 20.0,
                                              offset: Offset(-10,
                                                  10), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                                Positioned(
                                    top: 0,
                                    left: 30,
                                    child: Card(
                                      elevation: 10.0,
                                      shadowColor: Colors.grey.withOpacity(0.5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Container(
                                        height: 200,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                "assets/profile.png",
                                              ),
                                            )
                                            // image: DecorationImage(image: AssetImage("icons/heart.png", package: 'my_icons'),
                                            //fit: BoxFit.fill)
                                            ),
                                      ),
                                    )),
                                Positioned(
                                    top: 45,
                                    left: 200,
                                    child: Container(
                                      height: 200,
                                      width: 180,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Origen",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: (Colors.blue),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            controladorRuta
                                                .getArticulosGral![posicion]
                                                .origen,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: (Colors.green),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Destino",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: (Colors.blue),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            controladorRuta
                                                .getArticulosGral![posicion]
                                                .destiono,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: (Colors.green),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Divider(color: Colors.black),
                                          Text(
                                            controladorRuta
                                                .getArticulosGral![posicion]
                                                .tarifa,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: (Colors.green),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Vehiculo: Moto",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: (Colors.green),
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                })
            : const Icon(Icons.abc),
      ),
    );
  }
}
