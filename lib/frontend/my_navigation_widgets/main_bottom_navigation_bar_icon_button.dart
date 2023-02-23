import 'package:flutter/cupertino.dart';

Widget mainBottomNavigationBarItmIconButton(IconData icon) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: Icon(
        icon,
        size: 20,
        color: const Color.fromARGB(255, 1, 13, 39),
      ),
    ),
  );
}