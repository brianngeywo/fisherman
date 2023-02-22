part of 'welcome_screen_navigation_bloc.dart';

@immutable
abstract class WelcomeScreenNavigationEvent {}

class NavigateToSignUpScreenEvent extends WelcomeScreenNavigationEvent {}

class NavigateToSignInScreenEvent extends WelcomeScreenNavigationEvent {}

class NavigateToResetPasswordPageEvent extends WelcomeScreenNavigationEvent {}
