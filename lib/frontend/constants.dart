import 'dart:core';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

int pageIndex = 0;
Color mainPageBackgroundColor = const Color.fromRGBO(232, 240, 254, 1);
Color accountTransactionsTabTextColor = Colors.black;
GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
final CurvedNavigationBarState? navBarState = bottomNavigationKey.currentState;
Color mainButtonsColor = const Color.fromARGB(255, 1, 13, 39);
Color logoColor = const Color.fromARGB(206, 51, 94, 178);
final navigatorKey = GlobalKey<NavigatorState>();
const String mpesaImage = "assets/images/mpesa.svg";