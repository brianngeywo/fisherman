import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qashpal/backend/constants/constants.dart';
import 'package:qashpal/backend/methods/user_functions.dart';
import 'package:qashpal/backend/models/user_model.dart';

class SMSCodeVerification {
  String? _verificationId;

  Future<void> sendOTP(phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // ANDROID ONLY!

        // Sign the user in (or link) with the auto-generated credential
        // await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
          print(e.toString());
        }

        // Handle other errors
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        _verificationId = verificationId;
      },
      timeout: const Duration(seconds: 120),
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out...
        _verificationId = verificationId;
      },
    );
  }

  Future<bool> authenticatePhoneNumber(String? smsCode) async {
    PhoneAuthCredential credential = await PhoneAuthProvider.credential(
      verificationId: _verificationId!.toString(),
      smsCode: smsCode!,
    );

    try {
      print("verification id: ${credential.toString()}");

      await FirebaseAuth.instance.signInWithCredential(credential);
      return true;
    } catch (e) {
      print("Error signing in with phone number and OTP: $e");
      return false;
    }
  }

  Future<void> searchForUserInDatabase(
      String phoneNumber, String password) async {
    try {
      var user = await FirebaseFirestore.instance
          .collection("users")
          .where("phoneNumber", isEqualTo: phoneNumber)
          .get();
      if (user.docs.isEmpty) {
        print("no user found!");
      } else {
        if (user.docs[0]["password"] == password) {
          //Log user in
        } else {
          print("wrong password");
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // register user
  Future<void> registerUser(String phone, String pass) async {
    var userActivated = false;
    var accountBalance = 0.0;
    var phoneVerified = true;
    var totalWithdrawals = 0.0;
    var bestAgent = false;
    var welcomeBonus = false;
    var photoUrl = 'https://icons8.com/icon/23265/user';

    while (true) {
      var myUser = MyUser(
        id: randomUserId,
        phoneNumber: phone,
        password: pass,
        userActivated: userActivated,
        accountBalance: accountBalance,
        photoUrl: photoUrl,
        phoneVerified: phoneVerified,
        carrierNetwork: 'Safaricom',
        totalWithdrawals: totalWithdrawals,
        welcomeBonus: welcomeBonus,
        bestAgent: bestAgent,
        referredBy: '1234567',
        username: randomUserId,
        // dateJoined: DateTime.now(),
      );

      // Store the user in Firestore
      UserMethods().addUserToFirestore(myUser);
    }
  }
}