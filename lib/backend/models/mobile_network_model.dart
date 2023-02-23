import 'package:qashpal/backend/models/payment_provider.dart';

class MobileNetwork {
  // final PaymentProvider prov;
  final String nickName;
  final String phoneNumber;
  final String firstName;
  final String lastName;

  MobileNetwork({
    required this.nickName,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    // required this.prov,
  });
}