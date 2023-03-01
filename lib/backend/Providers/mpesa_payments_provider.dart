import 'package:qashpal/backend/c2b.dart';

class MpesaPaymentsProvider {
  static final MpesaPaymentsProvider _singleton =
      MpesaPaymentsProvider._internal();
  factory MpesaPaymentsProvider() {
    return _singleton;
  }
  MpesaPaymentsProvider._internal();
  String? _result;
  String? get result => _result;
  Future<String> processDeposit(
      String phone, String amount, String reference) async {
    _result = await processC2BPayment(phone, amount, reference);
    return _result!;
  }
}