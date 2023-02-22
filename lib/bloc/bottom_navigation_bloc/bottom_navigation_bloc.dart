import 'package:bloc/bloc.dart';
import 'package:qashpal/bloc/welcome_screen_navigation_bloc'
    '/welcome_screen_navigation_bloc.dart';

part 'bottom_navigation_event.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  final WelcomeScreenNavigationBloc welcomeScreenNavigationBloc;

  BottomNavigationBloc(this.welcomeScreenNavigationBloc)
      : super(OnHomepageState(0)) {
    on<NavigateToHomePageEvent>((event, emit) {
      emit(OnHomepageState(event.pageIndex));
    });
    on<NavigateToShareAndInvitesPageEvent>((event, emit) {
      emit(OnShareAndInvitesPageState(event.pageIndex));
    });
    on<NavigateToDepositPageEvent>((event, emit) {
      emit(OnDepositPageState(event.pageIndex));
    });
    on<NavigateToDownLinesListPageEvent>((event, emit) {
      emit(OnDownLinesListPageState(event.pageIndex));
    });
    on<NavigateToWithdrawalsListPageEvent>((event, emit) {
      emit(OnWithdrawalsListPageState(event.pageIndex));
    });
  }
}