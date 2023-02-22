import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qashpal/frontend/constants.dart';

import '../../backend/models/account_transactions.dart';

Widget withdrawTextFormField(
    {required String? text, required String? hintText}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child:
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      return TextFormField(
        validator: (value) =>
            value!.isEmpty ? 'Enter amount to withdraw' : null,
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
          hintText: hintText,
          helperText: hintText,
          labelText: hintText,
          suffixStyle: const TextStyle(
            color: Color.fromARGB(206, 51, 94, 178),
            // Color.fromARGB(255, 1, 13, 39),
          ),
        ),
        keyboardType: TextInputType.number,
      );
    }),
  );
}

Widget myEarningsWidgetCard() {
  return Card(
    elevation: 5,
    margin: EdgeInsets.all(10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            const Color.fromRGBO(107, 145, 251, 1),
            const Color.fromRGBO(10, 67, 128, 1),
          ],
          center: Alignment.bottomRight,
          radius: 1.618,
        ),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My earnings".toUpperCase(),
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 3),
          Text(
            "total ksh 4500".toUpperCase(),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 3),
          Text(
            "KSHS 5.00".toUpperCase(),
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 3),
          LinearProgressIndicator(
            backgroundColor: mainPageBackgroundColor,
            value: 0.2,
          ),
          SizedBox(height: 5),
          Text("Earn KSHS 345.00 more to cash out"),
        ],
      ),
    ),
  );
}

Widget cashoutMethodWidgetCard(IconData ic, String text1) {
  return Card(
    elevation: 5,
    margin: EdgeInsets.all(10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(ic),
          SizedBox(height: 5),
          Text(
            text1,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            "Min. cashout - KSHS 450.00",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(
                Icons.warning_amber,
                color: Colors.amber,
                size: 14,
              ),
              SizedBox(width: 5),
              Text(
                "Balance too low",
                style: TextStyle(
                  color: Colors.amber,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

String? paymentMethod = "mpesa";
Widget selectPaymentOtionRadioListTile(String title, String number) {
  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        margin: EdgeInsets.all(10),
        child: SizedBox(
          height: 90,
          child: Center(
            child: RadioListTile(
              activeColor: Color.fromARGB(206, 51, 94, 178),
              title: Text(title),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.call,
                    size: 16,
                  ),
                  SizedBox(width: 10),
                  Text(
                    number,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              value: "mpesa $number",
              groupValue: paymentMethod,
              onChanged: (value) {
                setState(() {
                  paymentMethod = value.toString();
                });
              },
            ),
          ),
        ),
      );
    },
  );
}

Widget transactionsScrollableRowCards(List<AccountTransactions> list) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: list!
          .map(
            (e) => Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Container(
                  height: 120,
                  width: 220,
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "${e.transactionId}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Amount: ${e.amount.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Date: 12/1/2023",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
          .toList(),
    ),
  );
}