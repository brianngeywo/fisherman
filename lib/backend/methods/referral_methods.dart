import 'package:qashpal/backend/constants/constants.dart';

class ReferralMethods {
// Add a new referral to the collection
  void updateReferralsToCollection() {
    usersCollection.get().then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        referralCollection
            .add({
              "referrer": doc["referredBy"],
              "referred": doc["id"],
            })
            .then((docRef) => {print("Referral added with ID: ${docRef.id}")})
            .catchError((error) =>
                {print("Error adding referral: ${error.toString()}")});
      }
    });
  }
}