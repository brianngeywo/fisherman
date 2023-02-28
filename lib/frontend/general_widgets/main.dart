import 'package:flutter/material.dart';
import 'package:qashpal/backend/constants/constants.dart';

Widget welcomeBackTextWidget() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      "Welcome back ${userProvider.user!.id}",
      style: const TextStyle(
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