import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'formula_one_event.dart';
part 'formula_one_state.dart';

class FormulaOneBloc extends Bloc<FormulaOneEvent, FormulaOneState> {
  FormulaOneBloc() : super(FormulaOneInitial()) {
    on<FormulaOneEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
