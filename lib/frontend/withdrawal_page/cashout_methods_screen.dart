import 'package:flutter/material.dart';
import 'package:qashpal/backend/constants/constants.dart';
import 'package:qashpal/backend/constants/payment_providers.dart';
import 'package:qashpal/frontend/constants.dart';
import 'package:qashpal/frontend/my_navigation_widgets/main_top_appbar.dart';
import 'package:qashpal/frontend/withdrawal_page/add_payment_method_screen.dart';
import 'package:qashpal/frontend/withdrawal_page/widgets.dart';

class CashoutMethodsScreen extends StatefulWidget {
  CashoutMethodsScreen({Key? key}) : super(key: key);

  @override
  State<CashoutMethodsScreen> createState() => _CashoutMethodsScreenState();
}

class _CashoutMethodsScreenState extends State<CashoutMethodsScreen> {
  int? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBar(context,
          automaticallyImplyLeading: true, showUserIconDropdown: false),
      backgroundColor: mainPageBackgroundColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "balance: KSH ${userProvider.user!.accountBalance.toStringAsFixed(0)}"
                      .toUpperCase(),
                  style: TextStyle(
                    fontSize: 25,
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
              Column(
                  children: List.generate(
                paymentProviders.length,
                (index) => GestureDetector(
                  onTap: () {
                    print(index);
                    setState(() {});
                    navigatorKey.currentState?.push(
                      MaterialPageRoute(
                        builder: (cotext) => AddPaymentOptionPage(
                          provider: paymentProviders[index],
                        ),
                      ),
                    );
                  },
                  child: cashoutMethodWidgetCard(
                      ic: paymentProviders[index].logo,
                      text1: paymentProviders[index].name,
                      index == paymentProviders[index]
                          ? paymentProviders[index].color
                          : Colors.white),
                ),
              )
                  // )
                  // paymentProviders
                  //     .map(
                  //       (e) => GestureDetector(
                  //         onTap: () => navigatorKey.currentState?.push(
                  //           MaterialPageRoute(
                  //             builder: (cotext) => AddPaymentOptionPage(
                  //               provider: e,
                  //             ),
                  //           ),
                  //         ),
                  //         child: cashoutMethodWidgetCard(e.logo, e.name),
                  //       ),
                  //     )
                  //     .toList(),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}