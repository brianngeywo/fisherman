class AccountTransactions {
  final String transactionId;
  final double amount;
  final bool status;
  final bool isDeposit;
  final String userId;

  AccountTransactions({
    required this.transactionId,
    required this.amount,
    required this.status,
    required this.isDeposit,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      "transactionId": transactionId,
      "amount": amount,
      "status": status,
      "isDeposit": isDeposit,
      "userId": userId,
    };
  }

  AccountTransactions fromMap() {
    return AccountTransactions(
      transactionId: transactionId,
      amount: amount,
      status: status,
      isDeposit: isDeposit,
      userId: userId,
    );
  }
}