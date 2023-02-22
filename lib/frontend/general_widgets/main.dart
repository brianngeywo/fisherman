import 'package:flutter/material.dart';
import 'package:qashpal/backend/constants.dart';

Widget welcomeBackTextWidget() {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Text(
      "Welcome back ${userProvider.user!.id}",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
    ),
  );
}

DataColumn myDataColumn(String text) {
  return DataColumn(
    label: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}