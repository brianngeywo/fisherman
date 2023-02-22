import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qashpal/backend/methods/transactions_methods.dart';
import 'package:qashpal/backend/methods/user_functions.dart';
import 'package:qashpal/frontend/constants.dart';
import 'package:qashpal/frontend/personal_profile/widgets.dart';

import '../../backend/constants.dart';

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
            accountRows("Account Balance:",
                "KES ${userProvider.user!.accountBalance.toStringAsFixed(2)}"),
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