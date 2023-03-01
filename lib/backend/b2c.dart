import 'dart:convert';
import 'package:http/http.dart' as http;

//define your Daraja API credentials:
final String consumerKey = 'YOUR_CONSUMER_KEY';
final String consumerSecret = 'YOUR_CONSUMER_SECRET';
final String shortcode = 'YOUR_SHORTCODE';
final String passkey = 'YOUR_PASSKEY';

//b2c methods
// method that generates a base64-encoded string of your consumer key and consumer secret,
// which will be used to authenticate your requests to the Daraja API:
String _generateBasicAuth() {
  String auth = '$consumerKey:$consumerSecret';
  Codec<String, String> stringToBase64 = utf8.fuse(base64);
  return 'Basic ${stringToBase64.encode(auth)}';
}

//method that initiates a B2C payment request:
Future<Map<String, dynamic>> initiateB2CPayment(
    String phoneNumber, double amount) async {
  final String url =
      'https://sandbox.safaricom.co.ke/mpesa/b2c/v1/paymentrequest';
  final String timestamp = DateTime.now()
      .toString()
      .replaceAll('-', '')
      .replaceAll(' ', '')
      .replaceAll(':', '')
      .substring(0, 14);
  final String password =
      utf8.fuse(base64).encode('$shortcode$passkey$timestamp');
  final Map<String, String> headers = {
    'Authorization': _generateBasicAuth(),
    'Content-Type': 'application/json'
  };
  final Map<String, dynamic> requestBody = {
    'InitiatorName': 'API_USER',
    'SecurityCredential': password,
    'CommandID': 'BusinessPayment',
    'Amount': amount.toStringAsFixed(2),
    'PartyA': shortcode,
    'PartyB': phoneNumber,
    'Remarks': 'B2C Payment',
    'QueueTimeOutURL': 'YOUR_QUEUE_TIMEOUT_URL',
    'ResultURL': 'YOUR_RESULT_URL',
    'Occasion': 'B2C'
  };
  final http.Response response = await http.post(Uri.parse(url),
      headers: headers, body: json.encode(requestBody));
  return json.decode(response.body);
}

// call in flutter app
// Map<String, dynamic> response = await initiateB2CPayment('PHONE_NUMBER', AMOUNT);
// print(response);