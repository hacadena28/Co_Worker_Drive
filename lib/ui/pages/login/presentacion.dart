import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Presentacion extends StatefulWidget {
  const Presentacion({super.key});

  @override
  State<Presentacion> createState() => _PresentacionState();
}

class _PresentacionState extends State<Presentacion> {
  final images = [
    {'image': 'assets/seguro.png'},
    {'image': 'assets/rapido.png'},
    {'image': 'assets/economico.png'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height * 1,
        //  padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bienvenido',
                      style: TextStyle(color: Colors.indigo[900], fontSize: 32),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  padding: EdgeInsets.only(bottom: 8),
                  child: Image.asset(
                    'assets/logo.png',
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 1,
              child: Container(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (_, i) => Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 1,
                        child: Image.asset(
                          images[i]['image'].toString(),
                          //  fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.home,
                          size: 25,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Get.offAllNamed('/login');
                        },
                        style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.indigo),
                        label: Text("Empezar",
                            style: TextStyle(
                                fontFamily: 'Montserrat', fontSize: 20.0))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget box(String title, Color backgroundcolor) {
  return Container(
      margin: EdgeInsets.all(10),
      width: 80,
      color: backgroundcolor,
      alignment: Alignment.center,
      child: Text(title, style: TextStyle(color: Colors.white, fontSize: 20)));
}
