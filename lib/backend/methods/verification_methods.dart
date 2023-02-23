import 'package:flutter/material.dart';
import 'package:qashpal/backend/methods/authentication_functions.dart';

class VerificationMethods {
  final SMSCodeVerification smsCodeVerification = SMSCodeVerification();

  String? verificationId;

  void authenticatePhone(String? otp, String? phone, String? password) async {
    await smsCodeVerification.authenticatePhoneNumber(otp).then((value) {
      const CircularProgressIndicator();
    });
  }

  void sendSMSToPhone(String phone) async {
    await smsCodeVerification.sendOTP(phone).then((value) {
      const CircularProgressIndicator();
    });
  }
}