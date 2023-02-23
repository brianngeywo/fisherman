import 'package:qashpal/backend/constants/constants.dart';
import 'package:qashpal/backend/models/user_model.dart';

class ReferralProvider {
  static final ReferralProvider _singleton = ReferralProvider._internal();

  factory ReferralProvider() {
    return _singleton;
  }

  ReferralProvider._internal();

  List<MyUser>? _referrals;

  List<MyUser>? get referrals => _referrals;

  Future<void> getReferrals(String referrerId) async {
    // Get the documents for the referred users
    final querySnapshot =
        await usersCollection.where("referredBy", isEqualTo: referrerId).get();

    // Extract the details for each user and create MyUser instances
    _referrals = querySnapshot.docs.map((document) {
      final data = document.data();
      return MyUser(
        userActivated: data["userActivated"],
        accountBalance: data["accountBalance"],
        photoUrl: data["photoUrl"],
        phoneNumber: data["phoneNumber"],
        id: data["id"],
        password: data["password"],
        phoneVerified: data["phoneVerified"],
        carrierNetwork: data["carrierNetwork"],
        totalWithdrawals: data["totalWithdrawals"],
        welcomeBonus: data["welcomeBonus"],
        bestAgent: data["bestAgent"],
        referredBy: data["referredBy"],
        username: data["username"],
        // dateJoined: data["dateJoined"],
      );
    }).toList();
  }
}