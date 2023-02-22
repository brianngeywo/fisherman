import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qashpal/backend/Providers/referral_provider.dart';
import 'package:qashpal/backend/Providers/transactions_provider.dart';
import 'package:qashpal/backend/Providers/user_provider.dart';
import 'package:qashpal/backend/methods/transactions_methods.dart';
import 'package:qashpal/backend/methods/user_functions.dart';
import 'package:qashpal/backend/models/mobile_network_model.dart';
import 'package:qashpal/backend/models/user_model.dart';

var firestore = FirebaseFirestore.instance;
var referralCollection = FirebaseFirestore.instance.collection("referrals");
var usersCollection = FirebaseFirestore.instance.collection("users");
var transactionsCollection =
    FirebaseFirestore.instance.collection("transactions");
var randomTransactionId = TransactionMethods().generateTransactionId();
var randomTransactions = TransactionMethods().generateRandomTransactions();
var randomUserId = UserMethods().generateUserId();
final randomUsers = UserMethods().generateRandomUsers();
final userProvider = UserProvider();
final transactionsProvider = TransactionsProvider();
final referralprovider = ReferralProvider();
final referralsList = referralprovider.referrals;
final withdrawalsList = transactionsProvider.withdrawals;
final depositsList = transactionsProvider.deposits;
List<MobileNetwork> mobileNetworks = [];