import 'package:flutter/material.dart';
import 'package:qashpal/backend/constants/constants.dart';
import 'package:qashpal/backend/methods/general_functions.dart';
import 'package:qashpal/backend/models/mobile_network_model.dart';
import 'package:qashpal/backend/models/payment_provider.dart';
import 'package:qashpal/frontend/constants.dart';
import 'package:qashpal/frontend/my_navigation_widgets/main_top_appbar.dart';
import 'package:qashpal/frontend/withdrawal_page/add_mobile_network_account.dart';
import 'package:qashpal/frontend/withdrawal_page/edit_mobile_network_account.dart';
import 'package:qashpal/frontend/withdrawal_page/widgets.dart';

class AddPaymentOptionPage extends StatefulWidget {
  final PaymentProvider provider;
  const AddPaymentOptionPage({Key? key, required this.provider})
      : super(key: key);

  @override
  State<AddPaymentOptionPage> createState() => _AddPaymentOptionPageState();
}

class _AddPaymentOptionPageState extends State<AddPaymentOptionPage> {
  MobileNetwork net =
      MobileNetwork(nickName: "", phoneNumber: "", firstName: "", lastName: "");
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainPageBackgroundColor,
      appBar: topAppBar(context,
          automaticallyImplyLeading: true, showUserIconDropdown: false),
      bottomSheet: mainSubmitButton(
        text: "Next",
        // buttonColor: mainButtonsColor,
        myFunc: (() {
          // if (_withdrawalScreenFormKey.currentState!.validate()) {
          //   _withdrawalScreenFormKey.currentState!.save();
          //   print(text);
          // }
        }),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.provider.name,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: widget.provider.color,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Balance KSH ${userProvider.user!.accountBalance.toStringAsFixed(0)}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: mainButtonsColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LinearProgressIndicator(
                  backgroundColor: mainPageBackgroundColor,
                  value: GeneralFunctions().calculateLinearIndicator(),
                  minHeight: 7,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Select account",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        navigatorKey.currentState!.push(MaterialPageRoute(
                            builder: (context) => EditNetworkAccountPage(
                                provider: widget.provider,
                                mobileNetwork: net)));
                      },
                      child: Text(
                        "Edit Selected Account",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: logoColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    children: List.generate(
                  nets.length,
                  (index) {
                    return Card(
                      elevation: 5,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      margin: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 110,
                        child: Center(
                          child: RadioListTile<int>(
                            toggleable: true,
                            value: index,
                            groupValue: _selectedIndex,
                            onChanged: (value) {
                              setState(() {
                                _selectedIndex = value!;
                                net = nets[value];
                              });
                            },
                            activeColor: const Color.fromARGB(206, 51, 94, 178),
                            title: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                nets[index].nickName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.call,
                                    size: 18,
                                    color: widget.provider.color,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    nets[index].phoneNumber,
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: widget.provider.color,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
                    // selectPaymentOtionRadioListTile(
                    //       title: "${widget.provider.name} account 1",
                    //       number: "0798767470",
                    //       subTitleColor: widget.provider.color),

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
                                provider: widget.provider,
                              )));
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
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}