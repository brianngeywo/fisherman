import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qashpal/backend/constants.dart';
import 'package:qashpal/backend/methods/transactions_methods.dart';
import 'package:qashpal/bloc/connectivity_bloc/connectivity_bloc.dart';
import 'package:qashpal/connectivity_lost_page.dart';
import 'package:qashpal/frontend/account_transactions/main_account_transactions_page.dart';

class MainAccountTransactionsPage extends StatelessWidget {
  const MainAccountTransactionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionMethods().retrieveUserTransactions(userProvider.user!.id);
    return BlocConsumer<ConnectivityBloc, bool>(
      listener: (context, state) {
        if (state) {
          Navigator.of(context).pop;
        }
      },
      builder: (context, isConnected) {
        if (isConnected) {
          return AccountTransactionsPage();
        } else {
          return const ConnectivityLostPage();
        }
      },
    );
  }
}