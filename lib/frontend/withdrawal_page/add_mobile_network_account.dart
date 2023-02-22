import 'package:flutter/material.dart';
import 'package:qashpal/backend/constants.dart';
import 'package:qashpal/backend/models/mobile_network_model.dart';
import 'package:qashpal/frontend/constants.dart';
import 'package:qashpal/frontend/general_widgets/main.dart';
import 'package:qashpal/frontend/my_navigation_widgets/main_top_appbar.dart';
import 'package:qashpal/frontend/withdrawal_page/widgets.dart';

class AddNewNetworkAccountPage extends StatefulWidget {
  final String networkName;
  final String mobileMoneyAgent;
  AddNewNetworkAccountPage(
      {super.key, required this.networkName, required this.mobileMoneyAgent});

  @override
  State<AddNewNetworkAccountPage> createState() =>
      _AddNewNetworkAccountPageState();
}

class _AddNewNetworkAccountPageState extends State<AddNewNetworkAccountPage> {
  String nickname = "";

  String phone = "";

  String name1 = "";

  String name2 = "";

  final addNetworkFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBar(
        context,
        automaticallyImplyLeading: true,
        showUserIconDropdown: false,
      ),
      bottomSheet: mainSubmitButton(
        text: 'Save',
        buttonColor: mainButtonsColor,
        myFunc: (() {
          addNetworkFormKey.currentState!.save();
          print(name2);
        }),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: addNetworkFormKey,
            child: ListView(
              children: [
                Text(
                  "Add account",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  widget.networkName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.green,
                  ),
                ),
                Text(
                  "Enter your ${widget.networkName} ${widget.mobileMoneyAgent} Kenya account "
                  "details below to cash out",
                  style: TextStyle(
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 10),
                withdrawTextFormField(
                    text: nickname,
                    hintText: "Account "
                        "nickname"),
                withdrawTextFormField(text: phone, hintText: "phone number"),
                withdrawTextFormField(text: name1, hintText: "first name"),
                withdrawTextFormField(text: name2, hintText: "last name"),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}