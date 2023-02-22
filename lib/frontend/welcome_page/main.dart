import 'package:flutter/material.dart';
import 'package:qashpal/frontend/welcome_page/welcome_screen.dart';

class MainWelcomePage extends StatelessWidget {
  const MainWelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              radius: 1.2,
              colors: [
                Color(0xFF5BDAD7),
                Color(0xFFBCCEFB),
                Color(0xFF5BDAD7),
                Color(0xFFD094EA),
                Color(0xFF5D54A3),
              ],
            ),
          ),
          child: const WelcomeScreen(),
        ),
      ),
    );
  }
}