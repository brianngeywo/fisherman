import 'package:flutter/material.dart';
import 'package:qashpal/backend/constants.dart';
import 'package:qashpal/backend/methods/user_functions.dart';
import 'package:qashpal/frontend/constants.dart';
import 'package:qashpal/frontend/deposit_page/infor_card_widget.dart';
import 'package:qashpal/frontend/deposit_page/success_card_widget.dart';
import 'package:qashpal/frontend/general_widgets/main.dart';

Widget depositScreen() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          welcomeBackTextWidget(),
        ],
      ),
    ),
  );
}