import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qashpal/backend/constants/constants.dart';
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

Widget editNetworkAccountTextFormField(
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
    margin: const EdgeInsets.all(10),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: RadialGradient(
          colors: [
            Color.fromRGBO(107, 145, 251, 1),
            Color.fromRGBO(10, 67, 128, 1),
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
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            "total KES ${userProvider.user!.totalWithdrawals.toStringAsFixed(0)}"
                .toUpperCase(),
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            "KES ${userProvider.user!.accountBalance.toStringAsFixed(0)}"
                .toUpperCase(),
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: userProvider.user!.accountBalance >=
                      minimumAmountToWithdraw / 3.619
                  ? Colors.white
                  : Colors.amber,
            ),
          ),
          const SizedBox(height: 7),
          LinearProgressIndicator(
            backgroundColor:
                userProvider.user!.accountBalance >= minimumAmountToWithdraw
                    ? Colors.green
                    : mainPageBackgroundColor,
            value: userProvider.user!.accountBalance / minimumAmountToWithdraw,
          ),
          const SizedBox(height: 15),
          Text(
            userProvider.user!.accountBalance <= minimumAmountToWithdraw
                ? "Earn KES ${(minimumAmountToWithdraw - userProvider.user!.accountBalance).toStringAsFixed(0)} more to cash out"
                : "",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget cashoutMethodWidgetCard(Color? color,
    {required IconData ic, required String text1}) {
  return Card(
    color: color,
    elevation: 5,
    margin: const EdgeInsets.all(10),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(ic),
          const SizedBox(height: 5),
          Text(
            text1,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            "Min. cashout - KSHS $minimumAmountToWithdraw",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: mainButtonsColor,
            ),
          ),
          const SizedBox(height: 5),
          userProvider.user!.accountBalance < minimumAmountToWithdraw
              ? Row(
                  children: const [
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
                )
              : const SizedBox(),
        ],
      ),
    ),
  );
}

String? paymentMethod = "mpesa";
Widget selectPaymentOtionRadioListTile({
  required String title,
  required String number,
  required Color subTitleColor,
}) {
  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return Card(
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        margin: const EdgeInsets.all(10),
        child: SizedBox(
          height: 110,
          child: Center(
            child: RadioListTile(
              activeColor: const Color.fromARGB(206, 51, 94, 178),
              title: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.call,
                      size: 18,
                      color: subTitleColor,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      number,
                      style: TextStyle(
                        fontSize: 17,
                        color: subTitleColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                margin: const EdgeInsets.all(10),
                shape: const RoundedRectangleBorder(
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
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Amount: ${e.amount.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
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