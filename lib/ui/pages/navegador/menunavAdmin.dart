import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuAdministrador extends StatelessWidget {
  const MenuAdministrador({
    this.fabLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  static final List<FloatingActionButtonLocation> centerLocations =
      <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Colors.indigo,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, right: 5.0, left: 5.0, bottom: 2),
              child: IconButton(
                tooltip: 'Pasajeros',
                icon: const Icon(Icons.people),
                onPressed: () {
                  Get.offAllNamed('/homeAdministrador');
                },
              ),
            ),
            if (centerLocations.contains(fabLocation)) const Spacer(),
            IconButton(
              tooltip: 'Conductores',
              icon: const Icon(Icons.motorcycle_sharp),
              onPressed: () {
                Get.offAllNamed('/consultarConductor');
              },
            ),
            IconButton(
              tooltip: 'rutas',
              icon: const Icon(Icons.route_sharp),
              onPressed: () {
                Get.offAllNamed('/ConsultarRutas');
              },
            ),
          ],
        ),
      ),
    );
  }
}
