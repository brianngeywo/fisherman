import 'package:qashpal/backend/constants/constants.dart';

class GeneralFunctions {
  double calculateLinearIndicator() {
    // double balance = minimumAmountToWithdraw - userProvider.user!.accountBalance;
    double level = userProvider.user!.accountBalance / minimumAmountToWithdraw;
    return level;
  }
}