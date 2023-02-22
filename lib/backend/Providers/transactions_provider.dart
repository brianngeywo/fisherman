import 'package:qashpal/backend/models/account_transactions.dart';

import '../constants.dart';

class TransactionsProvider {
  static final TransactionsProvider _singleton =
      TransactionsProvider._internal();

  factory TransactionsProvider() {
    return _singleton;
  }

  TransactionsProvider._internal();

  List<AccountTransactions>? _deposits;
  List<AccountTransactions>? _withdrawals;

  List<AccountTransactions>? get deposits => _deposits;

  List<AccountTransactions>? get withdrawals => _withdrawals;

  // retrieve transactions for a specific user
  Future<void> retrieveUserWithdrawalsTransactions(String userId) async {
    final querySnapshot = await transactionsCollection
        .where("userId", isEqualTo: userId)
        .where("isDeposit", isEqualTo: false)
        .get();
    _withdrawals = querySnapshot.docs.map((doc) {
      final data = doc.data();
      return AccountTransactions(
        transactionId: data["transactionId"],
        amount: data["amount"],
        status: data["status"],
        isDeposit: data["isDeposit"],
        userId: data["userId"],
      );
    }).toList();
  }

  // retrieve transactions for a specific user
  Future<void> retrieveUserDepositTransactions(String userId) async {
    final querySnapshot = await transactionsCollection
        .where("userId", isEqualTo: userId)
        .where("isDeposit", isEqualTo: true)
        .get();
    _deposits = querySnapshot.docs.map((doc) {
      final data = doc.data();
      return AccountTransactions(
        transactionId: data["transactionId"],
        amount: data["amount"],
        status: data["status"],
        isDeposit: data["isDeposit"],
        userId: data["userId"],
      );
    }).toList();
  }
}