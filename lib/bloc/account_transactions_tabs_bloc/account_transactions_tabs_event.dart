part of 'account_transactions_tabs_bloc.dart';

@immutable
abstract class AccountTransactionsTabsEvent {
  final bool switchFromDepositTabToWithdrawalsTab;

  const AccountTransactionsTabsEvent(this.switchFromDepositTabToWithdrawalsTab);
}

class SwitchFromDepositTabToWithdrawalsTabsEvent
    extends AccountTransactionsTabsEvent {
  const SwitchFromDepositTabToWithdrawalsTabsEvent(
      super.switchBetweenTabsBolean);
}
