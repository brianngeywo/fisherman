import 'dart:core';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

int pageIndex = 0;
Color mainPageBackgroundColor = const Color.fromRGBO(232, 240, 254, 1);
Color accountTransactionsTabTextColor = Colors.black;
GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
final CurvedNavigationBarState? navBarState = bottomNavigationKey.currentState;
Color mainButtonsColor = const Color.fromARGB(255, 1, 13, 39);
Color logoColor = const Color.fromARGB(206, 51, 94, 178);
final navigatorKey = GlobalKey<NavigatorState>();

showAlert(BuildContext context, String text) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        contentPadding: const EdgeInsets.only(top: 10.0),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.65,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                "Error Message",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: mainPageBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),
                padding: const EdgeInsets.only(
                  left: 30.0,
                  right: 30.0,
                  top: 20,
                  bottom: 20,
                ),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 1, 13, 39),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget mainSubmitButton({required String text, Function? myFunc}) {
  return Container(
    color: mainPageBackgroundColor,
    padding: const EdgeInsets.all(8.0),
    child: MaterialButton(
      padding: const EdgeInsets.all(5.0),
      onPressed: () => myFunc!(),
      minWidth: double.infinity,
      color: mainButtonsColor,
      textColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    ),
  );
}