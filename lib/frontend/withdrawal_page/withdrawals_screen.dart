import 'package:flutter/material.dart';
import 'package:qashpal/backend/constants.dart';
import 'package:qashpal/frontend/constants.dart';
import 'package:qashpal/frontend/general_widgets/main.dart';
import 'package:qashpal/frontend/withdrawal_page/cashout_methods_screen.dart';
import 'package:qashpal/frontend/withdrawal_page/widgets.dart';

Widget withdrawalsScreen() {
  String? text;
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          welcomeBackTextWidget(),
          myEarningsWidgetCard(),
          const Divider(height: 2),
          // Center(
          //   child: const Padding(
          //     padding: EdgeInsets.all(8.0),
          //     child: Text(
          //       "Enter Amount to Withdraw",
          //       style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         fontSize: 23,
          //       ),
          //     ),
          //   ),
          // ),
          // Form(
          //   key: _withdrawalScreenFormKey,
          //   child: withdrawTextFormField(text),
          // ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: mainSubmitButton(
              text: "Proceed to withdrawal",
              buttonColor: const Color.fromARGB(255, 1, 13, 39),
              myFunc: (() {
                navigatorKey.currentState!.push(MaterialPageRoute(
                    builder: (cotext) => CashoutMethodsScreen()));
                print("object");
                // if (_withdrawalScreenFormKey.currentState!.validate()) {
                //   _withdrawalScreenFormKey.currentState!.save();
                //   print(text);
                // }
              }),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Previous Transactions",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Show all",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: logoColor,
                  ),
                ),
              ],
            ),
          ),
          transactionsScrollableRowCards(withdrawalsList!),
        ],
      ),
    ),
  );
}