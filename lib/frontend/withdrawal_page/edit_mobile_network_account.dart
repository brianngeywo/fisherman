import 'package:flutter/material.dart';
import 'package:qashpal/backend/models/mobile_network_model.dart';
import 'package:qashpal/backend/models/payment_provider.dart';
import 'package:qashpal/frontend/constants.dart';
import 'package:qashpal/frontend/general_widgets/main.dart';
import 'package:qashpal/frontend/my_navigation_widgets/main_top_appbar.dart';
import 'package:qashpal/frontend/withdrawal_page/widgets.dart';

class EditNetworkAccountPage extends StatefulWidget {
  final PaymentProvider provider;
  final MobileNetwork mobileNetwork;
  const EditNetworkAccountPage(
      {super.key, required this.provider, required this.mobileNetwork});

  @override
  State<EditNetworkAccountPage> createState() => _EditNetworkAccountPageState();
}

class _EditNetworkAccountPageState extends State<EditNetworkAccountPage> {
  String nickname = "";

  String phone = "";

  String name1 = "";

  String name2 = "";
  @override
  void initState() {
    // TODO: implement initState
    nickname = widget.mobileNetwork.nickName;

    phone = widget.mobileNetwork.phoneNumber;

    name1 = widget.mobileNetwork.firstName;

    name2 = widget.mobileNetwork.lastName;
    super.initState();
  }

  final addNetworkFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainPageBackgroundColor,
      appBar: topAppBar(
        context,
        automaticallyImplyLeading: true,
        showUserIconDropdown: false,
      ),
      bottomSheet: mainSubmitButton(
        text: 'Save',
        // buttonColor: mainButtonsColor,
        myFunc: (() {
          addNetworkFormKey.currentState!.save();
        }),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: addNetworkFormKey,
            child: ListView(
              children: [
                const Text(
                  "Edit account",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  widget.provider.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: widget.provider.color,
                  ),
                ),
                Text(
                  "Enter your ${widget.provider.name} account "
                  "details below to cash out",
                  style: const TextStyle(
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 10),
                editNetworkAccountTextFormField(
                    text: nickname, hintText: "Account nickname"),
                editNetworkAccountTextFormField(
                    text: phone, hintText: "Phone Number"),
                editNetworkAccountTextFormField(
                    text: name1, hintText: "First name"),
                editNetworkAccountTextFormField(
                    text: name2, hintText: "Last name"),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}