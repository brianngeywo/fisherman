part of 'verification_errors_bloc.dart';

@immutable
abstract class VerificationErrorsState {}

class VerificationErrorsInitialState extends VerificationErrorsState {}

class VerificationShortPasswordErrorState extends VerificationErrorsState {}

class VerificationDifferentPasswordsErrorState extends VerificationErrorsState {
}

class VerificationWrongPhoneNumberFormatErrorState
    extends VerificationErrorsState {}