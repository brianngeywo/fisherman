part of 'account_transactions_tabs_bloc.dart';

@immutable
abstract class AccountTransactionsTabsState {
  final bool switchedFromDepositTabToWithdrawalsTab;

  const AccountTransactionsTabsState(
      this.switchedFromDepositTabToWithdrawalsTab);
}

class SwitchFromDepositTabToWithdrawalsTabState
    extends AccountTransactionsTabsState {
  const SwitchFromDepositTabToWithdrawalsTabState(
      super.switchedFromDepositTabToWithdrawalsTab);
}
