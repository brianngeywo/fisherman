import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qashpal/backend/constants/constants.dart';
import 'package:qashpal/bloc/account_transactions_tabs_bloc'
    '/account_transactions_tabs_bloc.dart';
import 'package:qashpal/bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:qashpal/bloc/connectivity_bloc/connectivity_bloc.dart';
import 'package:qashpal/bloc/passwords_viscibility_bloc'
    '/passwords_viscibility_bloc.dart';
import 'package:qashpal/bloc/verification_errors_bloc/verification_errors_bloc.dart';
import 'package:qashpal/connectivity_lost_page.dart';
import 'package:qashpal/frontend/constants.dart';
import 'package:qashpal/frontend/welcome_page/main.dart';
import 'package:qashpal/bloc/welcome_screen_navigation_bloc'
    '/welcome_screen_navigation_bloc.dart';
import 'bloc/form_actions_bloc/form_actions_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await userProvider.getUserFromFirestore('1234567');
  await transactionsProvider.retrieveUserWithdrawalsTransactions('1234567');
  await transactionsProvider.retrieveUserDepositTransactions('1234567');
  await referralprovider.getReferrals("1234567");
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavigationBloc>(
            create: (context) =>
                BottomNavigationBloc(WelcomeScreenNavigationBloc())),
        BlocProvider<FormActionsBloc>(create: (context) => FormActionsBloc()),
        BlocProvider<AccountTransactionsTabsBloc>(
            create: (context) => AccountTransactionsTabsBloc()),
        BlocProvider<WelcomeScreenNavigationBloc>(
            create: (context) => WelcomeScreenNavigationBloc()),
        BlocProvider<VerificationErrorsBloc>(
            create: (context) => VerificationErrorsBloc()),
        BlocProvider<FormActionsBloc>(create: (context) => FormActionsBloc()),
        BlocProvider<PasswordsVisibilityBloc>(
            create: (context) => PasswordsVisibilityBloc()),
        BlocProvider<ConnectivityBloc>(create: (context) => ConnectivityBloc()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: const Color.fromARGB(255, 1, 13, 39),
        // primaryColor: const Color.fromRGBO(71, 11, 75, 1),
        // backgroundColor: const Color.fromRGBO(240, 240, 250, 1),
      ),
      home: BlocConsumer<ConnectivityBloc, bool>(
        listener: (context, state) {
          if (state) {
            Navigator.of(context).pop;
          }
        },
        builder: (context, isConnected) {
          if (isConnected) {
            return const MainWelcomePage();
          } else {
            return const ConnectivityLostPage();
          }
        },
      ),
    );
  }
}