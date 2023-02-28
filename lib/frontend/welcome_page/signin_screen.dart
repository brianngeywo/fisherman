import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qashpal/bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:qashpal/bloc/welcome_screen_navigation_bloc/welcome_screen_navigation_bloc.dart';
import 'package:qashpal/frontend/constants.dart';
import 'package:qashpal/frontend/home_page/main.dart';
import 'package:qashpal/frontend/welcome_page/widgets.dart';

class SignInScreen extends StatelessWidget {
  final _signInFormKey = GlobalKey<FormState>();

  String? _phone, _password, _smsCode;

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                "Welcome back!",
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
            margin: const EdgeInsets.all(4.0),
            child: const Text("Log in with Phone number"),
          ),
          // const Divider(),
          Form(
            key: _signInFormKey,
            child: Column(
              children: [
                myPhoneNumberSendOTPTextFormField(_phone),
                myTextFormField(_password, "Enter a password", true),
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
                // if (Form.of(context)!.validate()) {
                //   Form.of(context)!.save();
                //   print("$_smsCode, $_phone, $_password");
                //   VerificationMethods()
                //       .authenticatePhone(_smsCode!, _phone!, _password!);
                // }
                // if (FirebaseAuth.instance.currentUser != null) {
                navBarState?.setPage(0);
                BlocProvider.of<BottomNavigationBloc>(context)
                    .add(NavigateToHomePageEvent(0));
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const MainHomePage()));
                // } else {
                //   Navigator.of(context).pop();
                // }
              },
              child: const Text("Log in to your account"),
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
                child: const Text("Forgot Password?"),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: TextButton(
              onPressed: () {
                BlocProvider.of<WelcomeScreenNavigationBloc>(context)
                    .add(NavigateToSignUpScreenEvent());
              },
              child: const Text("Not a member? Sign up"),
            ),
          ),
        ],
      ),
    );
  }
}