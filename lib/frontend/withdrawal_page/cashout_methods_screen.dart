import 'package:flutter/material.dart';
import 'package:qashpal/frontend/constants.dart';
import 'package:qashpal/frontend/my_navigation_widgets/main_top_appbar.dart';
import 'package:qashpal/frontend/withdrawal_page/add_payment_method_screen.dart';
import 'package:qashpal/frontend/withdrawal_page/widgets.dart';

class CashoutMethodsScreen extends StatelessWidget {
  const CashoutMethodsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBar(context,
          automaticallyImplyLeading: true, showUserIconDropdown: false),
      backgroundColor: mainPageBackgroundColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "KSH 5.00",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(206, 51, 94, 178),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Select payment method",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    // color: Colors.amber,
                  ),
                ),
              ),
              cashoutMethodWidgetCard(Icons.phone_android, "Airtel Money"),
              GestureDetector(
                onTap: () => navigatorKey.currentState?.push(
                  MaterialPageRoute(
                    builder: (cotext) => AddPaymentOptionPage(
                      networkName: "Safaricom Mpesa",
                    ),
                  ),
                ),
                child: cashoutMethodWidgetCard(
                  Icons.phone_iphone,
                  "Safaricom Mpesa",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}