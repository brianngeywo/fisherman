import 'package:flutter/material.dart';
import 'package:qashpal/backend/constants/constants.dart';
import 'package:qashpal/frontend/constants.dart';
import 'package:qashpal/frontend/deposit_page/infor_card_widget.dart';
import 'package:qashpal/frontend/deposit_page/success_card_widget.dart';
import 'package:qashpal/frontend/my_navigation_widgets/main_top_appbar.dart';

class MpesaDepositInstructionsPage extends StatelessWidget {
  const MpesaDepositInstructionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBar(context,
          automaticallyImplyLeading: true, showUserIconDropdown: false),
      backgroundColor: mainPageBackgroundColor,
      bottomSheet: mainSubmitButton(
        text: "Continue",
        buttonColor: mainButtonsColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              // inforNotificationCardWidget("Activation Balance:",
              //     "KES ${userProvider.user!.accountBalance.toStringAsFixed(0)}"),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "How to activate your account (KENYA)",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(2.0),
                child: Divider(height: 1.7),
              ),
              successNotificationCardWidget(
                  "1. Ensure you use this number ${userProvider.user!.phoneNumber}"),
              successNotificationCardWidget(
                  "2. Mpesa Menu - Select LIPA NA MPESA"),
              successNotificationCardWidget("3. Buy Goods and Services"),
              successNotificationCardWidget(
                  "3. Till Number 516486 FULCRUM SERVICES"),
              successNotificationCardWidget("3. Deposit Kshs 450 and"),
            ],
          ),
        ),
      ),
    );
  }
}