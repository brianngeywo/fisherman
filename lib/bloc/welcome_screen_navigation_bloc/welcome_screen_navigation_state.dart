part of 'welcome_screen_navigation_bloc.dart';

@immutable
abstract class WelcomeScreenNavigationState {}

class OnSignInScreenState extends WelcomeScreenNavigationState {}

class OnSignUpScreenState extends WelcomeScreenNavigationState {}

class OnResetPasswordScreenState extends WelcomeScreenNavigationState {}
