import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qashpal/backend/models/user_model.dart';

class UserProvider {
  static final UserProvider _singleton = UserProvider._internal();

  factory UserProvider() {
    return _singleton;
  }

  UserProvider._internal();

  MyUser? _user;

  MyUser? get user => _user;

  Future<void> getUserFromFirestore(String id) async {
    final doc =
        await FirebaseFirestore.instance.collection('users').doc(id).get();
    final data = doc.data();
    _user = MyUser(
      referredBy: data!["referredBy"],
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
      username: data["username"],
    );
  }
}