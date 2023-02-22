import 'package:flutter/material.dart';
import 'package:qashpal/frontend/constants.dart';
import 'package:qashpal/frontend/general_widgets/main.dart';
import 'package:qashpal/frontend/my_navigation_widgets/main_top_appbar.dart';
import 'package:qashpal/frontend/withdrawal_page/add_mobile_network_account.dart';
import 'package:qashpal/frontend/withdrawal_page/widgets.dart';

class AddPaymentOptionPage extends StatefulWidget {
  final String networkName;
  const AddPaymentOptionPage({Key? key, required this.networkName})
      : super(key: key);

  @override
  State<AddPaymentOptionPage> createState() => _AddPaymentOptionPageState();
}

class _AddPaymentOptionPageState extends State<AddPaymentOptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBar(context,
          automaticallyImplyLeading: true, showUserIconDropdown: false),
      bottomSheet: Container(
        padding: const EdgeInsets.all(8.0),
        child: mainSubmitButton(
          text: "Next",
          buttonColor: mainButtonsColor,
          myFunc: (() {
            // if (_withdrawalScreenFormKey.currentState!.validate()) {
            //   _withdrawalScreenFormKey.currentState!.save();
            //   print(text);
            // }
          }),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.networkName,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Balance KSH 5.00",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LinearProgressIndicator(
                  backgroundColor: mainPageBackgroundColor,
                  value: 0.3,
                  minHeight: 7,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select account",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Edit",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: logoColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    selectPaymentOtionRadioListTile(
                        "Mpesa account 1", "0798767470"),
                    selectPaymentOtionRadioListTile(
                        "Mpesa account 2", "0714721937"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: mainButtonsColor,
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      navigatorKey.currentState!.push(MaterialPageRoute(
                          builder: (cotext) => AddNewNetworkAccountPage(
                                networkName: 'Safaricom',
                                mobileMoneyAgent: 'Mpesa',
                              )));
                      print("object");
                    },
                    child: Text(
                      "Add account",
                      style: TextStyle(
                        color: mainButtonsColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}