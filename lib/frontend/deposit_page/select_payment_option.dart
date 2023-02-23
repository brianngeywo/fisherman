import 'package:flutter/material.dart';
import 'package:qashpal/backend/constants/constants.dart';
import 'package:qashpal/backend/constants/payment_providers.dart';
import 'package:qashpal/frontend/constants.dart';
import 'package:qashpal/frontend/deposit_page/safaricom_mpesa_deposit_instructions.dart';
import 'package:qashpal/frontend/deposit_page/widgets.dart';
import 'package:qashpal/frontend/my_navigation_widgets/main_top_appbar.dart';
import 'package:qashpal/frontend/withdrawal_page/widgets.dart';

class SelectPaymentOptionScreen extends StatelessWidget {
  const SelectPaymentOptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBar(context,
          automaticallyImplyLeading: true, showUserIconDropdown: false),
      backgroundColor: mainPageBackgroundColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Account balance: ${userProvider.user!.accountBalance.toStringAsFixed(0)}",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(206, 51, 94, 178),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Choose a payment method",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    // color: Colors.amber,
                  ),
                ),
              ),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                children: paymentProviders
                    .map(
                      (e) => GestureDetector(
                        onTap: () => navigatorKey.currentState?.push(
                          MaterialPageRoute(
                            builder: (cotext) => MpesaDepositInstructionsPage(),
                          ),
                        ),
                        child: depositMethodWidgetCard(
                          ic: e.logo,
                          text: e.name,
                          color: e.color,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}