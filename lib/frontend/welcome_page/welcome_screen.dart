import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qashpal/bloc/welcome_screen_navigation_bloc/welcome_screen_navigation_bloc.dart';
import 'package:qashpal/frontend/constants.dart';
import 'package:qashpal/frontend/welcome_page/reset_password_screen.dart';
import 'package:qashpal/frontend/welcome_page/signin_screen.dart';
import 'package:qashpal/frontend/welcome_page/signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double containerHeight = 570;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<WelcomeScreenNavigationBloc, WelcomeScreenNavigationState>(
          listener: (context, state) {
            switch (state.runtimeType) {
              case OnSignInScreenState:
                setState(() {
                  containerHeight = 570;
                });

                break;
              case OnSignUpScreenState:
                setState(() {
                  containerHeight = 680;
                });

                break;
              case OnResetPasswordScreenState:
                setState(() {
                  containerHeight = 570;
                });

                break;
              default:
                setState(() {
                  containerHeight = 570;
                });
            }
          },
        ),
      ],
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration:
                BoxDecoration(color: Colors.grey.shade200.withOpacity(0.3)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedContainer(
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: const EdgeInsets.only(top: 30, bottom: 30),
                  height: containerHeight,
                  // Define how long the animation should take.
                  duration: const Duration(milliseconds: 500),
                  // Provide an optional curve to make the animation feel smoother.
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView(
                    children: [
                      Center(
                        child: Text(
                          "QashPal",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: logoColor,
                          ),
                        ),
                      ),
                      BlocBuilder<WelcomeScreenNavigationBloc,
                          WelcomeScreenNavigationState>(
                        builder: (context, state) {
                          switch (state.runtimeType) {
                            case OnSignInScreenState:
                              return SignInScreen();
                            case OnSignUpScreenState:
                              return SignUpScreen();
                            case OnResetPasswordScreenState:
                              return ResetPasswordScreen();
                            default:
                              return SignInScreen();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}