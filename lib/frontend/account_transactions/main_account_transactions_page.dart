import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qashpal/backend/constants.dart';
import 'package:qashpal/backend/methods/user_functions.dart';
import 'package:qashpal/bloc/account_transactions_tabs_bloc/account_transactions_tabs_bloc.dart';
import 'package:qashpal/frontend/account_transactions/deposit_history_screen.dart';
import 'package:qashpal/frontend/account_transactions/withdrawal_history_screen.dart';
import 'package:qashpal/frontend/deposit_page/infor_card_widget.dart';
import 'package:qashpal/frontend/my_navigation_widgets/main_top_appbar.dart';

class AccountTransactionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> myToggleButtons = [
      const Padding(
        padding: EdgeInsets.all(12.0),
        child: Text(
          "Deposits",
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(12.0),
        child: Text(
          "Withdrawals",
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ];
    return Scaffold(
      appBar: topAppBar(context,
          automaticallyImplyLeading: true, showUserIconDropdown: false),
      body: BlocBuilder<AccountTransactionsTabsBloc,
          AccountTransactionsTabsState>(
        builder: (context, state) {
          return ListView(
            children: [
              // Align(
              //   alignment: Alignment.bottomLeft,
              //   child: TextButton.icon(
              //     onPressed: () => Navigator.of(context).pop(),
              //     icon: const FaIcon(
              //       FontAwesomeIcons.chevronLeft,
              //       color: Colors.black,
              //     ),
              //     label: const Text(
              //       "Go Back",
              //       style: TextStyle(
              //         color: Colors.black,
              //       ),
              //     ),
              //   ),
              // ),
              // const Divider(height: 2),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Welcome back ${userProvider.user!.id}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
              inforNotificationCardWidget("Activation Balance:",
                  userProvider.user!.accountBalance.toStringAsFixed(2)),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Transactions summary",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
              ),
              // const Divider(height: 2),
              withdrawalsTab(withdrawalsList)
            ],
          );
        },
      ),
    );
  }
}