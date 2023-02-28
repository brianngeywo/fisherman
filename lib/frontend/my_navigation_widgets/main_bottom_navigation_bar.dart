import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qashpal/bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:qashpal/frontend/constants.dart';
import 'package:qashpal/frontend/my_navigation_widgets/main_bottom_navigation_bar_icon_button.dart';

Widget bottomNavigationBar(BuildContext context) {
  return CurvedNavigationBar(
    key: bottomNavigationKey,
    animationDuration: const Duration(milliseconds: 200),
    height: 60,
    backgroundColor: const Color.fromARGB(206, 51, 94, 178),
    buttonBackgroundColor: Colors.white,
    color: const Color.fromRGBO(232, 240, 254, 1),
    items: <Widget>[
      mainBottomNavigationBarItmIconButton(FontAwesomeIcons.house),
      mainBottomNavigationBarItmIconButton(FontAwesomeIcons.moneyBillWave),
      mainBottomNavigationBarItmIconButton(FontAwesomeIcons.buildingColumns),
      mainBottomNavigationBarItmIconButton(FontAwesomeIcons.listCheck),
      // mainBottomNavigationBarItmIconButton(FontAwesomeIcons.share),
    ],
    onTap: (index) {
      switch (index) {
        case 0:
          BlocProvider.of<BottomNavigationBloc>(context).add(
            NavigateToHomePageEvent(index),
          );
          break;
        case 1:
          BlocProvider.of<BottomNavigationBloc>(context).add(
            NavigateToDepositPageEvent(index),
          );
          break;
        case 2:
          BlocProvider.of<BottomNavigationBloc>(context)
              .add(NavigateToWithdrawalsListPageEvent(index));
          break;
        case 3:
          BlocProvider.of<BottomNavigationBloc>(context)
              .add(NavigateToDownLinesListPageEvent(index));
          break;
        // case 4:
        //   BlocProvider.of<BottomNavigationBloc>(context)
        //       .add(NavigateToShareAndInvitesPageEvent(index));
        //   break;
      }
    },
    letIndexChange: (index) => true,
  );
}