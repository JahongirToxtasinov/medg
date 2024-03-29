import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bnb_event.dart';
part 'bnb_state.dart';

class BnbBloc extends Bloc<BnbEvent, BnbState> {
  BnbBloc() : super(BnbState(activeIndex: 0)) {
    on<IsActiveColor>((event, emit) {
      emit(state.copyWith(activeIndex: event.index));
    });
  }
}