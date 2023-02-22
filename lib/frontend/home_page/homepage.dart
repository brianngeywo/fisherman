import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qashpal/bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:qashpal/bloc/welcome_screen_navigation_bloc/welcome_screen_navigation_bloc.dart';
import 'package:qashpal/frontend/account_transactions/main.dart';
import 'package:qashpal/frontend/account_transactions/main_account_transactions_page.dart';
import 'package:qashpal/frontend/constants.dart';
import 'package:qashpal/frontend/deposit_page/deposit_screen.dart';
import 'package:qashpal/frontend/home_page/homescreen.dart';
import 'package:qashpal/frontend/home_page/widgets.dart';
import 'package:qashpal/frontend/list_of_downlines_page/list_of_downlines_screen.dart';
import 'package:qashpal/frontend/my_navigation_widgets/main_bottom_navigation_bar.dart';
import 'package:qashpal/frontend/my_navigation_widgets/main_top_appbar.dart';
import 'package:qashpal/frontend/my_navigation_widgets/top_app_bar_dropdown_list_textbuttons.dart';
import 'package:qashpal/frontend/personal_profile/main_profile_page.dart';
import 'package:qashpal/frontend/share_link_to_profile_page/share_link_profile_screen.dart';
import 'package:qashpal/frontend/welcome_page/main.dart';
import 'package:qashpal/frontend/withdrawal_page/withdrawals_screen.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerItems = [
      drawerHeader(),
      ListTile(
        leading: const FaIcon(
          FontAwesomeIcons.userLarge,
          size: 16,
        ),
        title: Text(
          "My Account",
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 16,
          ),
        ),
        onTap: () => navigatorKey.currentState?.push(
          MaterialPageRoute(builder: (context) => const MainProfilePage()),
        ),
        iconColor: const Color.fromARGB(206, 51, 94, 178),
      ),
      topAppBarDropDownListTextButton(
        context,
        FontAwesomeIcons.house,
        0,
        "Dashboard",
      ),
      topAppBarDropDownListTextButton(
        context,
        FontAwesomeIcons.moneyBill1Wave,
        1,
        "Deposit funds",
      ),
      topAppBarDropDownListTextButton(
        context,
        FontAwesomeIcons.handHoldingDollar,
        2,
        "Request withdrawal",
      ),
      topAppBarDropDownListTextButton(
        context,
        FontAwesomeIcons.listCheck,
        3,
        "Activations",
      ),
      topAppBarDropDownListTextButton(
        context,
        FontAwesomeIcons.link,
        4,
        "Referral link",
      ),
      topAppBarDropDownListTileButtonWidget(
        FontAwesomeIcons.arrowRightArrowLeft,
        "Transactions Summary",
        (() => navigatorKey.currentState?.push(MaterialPageRoute(
            builder: (context) => const MainAccountTransactionsPage()))),
      ),
      topAppBarDropDownListTileButtonWidget(
        FontAwesomeIcons.arrowRightFromBracket,
        "Sign Out",
        (() {
          // await FirebaseAuth.instance
          //     .signOut();

          BlocProvider.of<WelcomeScreenNavigationBloc>(context)
              .add(NavigateToSignInScreenEvent());

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MainWelcomePage()));
        }),
      ),
    ];
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(232, 240, 254, 0.8),

      appBar: topAppBar(context,
          automaticallyImplyLeading: false, showUserIconDropdown: true),
      bottomNavigationBar: bottomNavigationBar(context),
      endDrawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 1, 13, 39),
        elevation: 16.0,
        width: MediaQuery.of(context).size.width * 0.75,
        child: ListView(
          padding: EdgeInsets.zero,
          children: drawerItems,
        ),
      ),
      body: Container(
        color: mainPageBackgroundColor,
        child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case OnHomepageState:
                return homeScreen();
              case OnWithdrawalsListPageState:
                return withdrawalsScreen();
              case OnDepositPageState:
                return depositScreen();
              case OnDownLinesListPageState:
                return listOfDownLinesScreen(context);
              case OnShareAndInvitesPageState:
                return shareLinkToProfileScreen(context);
              default:
                return homeScreen();
            }
          },
        ),
      ),
    );
  }
}