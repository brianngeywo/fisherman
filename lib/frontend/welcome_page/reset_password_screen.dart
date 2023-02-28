import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qashpal/backend/methods/verification_methods.dart';
import 'package:qashpal/bloc/verification_errors_bloc/verification_errors_bloc.dart';
import 'package:qashpal/bloc/welcome_screen_navigation_bloc/welcome_screen_navigation_bloc.dart';
import 'package:qashpal/frontend/constants.dart';
import 'package:qashpal/frontend/welcome_page/widgets.dart';

class ResetPasswordScreen extends StatelessWidget {
  final _passowordResetFormKey = GlobalKey<FormState>();
  String? _phone, _smsCode, _password, _password2;

  ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerificationErrorsBloc, VerificationErrorsState>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case VerificationDifferentPasswordsErrorState:
            Future.delayed(
              Duration.zero,
              () => showAlert(
                context,
                "The passwords are not similar,\nmake sure to repeat same password \navoid blank spaces between or after the password",
              ),
            );
            break;
          case VerificationShortPasswordErrorState:
            Future.delayed(
                Duration.zero,
                () => showAlert(context,
                    "The password should be more than six characters in length \n e.g. pass100"));
            break;
          case VerificationWrongPhoneNumberFormatErrorState:
            Future.delayed(
                Duration.zero,
                () => showAlert(context,
                    "The phone number must be written in international format \n e.g. +254712345678"));
            break;
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(4.0),
              child: const Text("Account Recovery"),
            ),
            Form(
              key: _passowordResetFormKey,
              child: Column(
                children: [
                  myPhoneNumberSendOTPTextFormField(_phone),
                  myTextFormField(_password, "Enter new password", true),
                  myTextFormField(_password2, "Enter new password again", true),
                  myTextFormField(_smsCode, "Enter Code", false)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: MaterialButton(
                minWidth: double.infinity,
                color: const Color.fromARGB(255, 1, 13, 39),
                textColor: Colors.white,
                onPressed: () async {
                  if (_passowordResetFormKey.currentState!.validate()) {
                    _passowordResetFormKey.currentState!.save();
                    BlocProvider.of<VerificationErrorsBloc>(context)
                        .add(CheckVerificationErrorsEvent(
                      password1: _password!,
                      password2: _password2!,
                      phoneNumber: _phone!,
                    ));
                    VerificationMethods()
                        .authenticatePhone(_smsCode, _phone, _password);
                  }
                  BlocProvider.of<WelcomeScreenNavigationBloc>(context)
                      .add(NavigateToSignInScreenEvent());
                  if (_passowordResetFormKey.currentState!.validate()) {
                    _passowordResetFormKey.currentState!.save();
                    VerificationMethods()
                        .authenticatePhone(_smsCode!, _phone!, _password!);
                  }
                },
                child: const Text("Proceed to login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}