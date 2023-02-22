import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'form_actions_event.dart';

part 'form_actions_state.dart';

class FormActionsBloc extends Bloc<FormActionsEvent, FormActionsState> {
  FormActionsBloc() : super(FormActionsInitialState()) {
    on<FormActionsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}