import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'welcome_screen_navigation_event.dart';

part 'welcome_screen_navigation_state.dart';

class WelcomeScreenNavigationBloc
    extends Bloc<WelcomeScreenNavigationEvent, WelcomeScreenNavigationState> {
  WelcomeScreenNavigationBloc() : super(OnSignInScreenState()) {
    on<NavigateToSignInScreenEvent>((event, emit) {
      // TODO: implement event handler
      emit(OnSignInScreenState());
    });
    on<NavigateToSignUpScreenEvent>((event, emit) {
      // TODO: implement event handler
      emit(OnSignUpScreenState());
    });
    on<NavigateToResetPasswordPageEvent>((event, emit) {
      emit(OnResetPasswordScreenState());
    });
  }
}
