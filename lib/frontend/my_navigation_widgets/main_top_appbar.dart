import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qashpal/frontend/constants.dart';

PreferredSizeWidget topAppBar(BuildContext context,
    {required bool automaticallyImplyLeading,
    required bool showUserIconDropdown}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: automaticallyImplyLeading
        ? IconButton(
            onPressed: () => navigatorKey.currentState?.pop(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          )
        : const Icon(
            Icons.stacked_line_chart,
            color: Color.fromARGB(255, 1, 13, 39),
            size: 40,
          ),
    title: const Text(
      "QashPal",
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(206, 51, 94, 178),
      ),
    ),
    actions: [
      showUserIconDropdown
          ? Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Builder(
                builder: (context) => IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.barsStaggered,
                    color: Colors.black,
                  ),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
              ),
            )
          : const Text(""),
    ],
  );
}