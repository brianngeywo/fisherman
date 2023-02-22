import 'package:flutter/material.dart';

SnackBar snackBar(String text, Color backgroundColor) {
  return SnackBar(
    backgroundColor: backgroundColor,
    duration: const Duration(seconds: 2),
    content: Text(text),
  );
}
