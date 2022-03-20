import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'football_event.dart';
part 'football_state.dart';

class FootballBloc extends Bloc<FootballEvent, FootballState> {
  FootballBloc() : super(FootballInitial()) {
    on<FootballEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
