// import 'dart:math';
//
// import 'package:cloud_firestore/cloud_firestore.dart';

//
// void generateUserId() {
//   var userIds = <String>{};
//   var rng = Random();`
//   var phoneNumber = "+1-555-555-1212";
//   var password = "password123";
//
//   while (true) {
//     var userId = rng.nextInt(9999999).toString().padLeft(7, '0');
//     if (!userIds.contains(userId)) {
//       userIds.add(userId);
//       var user =
//           User(userId: userId, phoneNumber: phoneNumber, password: password);
//       print(user.userId);
//       print(user.phoneNumber);
//       print(user.password);
//       break;
//     }
//   }
//   Future<void> createUser(User user) async {
//     generateUserId();
//     // Store the user in Firestore
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(user.userId)
//         .set(user.toMap());
//   }
//
//   Future<void> createReferral(String referrerId, String referralId) async {
//     // Update the referrer's referral count
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(referrerId)
//         .update({
//       'referralCount': FieldValue.increment(1),
//     });
//
//     // Store the referral
//     await FirebaseFirestore.instance
//         .collection('referrals')
//         .doc(referralId)
//         .set({
//       'referrerId': referrerId,
//     });
//   }
// }