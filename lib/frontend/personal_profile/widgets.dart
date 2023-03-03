import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qashpal/backend/constants/constants.dart';

Widget mainProfilePageTopWidget(
  BuildContext context,
) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.18,
    // margin: const EdgeInsets.only(bottom: 8),
    decoration: const BoxDecoration(
      gradient: RadialGradient(
        colors: [
          // Color.fromRGBO(0, 7, 128, 1),
          Color.fromARGB(130, 1, 13, 25),
          Color.fromRGBO(37, 145, 251, 01),
        ],
        center: Alignment.bottomRight,
        radius: 3.5,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Center(
            child: Icon(
              FontAwesomeIcons.solidCircleUser,
              size: 75,
              color: Colors.white,
            ),
            // CircleAvatar(
            //   backgroundImage: NetworkImage(userProvider.user!.photoUrl),
            //   radius: 37.5,
            // ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              left: 12,
              right: 8,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "Welcome back ${userProvider.user?.id}",
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    userProvider.user!.phoneNumber,
                    style: const TextStyle(
                      // fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "Balance: ${userProvider.user!.accountBalance.toStringAsFixed(0)}",
                    style: const TextStyle(
                      // fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget backButton(BuildContext context, Function navigationFunction) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: TextButton.icon(
      onPressed: () => Navigator.of(context).pop(),
      icon: const FaIcon(
        FontAwesomeIcons.chevronLeft,
        color: Colors.white,
      ),
      label: const Text(
        "Bo Back",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color.fromARGB(255, 1, 13, 25),
        ),
      ),
    ),
  );
}

Widget accountRows(String title, String subTitle) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(subTitle),
      ],
    ),
  );
}

Widget myProfilePageDialog(Color backColor, BuildContext context) {
  return Dialog(
    backgroundColor: backColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    // color: mainPageBackgroundColor,
    elevation: 10,
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.20,
      width: MediaQuery.of(context).size.width - 20,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                """Kindly send a message with the details to the below email. \nMake sure to include your account id in the email""",
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "qashpalsupport@gmail.com",
                style: TextStyle(
                  color: Color.fromARGB(255, 1, 13, 39),
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}