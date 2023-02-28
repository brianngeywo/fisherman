import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qashpal/backend/constants/constants.dart';
import 'package:qashpal/backend/models/account_transactions.dart';
import 'package:qashpal/bloc/account_transactions_tabs_bloc/account_transactions_tabs_bloc.dart';
import 'package:qashpal/frontend/account_transactions/withdrawal_history_screen.dart';
import 'package:qashpal/frontend/deposit_page/infor_card_widget.dart';
import 'package:qashpal/frontend/general_widgets/main.dart';
import 'package:qashpal/frontend/my_navigation_widgets/main_top_appbar.dart';

class AccountTransactionsPage extends StatelessWidget {
  final List<AccountTransactions>? transactions;

  const AccountTransactionsPage({super.key, required this.transactions});
  @override
  Widget build(BuildContext context) {
    // List<Widget> myToggleButtons = [
    //   const Padding(
    //     padding: EdgeInsets.all(12.0),
    //     child: Text(
    //       "Deposits",
    //       style: TextStyle(
    //         fontWeight: FontWeight.w400,
    //       ),
    //     ),
    //   ),
    //   const Padding(
    //     padding: EdgeInsets.all(12.0),
    //     child: Text(
    //       "Withdrawals",
    //       style: TextStyle(
    //         fontWeight: FontWeight.w400,
    //       ),
    //     ),
    //   ),
    // ];
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
              welcomeBackTextWidget(),
              inforNotificationCardWidget("Activation Balance:",
                  userProvider.user!.accountBalance.toStringAsFixed(2)),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Withdrawals summary",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
              ),
              // const Divider(height: 2),
              withdrawalsTab(transactions)
            ],
          );
        },
      ),
    );
  }
}