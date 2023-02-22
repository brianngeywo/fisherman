part of 'bottom_navigation_bloc.dart';

// @immutable
abstract class BottomNavigationState {
  late int pageIndex;

  BottomNavigationState(this.pageIndex);
}

class OnHomepageState extends BottomNavigationState {
  OnHomepageState(super.pageIndex);
}

class OnWithdrawalsListPageState extends BottomNavigationState {
  OnWithdrawalsListPageState(super.pageIndex);
}

class OnDepositPageState extends BottomNavigationState {
  OnDepositPageState(super.pageIndex);
}

class OnDownLinesListPageState extends BottomNavigationState {
  OnDownLinesListPageState(super.pageIndex);
}

class OnShareAndInvitesPageState extends BottomNavigationState {
  OnShareAndInvitesPageState(super.pageIndex);
}
