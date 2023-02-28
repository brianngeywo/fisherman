class Referral {
  final String referrerId;
  final String referredId;

  Referral({required this.referrerId, required this.referredId});

  Map<String, dynamic> toMap() {
    return {
      'referrerId': referrerId,
      'referredId': referredId,
    };
  }

  static Referral fromMap(Map<String, dynamic> map) {
    return Referral(
      referrerId: map['referrerId'],
      referredId: map['referredId'],
    );
  }
}

// When a user signs up, you can add a referral to the referral collection
// by calling the addReferral method.
// The referrerId should be set to the ID of the user who referred the new user
// and the referredId should be set to the ID of the newly signed up user.
//
// The referrals stream provides a list of referrals stored in the database,
// which you can use to keep track of your referrals.