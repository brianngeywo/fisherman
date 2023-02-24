import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qashpal/backend/constants/constants.dart';
import 'package:qashpal/backend/methods/transactions_methods.dart';
import 'package:qashpal/backend/methods/user_functions.dart';
import 'package:qashpal/frontend/constants.dart';
import 'package:qashpal/frontend/personal_profile/widgets.dart';
import 'package:qashpal/frontend/success_snackbar.dart';

class ProfilePageScreen extends StatelessWidget {
  const ProfilePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: ListView(
          children: [
            mainProfilePageTopWidget(context),
            GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(
                    text:
                        "https://www.qashpal.co.ke/${userProvider.user!.id}/invite"));

                ScaffoldMessenger.of(context).showSnackBar(
                    snackBar("Referral link copied!", Colors.lightGreen));
              },
              child: Container(
                height: 50,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromRGBO(49, 47, 111, 1),
                  Color.fromRGBO(190, 80, 129, 1),
                ])),
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Copy referral link",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Icon(
                      FontAwesomeIcons.chevronRight,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            accountRows("Account Balance:",
                "KES ${userProvider.user!.accountBalance.toStringAsFixed(0)}"),
            const Divider(thickness: 1),
            accountRows("Phone:", userProvider.user!.phoneNumber),
            const Divider(thickness: 1),
            accountRows("Network:", userProvider.user!.carrierNetwork),
            const Divider(thickness: 1),
            accountRows("Account Status:",
                userProvider.user!.userActivated ? "Activated" : "Deactivated"),
            const Divider(thickness: 1),
            accountRows("Account ID:", userProvider.user!.id),
            const Divider(thickness: 1),
            TextButton.icon(
              onPressed: () {
                // UserMethods().addThisUser();
                TransactionMethods()
                    .uploadRandomTransactionsToFirestore(randomTransactions);
                UserMethods().addRandomUsersToFirebase(randomUsers);
                showDialog(
                  context: context,
                  builder: (context) {
                    return myProfilePageDialog(
                        mainPageBackgroundColor, context);
                  },
                );
              },
              label: const Text("Talk to Customer Support"),
              icon: const FaIcon(FontAwesomeIcons.userTie),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: backButton(
                context,
                (() => Navigator.of(context).pop()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}