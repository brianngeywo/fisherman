import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qashpal/backend/constants/constants.dart';
import 'package:qashpal/backend/methods/user_functions.dart';
import 'package:qashpal/frontend/constants.dart';
import 'package:qashpal/frontend/success_snackbar.dart';

SizedBox drawerHeader() {
  return SizedBox(
    height: 140,
    child: Center(
      child: DrawerHeader(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color.fromRGBO(37, 145, 251, 0.98),
              Color.fromRGBO(0, 7, 128, 1),
              Color.fromARGB(255, 1, 13, 39),
            ],
            center: Alignment.bottomRight,
            radius: 1.618,
          ),
        ),
        padding: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 8,
                  right: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.solidUserCircle,
                      size: 37.0,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Account ID: ${userProvider.user!.id}",
                            style: const TextStyle(
                              // fontSize: 17.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 7),
                          Text(
                            userProvider.user!.userActivated
                                ? "Account active"
                                : "Account not active!",
                            style: const TextStyle(
                              // fontSize: 17.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '"The future is what we make it!"- Elon Musk',
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget homepageEarningsWidgetCard(BuildContext context) {
  return Card(
    elevation: 5,
    margin: EdgeInsets.all(10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color.fromRGBO(10, 67, 128, 1),
        // gradient: RadialGradient(
        //   colors: [
        //     const Color.fromRGBO(107, 145, 251, 1),
        //     const Color.fromRGBO(10, 67, 128, 1),
        //   ],
        //   center: Alignment.bottomRight,
        //   radius: 1.618,
        // ),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My earnings".toUpperCase(),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    "total KES ${userProvider.user!.totalWithdrawals.toStringAsFixed(0)}"
                        .toUpperCase(),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 7),
                ],
              ),
              TextButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(
                      text:
                          "https://www.qashpal.co.ke/${userProvider.user!.id}/invite"));

                  ScaffoldMessenger.of(context).showSnackBar(
                      snackBar("Referral link copied!", Colors.lightGreen));
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "Copy referral link",
                    style: TextStyle(
                      color: mainButtonsColor,
                      fontSize: 17,
                    ),
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
          Text(
            "KES ${userProvider.user!.accountBalance.toStringAsFixed(0)}"
                .toUpperCase(),
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
          ),
          SizedBox(height: 7),
          LinearProgressIndicator(
            backgroundColor:
                userProvider.user!.accountBalance <= minimumAmountToWithdraw
                    ? mainPageBackgroundColor
                    : Colors.green,
            value: calculateLinearIndicator(),
          ),
          SizedBox(height: 15),
          Text(
            userProvider.user!.accountBalance <= minimumAmountToWithdraw
                ? "Earn KES ${(minimumAmountToWithdraw - userProvider.user!.accountBalance).toStringAsFixed(0)} more to cash out"
                : "",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}

double calculateLinearIndicator() {
  double balance = minimumAmountToWithdraw - userProvider.user!.accountBalance;
  double level = userProvider.user!.accountBalance / minimumAmountToWithdraw;
  return level;
}