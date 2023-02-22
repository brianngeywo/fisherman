import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qashpal/backend/constants.dart';
import 'package:qashpal/backend/models/referral.dart';

class ReferralService {
  Future<DocumentReference<Object?>> addReferral(Referral referral) async {
    return await usersCollection
        .doc(referral.referrerId)
        .collection('referrals')
        .add(referral.toMap());
  }
  //
  // Future<List<Referral>> getReferrals(String id) async {
  //   List<Referral> referrals = [];
  //   referrals = usersCollection.doc(id).collection('referrals').snapshots().map(
  //       (snapshot) => snapshot.docs.map(
  //               (doc) => Referral.fromMap(doc.data() as Map<String, dynamic>))
  //           as List<Referral>);
  //   return referrals;
  // }
}