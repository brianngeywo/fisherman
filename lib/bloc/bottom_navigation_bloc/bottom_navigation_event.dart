part of 'bottom_navigation_bloc.dart';

// @immutable
abstract class BottomNavigationEvent {
  final int pageIndex;

  BottomNavigationEvent(this.pageIndex);
}

class NavigateToHomePageEvent extends BottomNavigationEvent {
  NavigateToHomePageEvent(super.pageIndex);
}

class NavigateToDepositPageEvent extends BottomNavigationEvent {
  NavigateToDepositPageEvent(super.pageIndex);
}

class NavigateToWithdrawalsListPageEvent extends BottomNavigationEvent {
  NavigateToWithdrawalsListPageEvent(super.pageIndex);
}

class NavigateToDownLinesListPageEvent extends BottomNavigationEvent {
  NavigateToDownLinesListPageEvent(super.pageIndex);
}

class NavigateToShareAndInvitesPageEvent extends BottomNavigationEvent {
  NavigateToShareAndInvitesPageEvent(super.pageIndex);
}
