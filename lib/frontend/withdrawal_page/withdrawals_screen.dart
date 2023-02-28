import 'package:flutter/material.dart';
import 'package:qashpal/backend/constants/constants.dart';
import 'package:qashpal/frontend/constants.dart';
import 'package:qashpal/frontend/general_widgets/main.dart';
import 'package:qashpal/frontend/withdrawal_page/cashout_methods_screen.dart';
import 'package:qashpal/frontend/withdrawal_page/widgets.dart';

import '../account_transactions/main_account_transactions_page.dart';

Widget withdrawalsScreen() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListView(
        children: [
          welcomeBackTextWidget(),
          myEarningsWidgetCard(),
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
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            child: mainSubmitButton(
              text: "Proceed to withdrawal",
              // buttonColor: const Color.fromARGB(255, 1, 13, 39),
              myFunc: (() {
                navigatorKey.currentState!.push(MaterialPageRoute(
                    builder: (cotext) => const CashoutMethodsScreen()));
                // if (_withdrawalScreenFormKey.currentState!.validate()) {
                //   _withdrawalScreenFormKey.currentState!.save();
                //   print(text);
                // }
              }),
            ),
          ),
          const Divider(height: 2),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Previous Withdrawals",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    navigatorKey.currentState!.push(MaterialPageRoute(
                        builder: (context) => AccountTransactionsPage(
                              transactions: withdrawalsList!,
                            )));
                  },
                  child: Text(
                    "Show all",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: logoColor,
                    ),
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