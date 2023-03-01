import 'dart:convert';

import 'package:http/http.dart' as http;

//c2b
//Daraja API endpoints:
final String baseUrl = "https://sandbox.safaricom.co.ke";
final String authenticationEndpoint =
    "/oauth/v1/generate?grant_type=client_credentials";
final String c2bEndpoint = "/mpesa/c2b/v1/simulate";
//authentication credentials:
final String consumerKey = "";
final String consumerSecret = "";
final String authString =
    base64.encode(utf8.encode('$consumerKey:$consumerSecret'));

// c2b methods
//method to generate authentication tokens:
Future<String> _generateToken() async {
  final response = await http.get(Uri.parse('$baseUrl$authenticationEndpoint'),
      headers: {"Authorization": "Basic $authString"});

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    return jsonResponse["access_token"];
  } else {
    throw Exception("Failed to generate authentication token");
  }
}

//method to process C2B payments:
Future<String> processC2BPayment(
    String phone, String amount, String reference) async {
  final token = await _generateToken();

  final response = await http.post(Uri.parse('$baseUrl$c2bEndpoint'),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json"
      },
      body: json.encode({
        "ShortCode": "600998",
        "CommandID": "CustomerPayBillOnline",
        "Amount": amount,
        "Msisdn": phone,
        "BillRefNumber": reference
      }));

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    if (jsonResponse["ResponseCode"] == "0") {
      return "Payment processed successfully";
    } else {
      return "Payment failed: ${jsonResponse["errorMessage"]}";
    }
  } else {
    throw Exception("Failed to process payment");
  }
}

// call this in flutter app
// final result = await processC2BPayment("254712345678", "100", "my_reference");
// print(result);