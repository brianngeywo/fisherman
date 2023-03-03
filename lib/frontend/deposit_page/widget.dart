import 'package:flutter/material.dart';
import 'package:qashpal/frontend/constants.dart';
import 'package:qashpal/frontend/general_widgets/main.dart';

showDepositFormDialog(BuildContext context, String? text) {
  return showDialog(
    builder: (BuildContext context) {
      return SimpleDialog(
        backgroundColor: mainPageBackgroundColor,
        title: mpesaSvg,
        // const Padding(
        //   padding: EdgeInsets.all(4),
        //   child: Text(
        //     "Safaricom Mpesa",
        //     textAlign: TextAlign.center,
        //     style: TextStyle(
        //       fontSize: 30,
        //       color: Colors.green,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),
        children: [
          const Padding(
            padding: EdgeInsets.all(4),
            child: Text(
              "Enter amount to deposit into your account",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                // color: Colors.green,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
          StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: "650",
                validator: (value) =>
                    value!.isEmpty ? 'Enter amount to deposit' : null,
                onSaved: (value) {
                  setState(() {
                    text = value;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    text = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  // fillColor: const Color.fromRGBO(232, 240, 254, 0.8),
                  labelText: 'Enter amount to deposit',
                  suffixStyle: const TextStyle(
                    color: Color.fromARGB(206, 51, 94, 178),
                    // Color.fromARGB(255, 1, 13, 39),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            );
          }),
          mainSubmitButton(
            text: "Confirm Payment",
            myFunc: (() {
              Navigator.of(context).pop();
            }),
          ),
        ],
      );
    },
    context: context,
  );
}