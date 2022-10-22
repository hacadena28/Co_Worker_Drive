import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class menu extends StatefulWidget {
  const menu({super.key});

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (int i) {
        setState(() {});
      },
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
      ],
    );
  }
}
