import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'account_transactions_tabs_event.dart';

part 'account_transactions_tabs_state.dart';

class AccountTransactionsTabsBloc
    extends Bloc<AccountTransactionsTabsEvent, AccountTransactionsTabsState> {
  AccountTransactionsTabsBloc()
      : super(const SwitchFromDepositTabToWithdrawalsTabState(false)) {
    on<SwitchFromDepositTabToWithdrawalsTabsEvent>((event, emit) {
      emit(
        SwitchFromDepositTabToWithdrawalsTabState(
          event.switchFromDepositTabToWithdrawalsTab,
        ),
      );
    });
  }
}
