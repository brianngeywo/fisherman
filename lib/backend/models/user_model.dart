import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class MyUser {
  final String photoUrl;
  final String phoneNumber;
  final String id;
  final String password;
  final bool phoneVerified;
  final bool userActivated;
  final double accountBalance;
  final String carrierNetwork;
  final double totalWithdrawals;
  final bool welcomeBonus;
  final bool bestAgent;
  final String referredBy;
  final String username;

  MyUser({
    required this.referredBy,
    required this.userActivated,
    required this.accountBalance,
    required this.photoUrl,
    required this.phoneNumber,
    required this.id,
    required this.password,
    required this.phoneVerified,
    required this.carrierNetwork,
    required this.totalWithdrawals,
    required this.welcomeBonus,
    required this.bestAgent,
    required this.username,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
      'password': password,
      'photoUrl': photoUrl,
      'phoneVerified': phoneVerified,
      'userActivated': userActivated,
      'accountBalance': accountBalance,
      'carrierNetwork': carrierNetwork,
      'totalWithdrawals': totalWithdrawals,
      'welcomeBonus': welcomeBonus,
      'bestAgent': bestAgent,
      'referredBy': referredBy,
      'username': username,
    };
  }

  MyUser fromMap() {
    return MyUser(
      referredBy: referredBy,
      userActivated: userActivated,
      accountBalance: accountBalance,
      photoUrl: photoUrl,
      phoneNumber: phoneNumber,
      id: id,
      password: password,
      phoneVerified: phoneVerified,
      carrierNetwork: carrierNetwork,
      totalWithdrawals: totalWithdrawals,
      welcomeBonus: welcomeBonus,
      bestAgent: bestAgent,
      username: username,
    );
  }

// Future<Uri> get referralLink async {
//   final DynamicLinkParameters parameters = DynamicLinkParameters(
//     uriPrefix: 'https://myapp.com',
//     link: Uri.parse('https://myapp.com/referral?id=$id'),
//     androidParameters: AndroidParameters(
//       packageName: 'com.myapp.android',
//       minimumVersion: 0,
//     ),
//   );
//
//   final ShortDynamicLink shortLink =
//       await FirebaseDynamicLinks.instance.buildShortLink(parameters);
//   print(shortLink.shortUrl);
//   return shortLink.shortUrl;
// }
}