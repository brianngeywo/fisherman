part of 'verification_errors_bloc.dart';

@immutable
abstract class VerificationErrorsEvent {}

class CheckVerificationErrorsEvent extends VerificationErrorsEvent {
  String password1;
  String password2;
  String phoneNumber;

  CheckVerificationErrorsEvent({
    required this.password1,
    required this.password2,
    required this.phoneNumber,
  });
}