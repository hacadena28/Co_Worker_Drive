import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login/login.dart';

class HomeAdministrador extends StatefulWidget {
  const HomeAdministrador({super.key});

  @override
  State<HomeAdministrador> createState() => _homeAdministradorState();
}

class _homeAdministradorState extends State<HomeAdministrador> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Lista de conductores',
            style: TextStyle(
              color: Colors.amber,
              fontFamily: 'Montserrat',
              fontSize: 20,
            ),
          ),
        ),
        backgroundColor: Colors.indigo,
        actions: <Widget>[
          Row(
            children: [
              IconButton(
                tooltip: 'Salir',
                onPressed: () {
                  Get.to(() => Login());
                },
                icon: const Icon(
                  Icons.output_rounded,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: (Colors.indigo),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 200,
                      child: Text(
                        "Ingresos Generados:",
                        style: TextStyle(
                            fontSize: 20,
                            color: (Colors.amber),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "2.900.700",
                      style: TextStyle(
                          fontSize: 20,
                          color: (Colors.green),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: (Colors.indigo),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 200,
                      child: Text(
                        "Numero de viajes Realizados:",
                        style: TextStyle(
                            fontSize: 20,
                            color: (Colors.amber),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "230",
                      style: TextStyle(
                          fontSize: 20,
                          color: (Colors.green),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                child: TextField(
                  //controller: controlcorreo,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                    ),
                    labelText: 'Buscar ',
                    icon: Icon(
                      Icons.search,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                height: 250,
                child: Stack(
                  children: [
                    Positioned(
                        top: 35,
                        left: 20,
                        child: Material(
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 4.0,
                                  blurRadius: 20.0,
                                  offset: Offset(
                                      -10, 10), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                        )),
                    Positioned(
                        top: 0,
                        left: 30,
                        child: Card(
                          elevation: 30.0,
                          shadowColor: Colors.grey.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            height: 200,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    "assets/el.png",
                                  ),
                                )),
                          ),
                        )),
                    Positioned(
                        top: 45,
                        left: 200,
                        child: Container(
                          height: 200,
                          width: 180,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nombre",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: (Colors.blue),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Heli Alberto Cadena Arenilla",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: (Colors.green),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Vehiculo",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: (Colors.blue),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Moto",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: (Colors.green),
                                    fontWeight: FontWeight.bold),
                              ),
                              Divider(color: Colors.black),
                              Text(
                                "Cantidad De Viajes: 17",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: (Colors.green),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Ingresos Generados: 450.000",
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
              ),
              Container(
                height: 250,
                child: Stack(
                  children: [
                    Positioned(
                        top: 35,
                        left: 20,
                        child: Material(
                          child: Container(
                            height: 200.0,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 4.0,
                                  blurRadius: 20.0,
                                  offset: Offset(
                                      -10, 10), // changes position of shadow
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
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    "assets/ella.png",
                                  ),
                                )),
                          ),
                        )),
                    Positioned(
                        top: 45,
                        left: 200,
                        child: Container(
                          height: 200,
                          width: 180,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nombre",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: (Colors.blue),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Edna Rocio Cadena Arenilla",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: (Colors.green),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Vehiculo",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: (Colors.blue),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Moto",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: (Colors.green),
                                    fontWeight: FontWeight.bold),
                              ),
                              Divider(color: Colors.black),
                              Text(
                                "Cantidad De Viajes: 32",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: (Colors.green),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Ingresos Generados: 1.050.000",
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
              ),
              Container(
                height: 250,
                child: Stack(
                  children: [
                    Positioned(
                        top: 35,
                        left: 20,
                        child: Material(
                          child: Container(
                            height: 200.0,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 4.0,
                                  blurRadius: 20.0,
                                  offset: Offset(
                                      -10, 10), // changes position of shadow
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
                                borderRadius: BorderRadius.circular(10.0),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nombre",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: (Colors.blue),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Yulieth Vanesa Gonzales Larios",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: (Colors.green),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Vehiculo",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: (Colors.blue),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Moto",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: (Colors.green),
                                    fontWeight: FontWeight.bold),
                              ),
                              Divider(color: Colors.black),
                              Text(
                                "Cantidad De Viajes: 5",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: (Colors.green),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Ingresos Generados: 220.000",
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
      ),
      //   children: <Widget>[
      //     Row(
      //       children: [
      //         Column(
      //           children: [Text("Ingresos")],
      //         ),
      //         Column(
      //           children: [Text("Cantidad de Recorridos")],
      //         ),
      //       ],
      //     ),
      //     Row(
      //       children: [Column()],
      //     )
      //   ],
      // )
    );
  }
}
