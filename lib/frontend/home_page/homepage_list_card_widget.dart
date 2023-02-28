import 'package:flutter/material.dart';

Widget homepageListCardWidget(
  String title,
  String subTitle,
  List<Color> cardColor,
  IconData icon,
) {
  return Card(
    margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Container(
      // height: 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: RadialGradient(
          colors: cardColor,
          center: Alignment.bottomRight,
          radius: 1.618,
        ),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              icon,
              size: 35,
              color: const Color.fromRGBO(227, 171, 2, 1),
            ),
          ),
          Text(
            subTitle,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 19,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ],
      ),
    ),
  );
}