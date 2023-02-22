import 'package:flutter/material.dart';

Widget successNotificationCardWidget(String text) {
  return Container(
    margin: const EdgeInsets.fromLTRB(10, 6, 10, 6),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: const Color.fromRGBO(80, 205, 137, 1),
        width: 1.3,
      ),
      gradient: const RadialGradient(
        colors: [
          Color.fromRGBO(232, 255, 243, 1),
          Color.fromRGBO(232, 255, 243, 1),
        ],
        center: Alignment.bottomRight,
        radius: 1.618,
      ),
    ),
    padding: const EdgeInsets.all(15),
    child: Text(
      text,
      style: const TextStyle(
        color: Color.fromRGBO(80, 205, 137, 1),
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}