import 'package:flutter/material.dart';
import 'package:qashpal/backend/constants/constants.dart';
import 'package:qashpal/frontend/general_widgets/main.dart';
import 'package:qashpal/frontend/share_link_to_profile_page/widgets.dart';

Widget shareLinkToProfileScreen(BuildContext context) {
  TextEditingController controller = TextEditingController(
      text: "https://www.qashpal.co.ke/${userProvider.user!.id}/invite");
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          welcomeBackTextWidget(),
          const Divider(height: 2),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Copy link to your profile",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
          ),
          deactivatedLinkField(controller),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: copyLinkButtonWidget(controller, context),
          ),
        ],
      ),
    ),
  );
}