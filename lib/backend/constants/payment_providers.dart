import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qashpal/backend/models/payment_provider.dart';

List<PaymentProvider> paymentProviders = [
  PaymentProvider(
    logo: FontAwesomeIcons.applePay,
    name: "Airtel Money",
    color: Colors.red,
  ),
  PaymentProvider(
    logo: FontAwesomeIcons.googlePay,
    name: "Mpesa",
    color: Colors.green,
  ),
  PaymentProvider(
    logo: FontAwesomeIcons.amazonPay,
    name: "AstroPay",
    color: Colors.brown,
  ),
  PaymentProvider(
    logo: FontAwesomeIcons.paypal,
    name: "PayPal",
    color: Colors.blueAccent,
  ),
  PaymentProvider(
    logo: FontAwesomeIcons.buildingColumns,
    name: "Bank",
    color: Colors.blueGrey,
  ),
];