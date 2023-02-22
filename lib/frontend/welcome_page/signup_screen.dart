import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qashpal/backend/verification_methods.dart';
import 'package:qashpal/bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:qashpal/bloc/verification_errors_bloc/verification_errors_bloc.dart';
import 'package:qashpal/bloc/welcome_screen_navigation_bloc/welcome_screen_navigation_bloc.dart';
import 'package:qashpal/frontend/constants.dart';
import 'package:qashpal/frontend/home_page/homepage.dart';
import 'package:qashpal/frontend/home_page/main.dart';
import 'package:qashpal/frontend/success_snackbar.dart';
import 'package:qashpal/frontend/welcome_page/widgets.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _signUpFormKey = GlobalKey<FormState>();

  String? _password, _password2, _phone, _smsCode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
            const Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Your success in affiliate marketing \n starts here!",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 1, 13, 39),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // Divider(),
            Container(
              margin: const EdgeInsets.all(3.0),
              child: const Text("Register with Phone number"),
            ),
            // const Divider(),
            Form(
              key: _signUpFormKey,
              child: Column(
                children: [
                  myPhoneNumberSendOTPTextFormField(_phone),
                  myTextFormField(_password, "Enter new password", true),
                  myTextFormField(_password2, "Enter password again", true),
                  myTextFormField(_smsCode, "Enter verification code", false)
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: MaterialButton(
                minWidth: double.infinity,
                color: mainButtonsColor,
                textColor: Colors.white,
                onPressed: () async {
                  print(_smsCode);
                  if (_signUpFormKey.currentState!.validate()) {
                    _signUpFormKey.currentState!.save();
                    BlocProvider.of<VerificationErrorsBloc>(context)
                        .add(CheckVerificationErrorsEvent(
                      password1: _password!,
                      password2: _password2!,
                      phoneNumber: _phone!,
                    ));
                    VerificationMethods()
                        .authenticatePhone(_smsCode, _phone, _password);
                    await FirebaseAuth.instance
                        .authStateChanges()
                        .listen((User? user) {
                      if (user != null) {
                        navBarState?.setPage(0);
                        BlocProvider.of<BottomNavigationBloc>(context)
                            .add(NavigateToHomePageEvent(0));
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const MainHomePage()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            snackBar("Error signing up!", Colors.red));
                      }
                    });
                  }
                },
                child: const Text("Sign Up"),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<WelcomeScreenNavigationBloc>(context)
                        .add(NavigateToResetPasswordPageEvent());
                  },
                  child: const Text("Account recovery"),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: TextButton(
                onPressed: () {
                  BlocProvider.of<WelcomeScreenNavigationBloc>(context)
                      .add(NavigateToSignInScreenEvent());
                },
                child: const Text("Already a member? Log in"),
              ),
            )
          ],
        ),
      ),
    );
  }
}