import 'package:bloc/bloc.dart';

part 'passwords_viscibility_event.dart';

part 'passwords_viscibility_state.dart';

class PasswordsVisibilityBloc
    extends Bloc<TogglePasswordVisibilityEvent, PasswordsVisibilityState> {
  PasswordsVisibilityBloc()
      : super(PasswordsVisibilityState(isPasswordVisible: false)) {
    on<TogglePasswordVisibilityEvent>((event, emit) {
      // TODO: implement event handler
      emit(PasswordsVisibilityState(
          isPasswordVisible: !state.isPasswordVisible));
    });
  }
}