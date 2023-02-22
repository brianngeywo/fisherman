import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qashpal/frontend/constants.dart';

Widget topAppBarDropDownListTextButton(
  BuildContext context,
  IconData icon,
  int index,
  String buttonText,
) {
  return ListTile(
    leading: FaIcon(
      icon,
      size: 16,
    ),
    title: Text(
      buttonText,
      style: TextStyle(
        color: Colors.white.withOpacity(0.5),
        fontSize: 16,
      ),
    ),
    onTap: () {
      final CurvedNavigationBarState? navBarState =
          bottomNavigationKey.currentState;
      navBarState?.setPage(index);
      Navigator.of(context).pop();
    },
    iconColor: const Color.fromARGB(206, 51, 94, 178),
  );
}

ListTile topAppBarDropDownListTileButtonWidget(
    IconData icon, String text, Function myNav) {
  return ListTile(
    leading: FaIcon(
      icon,
      size: 16,
    ),
    title: Text(
      text,
      style: TextStyle(
        color: Colors.white.withOpacity(0.5),
        fontSize: 16,
      ),
    ),
    onTap: () => myNav(),
    iconColor: const Color.fromARGB(206, 51, 94, 178),
  );
}