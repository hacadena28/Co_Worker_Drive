import 'package:coworkerdriver/domain/modelo/conductor.dart';
import 'package:coworkerdriver/ui/pages/navegador/menunav.dart';
import 'package:flutter/material.dart';

class PerfilConductor extends StatelessWidget {
  TextEditingController controlnombres = TextEditingController();
  TextEditingController controlapellidos = TextEditingController();
  TextEditingController controlsexo = TextEditingController();
  TextEditingController controltelefono = TextEditingController();
  TextEditingController controlcorreo = TextEditingController();
  TextEditingController controlplacamoto = TextEditingController();
  TextEditingController controlclave = TextEditingController();
  var bandera = false;
/*
  PerfilConductor(Conductor usuario) {
    controlnombres.text = usuario.nombres.toString();
    controlapellidos.text = usuario.apellidos.toString();
    controlsexo.text = usuario.sexo.toString();
    controltelefono.text = usuario.telefono.toString();
    controlcorreo.text = usuario.correo.toString();
    controlplacamoto.text = usuario.placaMoto.toString();
  }
  */
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: menu(),
        drawer: Drawer(),
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: MySliverAppBar(expandedHeight: 200),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 130.0, left: 20, right: 20),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
                          TextField(
                            enabled: false,
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
                            enabled: false,
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
                            enabled: false,
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
                            enabled: false,
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
                            enabled: false,
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
                            controller: controlplacamoto,
                            enabled: false,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  30,
                                ),
                              ),
                              labelText: 'placa moto',
                              icon: Icon(
                                Icons.person,
                                color: Colors.amber,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 10,
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
                                      Icons.update_rounded,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: Colors.green[600]),
                                    label: Text("Actualizar Datos")),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        Container(
          color: Colors.indigo,
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Text(
              "Mi Perfil",
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 2 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 4,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Card(
              color: Colors.transparent,
              elevation: 0,
              child: SizedBox(
                height: expandedHeight,
                width: MediaQuery.of(context).size.width / 2,
                child: const CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/profile.png',
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
