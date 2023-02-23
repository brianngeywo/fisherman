import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qashpal/backend/methods/verification_methods.dart';
import 'package:qashpal/bloc/form_actions_bloc/form_actions_bloc.dart';
import 'package:qashpal/bloc/passwords_viscibility_bloc'
    '/passwords_viscibility_bloc'
    '.dart';

Widget myTextFormField(
  String? text,
  String helperText,
  bool isPasswordField,
) {
  return Container(
    padding: const EdgeInsets.all(8.0),
    child: isPasswordField
        ? BlocBuilder<PasswordsVisibilityBloc, PasswordsVisibilityState>(
            builder: (context, state) {
              return TextFormField(
                obscureText: state.isPasswordVisible,
                validator: (value) => value!.isEmpty ? helperText : null,
                onSaved: (value) => text = value,
                onChanged: (value) => text = value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(232, 240, 254, 0.8),
                  helperText: helperText,
                  hintText: helperText,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      BlocProvider.of<PasswordsVisibilityBloc>(context)
                          .add(TogglePasswordVisibilityEvent());
                    },
                    child: Icon(
                      state.isPasswordVisible
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash,
                    ),
                  ),
                ),
              );
            },
          )
        : TextFormField(
            validator: (value) => value!.isEmpty ? helperText : null,
            onSaved: (value) => text = value,
            onChanged: (value) => text = value,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: const Color.fromRGBO(232, 240, 254, 0.8),
              helperText: helperText,
              hintText: helperText,
            ),
          ),
  );
}

Widget myPhoneNumberSendOTPTextFormField(
  String? phone,
) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      validator: (value) => value!.isEmpty && value.length <= 12
          ? "Enter Phone number starting with your country code"
          : null,
      onSaved: (value) => phone = value,
      onChanged: (value) => phone = value,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: const Color.fromRGBO(232, 240, 254, 0.8),
        helperText: "Enter Phone number",
        hintText: "Enter Phone number",
        suffix: GestureDetector(
          onTap: () async {
            VerificationMethods().sendSMSToPhone(
                phone!.startsWith("+254") ? phone! : "+254${phone!}");
          },
          child: const Text("Send Code"),
        ),
      ),
      keyboardType: TextInputType.number,
      initialValue: "+254",
    ),
  );
}