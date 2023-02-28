import 'package:flutter/material.dart';

Widget depositMethodWidgetCard(
    {required IconData ic, required String text, Color? color}) {
  return Card(
    color: color ?? Colors.white,
    elevation: 5,
    margin: const EdgeInsets.all(10),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Container(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Icon(
                ic,
                color: Colors.white,
                size: 40,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    ),
  );
}