import 'package:coworkerdriver/ui/pages/conductor/perfilConductor.dart';
import 'package:coworkerdriver/ui/pages/login/registrarConductor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class menu extends StatefulWidget {
  const menu({super.key});

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  int index = 0;
  final List<Widget> _paginas = [
    RegistrarConductor(),
    PerfilConductor(),
  ];

  @override
  Widget build(BuildContext context) {
    //  _paginas[index];
    return BottomNavigationBar(
      onTap: (i) {
        setState(() {
          index = i;
        });
      },
      currentIndex: index,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.indigo,
      selectedItemColor: Colors.amber,
      selectedFontSize: 14,
      unselectedItemColor: Colors.white,
      unselectedFontSize: 14,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline_sharp),
          label: 'Perfil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.output_rounded),
          label: 'Salir',
        ),
      ],
    );
  }
}
