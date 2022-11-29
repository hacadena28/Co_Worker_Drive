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
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
          ),
          Column(
            children: [
              Container(
                height: 230,
                decoration: const BoxDecoration(
                  // ignore: unnecessary_const
                  borderRadius:
                      const BorderRadius.only(bottomRight: Radius.circular(50)),
                  color: Colors.indigo,
                ),
                child: Stack(
                  children: [
                    Positioned(
                        top: 80,
                        left: 0,
                        child: Container(
                          height: 100,
                          width: 300,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              )),
                        )),
                    const Positioned(
                        top: 110,
                        left: 20,
                        child: Text(
                          "Mis Rutas",
                          style: const TextStyle(
                            color: Colors.amber,
                            fontFamily: 'Montserrat',
                            fontSize: 46,
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                padding: const EdgeInsets.all(8),
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
                height: MediaQuery.of(context).size.height * 0.05,
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
                            height: 180.0,
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
                          height: 150,
                          width: 180,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Origen",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: (Colors.blue),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Universidad",
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
                                "Hurtado",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: (Colors.green),
                                    fontWeight: FontWeight.bold),
                              ),
                              Divider(color: Colors.black),
                              Text(
                                "Valor: 3000",
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
                            height: 180.0,
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
                          height: 150,
                          width: 180,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Origen",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: (Colors.blue),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Universidad",
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
                                "Hurtado",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: (Colors.green),
                                    fontWeight: FontWeight.bold),
                              ),
                              Divider(color: Colors.black),
                              Text(
                                "Valor: 3000",
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
                            height: 180.0,
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
                          height: 150,
                          width: 180,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Origen",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: (Colors.blue),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Universidad",
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
                                "Hurtado",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: (Colors.green),
                                    fontWeight: FontWeight.bold),
                              ),
                              Divider(color: Colors.black),
                              Text(
                                "Valor: 3000",
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
      ),
    );
  }
}
