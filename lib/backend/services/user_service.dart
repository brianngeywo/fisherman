import 'package:qashpal/backend/models/user_model.dart';

// class UserService {
//   MyUser user;
//
//   UserService({required this.user});
//
//   void shareReferralLink() async {
//     final referralLink = await user.referralLink;
//     // Share the referral link using a sharing library or plugin
//   }
// }
// In this example, the User class has a referralLink getter that returns a future
// that resolves to the referral link for the user.
// The referral link is constructed using the
// DynamicLinkParameters class from the firebase_dynamic_links package.
//
// The UserService class provides a shareReferralLink method
// that can be used to share the referral link.
// You can use a sharing library or plugin to share the link.
//
// When a new user clicks the referral link,
// you can retrieve the user ID from the link and
// use it to associate the new user with the referrer in your database.