import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemoBottomAppBar extends StatelessWidget {
  const DemoBottomAppBar({
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
                tooltip: 'perfil',
                icon: const Icon(Icons.person_rounded),
                onPressed: () {
                  Get.offAllNamed('/perfilConductor');
                },
              ),
            ),
            if (centerLocations.contains(fabLocation)) const Spacer(),
            IconButton(
              tooltip: 'Maps',
              icon: const Icon(Icons.place_outlined),
              onPressed: () {
                Get.offAllNamed('/HomeMApsConductor');
              },
            ),
            IconButton(
              tooltip: 'moto',
              icon: const Icon(Icons.motorcycle),
              onPressed: () {
                Get.offAllNamed('/homeConductor');
              },
            ),
          ],
        ),
      ),
    );
  }
}
