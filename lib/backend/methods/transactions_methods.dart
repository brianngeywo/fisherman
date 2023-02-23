// Generate a list of fiction transactions
import 'dart:math';

import 'package:qashpal/backend/constants/constants.dart';
import 'package:qashpal/backend/models/account_transactions.dart';

class TransactionMethods {
  // final List<AccountTransactions> transactionsList = List.generate(5, (i) {
  //   return AccountTransactions(
  //     transactionId: "KEN7834${Random().nextInt(300)}",
  //     amount: Random().nextInt(500).toDouble(),
  //     status: true,
  //     isDeposit: Random().nextBool(),
  //     userId: '1234567',
  //   );
  // });

// generate random transaction id
  String generateTransactionId() {
    var rand = Random();
    return ("KEN7834${1000000 + rand.nextInt(9000000)}");
  }

// save single transactions to firebase
  void addRandomTransaction() {
    transactionsCollection
        .doc(accountTransaction.transactionId)
        .set(accountTransaction.toMap());
  }

  List<AccountTransactions> generateRandomTransactions() {
    List<AccountTransactions> transaactions = [];
    for (var i = 0; i < 10; i++) {
      transaactions.add(accountTransaction);
    }
    return transaactions;
  }

  void uploadRandomTransactionsToFirestore(
      List<AccountTransactions> accountTransactions) {
    for (accountTransaction in accountTransactions) {
      transactionsCollection
          .doc(accountTransaction.transactionId)
          .set(accountTransaction.toMap());
    }
  }

  List<AccountTransactions> trans = [];

// retrieve transactions for a specific user
  Future<List<AccountTransactions>> retrieveUserTransactions(
      String userId) async {
    final querySnapshot =
        await transactionsCollection.where("userId", isEqualTo: userId).get();
    final myDocs = querySnapshot.docs.map((doc) {
      final data = doc.data();
      return AccountTransactions(
        transactionId: data["transactionId"],
        amount: data["amount"],
        status: data["status"],
        isDeposit: data["isDeposit"],
        userId: data["userId"],
      );
    }).toList();
    trans = myDocs;
    return trans;
  }
}

// random transaction
AccountTransactions accountTransaction = AccountTransactions(
  transactionId: TransactionMethods().generateTransactionId(),
  amount: Random().nextInt(500).toDouble(),
  status: true,
  isDeposit: false,
  userId: '1234567',
);