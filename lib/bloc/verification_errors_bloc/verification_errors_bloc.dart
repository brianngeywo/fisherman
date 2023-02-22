import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'verification_errors_event.dart';

part 'verification_errors_state.dart';

class VerificationErrorsBloc
    extends Bloc<VerificationErrorsEvent, VerificationErrorsState> {
  VerificationErrorsBloc() : super(VerificationErrorsInitialState()) {
    on<CheckVerificationErrorsEvent>((event, emit) {
      if (event.phoneNumber.length <= 11 &&
          !event.phoneNumber.contains("254")) {
        emit(VerificationWrongPhoneNumberFormatErrorState());
      } else if (event.password1.length <= 6) {
        emit(VerificationShortPasswordErrorState());
      } else if (event.password1 != event.password2) {
        emit(VerificationDifferentPasswordsErrorState());
      }
    });
  }
}