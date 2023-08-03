import 'package:bloc/bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<Increment>(
      (event, emit) {
        emit(AppState(counter: state.counter + 1));
      },
    );
    on<Decrement>(
      (event, emit) {
        emit(AppState(counter: state.counter - 1));
      },
    );
  }
}
