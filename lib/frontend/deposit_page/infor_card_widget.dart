import 'package:flutter/material.dart';

Widget inforNotificationCardWidget(String text, String subText) {
  return Container(
    margin: const EdgeInsets.fromLTRB(10, 6, 10, 6),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: const Color.fromARGB(206, 51, 94, 178),
        // Color.fromRGBO(118, 49, 227, 1),
        width: 1.3,
      ),
      gradient: const RadialGradient(
        colors: [
          Color.fromRGBO(248, 245, 255, 1),
          Color.fromRGBO(248, 245, 255, 1),
        ],
        center: Alignment.bottomRight,
        radius: 1.618,
      ),
    ),
    padding: const EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Color.fromARGB(206, 51, 94, 178),
            // Color.fromRGBO(118, 49, 227, 1),
            fontSize: 16,
          ),
        ),
        Text(
          subText,
          style: const TextStyle(
            color: Color.fromARGB(206, 51, 94, 178),
            // Color.fromRGBO(118, 49, 227, 1),
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}
