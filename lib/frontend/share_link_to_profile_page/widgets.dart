import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qashpal/frontend/success_snackbar.dart';

Widget deactivatedLinkField(TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      controller: controller,
      readOnly: true,
      // enabled: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        // fillColor: const Color.fromRGBO(232, 240, 254, 0.8),
        helperText: 'Share your link to earn more!',
        labelText: 'invite link',
        labelStyle: const TextStyle(
          color: Color.fromARGB(206, 51, 94, 178),
        ),
        prefixIcon: const Icon(
          FontAwesomeIcons.link,
          color: Colors.black,
        ),
      ),
    ),
  );
}

Widget copyLinkButtonWidget(
    TextEditingController controller, BuildContext context) {
  return MaterialButton(
    onPressed: () {
      Clipboard.setData(ClipboardData(text: controller.text));

      ScaffoldMessenger.of(context)
          .showSnackBar(snackBar("Link copied!", Colors.lightGreen));
    },
    color: const Color.fromARGB(255, 1, 13, 39),
    textColor: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            FontAwesomeIcons.solidPaste,
            color: Colors.white,
            size: 16,
          ),
          SizedBox(width: 6),
          Text(
            "Copy Link",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    ),
  );
}