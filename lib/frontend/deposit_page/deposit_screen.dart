import 'package:flutter/material.dart';
import 'package:qashpal/backend/constants/payment_providers.dart';
import 'package:qashpal/frontend/constants.dart';
import 'package:qashpal/frontend/deposit_page/widget.dart';
import 'package:qashpal/frontend/deposit_page/widgets.dart';
import 'package:qashpal/frontend/general_widgets/main.dart';
import 'package:qashpal/frontend/withdrawal_page/widgets.dart';

class DepositScreen extends StatelessWidget {
  DepositScreen({Key? key}) : super(key: key);
  String? text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView(
          shrinkWrap: true,
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
                text: "Proceed to deposit",
                // buttonColor: const Color.fromARGB(255, 1, 13, 39),
                myFunc: (() {
                  showDepositFormDialog(context, text);
                  // navigatorKey.currentState!.push(MaterialPageRoute(
                  //     builder: (context) => const SelectPaymentOptionScreen()));

                  // if (_withdrawalScreenFormKey.currentState!.validate()) {
                  //   _withdrawalScreenFormKey.currentState!.save();
                  //   print(text);
                  // }
                }),
              ),
            ),

            const Divider(height: 2),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Accepted payment methods",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
            Center(
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: paymentProviders
                    .map((e) => depositMethodWidgetCard(
                        ic: e.logo, text: e.name, color: e.color))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}