import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:qashpal/bloc/connectivity_bloc/connectivity_status_enum.dart';

class ConnectivityBloc extends Bloc<ConnectivityStatus, bool> {
  StreamSubscription<ConnectivityResult>? _subscription;

  ConnectivityBloc() : super(true) {
    _subscription = Connectivity().onConnectivityChanged.listen((status) {
      if (status == ConnectivityResult.none) {
        add(ConnectivityStatus.offline);
      } else {
        add(ConnectivityStatus.online);
      }
    });
    on<ConnectivityStatus>((event, emit) {
      switch (event) {
        case ConnectivityStatus.offline:
          emit(false);
          break;
        case ConnectivityStatus.online:
          emit(true);
          break;
      }
    });
    @override
    Future<void> close() {
      _subscription?.cancel();
      return super.close();
    }
  }
}