import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qashpal/backend/constants/constants.dart';
import 'package:qashpal/frontend/constants.dart';

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

final Widget mpesaSvg = Center(
  child: SvgPicture.asset(
    mpesaImage,
    fit: BoxFit.contain,
    height: 80,
    width: 160,
  ),
);