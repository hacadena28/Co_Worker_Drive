import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrarPasajero extends StatefulWidget {
  const RegistrarPasajero({super.key});

/*   var nombres;
  var apellidos;
  var sexo;
  var telefono;
  var correo;
  var placaMoto;
  var usuario;
  var clave;
*/

  @override
  State<RegistrarPasajero> createState() => _RegistrarPasajeroState();
}

class _RegistrarPasajeroState extends State<RegistrarPasajero> {
  TextEditingController controlnombres = TextEditingController();
  TextEditingController controlapellidos = TextEditingController();
  TextEditingController controlsexo = TextEditingController();
  TextEditingController controltelefono = TextEditingController();
  TextEditingController controlcorreo = TextEditingController();
  TextEditingController controlusuario = TextEditingController();
  TextEditingController controlclave = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 1.0, left: 10.0),
          ),
          SizedBox(height: 6.0),
          Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.offAllNamed('/rol');
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('P A S A J E R O',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30.0)),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(96.0),
                  topRight: Radius.circular(96.0)),
              boxShadow: [
                new BoxShadow(
                  color: Colors.indigo.shade900,
                  spreadRadius: 12,
                  blurRadius: 15,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: controlnombres,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                      labelText: 'Nombres',
                      icon: Icon(
                        Icons.person,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controlapellidos,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                      labelText: 'Apellidos',
                      icon: Icon(
                        Icons.person,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controlsexo,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                      labelText: 'Sexo',
                      icon: Icon(
                        Icons.person,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controltelefono,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                      labelText: 'Telefono',
                      icon: Icon(
                        Icons.person,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controlcorreo,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                      labelText: 'Correo Electronico',
                      icon: Icon(
                        Icons.person,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controlusuario,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                      labelText: 'Usuario',
                      icon: Icon(
                        Icons.person,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controlclave,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                      labelText: 'Clave',
                      icon: Icon(
                        Icons.person,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton.icon(
                            icon: Icon(
                              Icons.login,
                              size: 20,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Get.offAllNamed('/login');
                            },
                            style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.green[600]),
                            label: Text("Registrar")),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
