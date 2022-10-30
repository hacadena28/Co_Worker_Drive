import 'package:coworkerdriver/ui/pages/conductor/perfilConductor.dart';
import 'package:coworkerdriver/ui/pages/login/registrarConductor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemoBottomAppBarPasajero extends StatelessWidget {
  const DemoBottomAppBarPasajero({
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
                tooltip: 'Inicio',
                icon: const Icon(Icons.home_rounded),
                onPressed: () {},
              ),
            ),
            if (centerLocations.contains(fabLocation)) const Spacer(),
            IconButton(
              tooltip: 'driver',
              icon: const Icon(Icons.motorcycle_rounded),
              onPressed: () {
                Get.offAllNamed('/homeConductor');
              },
            ),
            IconButton(
              tooltip: 'perfil',
              icon: const Icon(Icons.person_rounded),
              onPressed: () {
                Get.offAllNamed('/perfilConductor');
              },
            ),
          ],
        ),
      ),
    );
  }
}
