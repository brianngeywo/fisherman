import 'dart:math';

import 'package:qashpal/backend/constants.dart';
import 'package:qashpal/backend/models/user_model.dart';

class UserMethods {
  List<MyUser> generateRandomUsers() {
    final List<MyUser> users = [];

    for (var i = 0; i < 10; i++) {
      users.add(randomUser);
    }

    return users;
  }

// Generate a random 7-digit user ID
  String generateUserId() {
    var rand = Random();
    return (1000000 + rand.nextInt(9000000)).toString();
  }

  void addThisUser() {
    // Add the user to the collection
    usersCollection.doc(myuser.id).set(myuser.toMap()).then((value) {
      print("User added with ID: ${myuser.accountBalance}");
    }).catchError((error) {
      print("Error adding user: $error");
    });
  }

  addUserToFirestore(MyUser user) async {
    await usersCollection.doc(user.id).set(user.toMap());
  }

// Add 10 new users to the collection
  addRandomUsersToFirebase(List<MyUser> theRandomUsers) {
    for (MyUser theRandomUser in theRandomUsers) {
      // Add the user to the collection
      usersCollection
          .doc(theRandomUser.id)
          .set(theRandomUser.toMap())
          .then((value) {
        print("User added with ID: ${randomUser.id}");
      }).catchError((error) {
        print("Error adding user: $error");
      });
    }
  }


}

final MyUser myuser = MyUser(
  photoUrl: "https://icons8.com/icon/23265/user",
  userActivated: Random().nextBool(),
  accountBalance: Random().nextDouble(),
  phoneNumber: "07${Random().nextInt(100000000)}",
  id: "1234567",
  password: "password",
  phoneVerified: Random().nextBool(),
  carrierNetwork: "Safaricom",
  totalWithdrawals: Random().nextDouble() * 10000,
  welcomeBonus: Random().nextBool(),
  bestAgent: Random().nextBool(),
  referredBy: randomUserId,
  username: '1234567',
);
// randomUser
final MyUser randomUser = MyUser(
  photoUrl: "https://icons8.com/icon/23265/user",
  userActivated: Random().nextBool(),
  accountBalance: Random().nextDouble(),
  phoneNumber: "07${Random().nextInt(100000000)}",
  id: randomUserId,
  password: "password",
  phoneVerified: Random().nextBool(),
  carrierNetwork: "Safaricom",
  totalWithdrawals: Random().nextDouble() * 10000,
  welcomeBonus: Random().nextBool(),
  bestAgent: Random().nextBool(),
  referredBy: "1234567",
  username: randomUserId,
);