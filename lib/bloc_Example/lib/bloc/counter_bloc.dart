import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  void onIncrement() {
    add(AddCounter());
  }

  void onDecrement() {
    add(DecreaseCounter());
  }

  CounterBloc() : super(CounterState(counter: 0)) {
    on<AddCounter>((event, emit) {
      emit(CounterState(counter: state.counter + 1));
    });
    on<DecreaseCounter>((event, emit) {
      if (state.counter > 0) {
        emit(CounterState(counter: state.counter - 1));
      } else {}
    });
  }

// @override
// Stream<CounterState> mapEventToState(CounterEvent event) async* {
//   if (event is AddCounter) {
//     //yield state..counter += 1;
//     yield LatestCounterState(
//         newCounterValue: (state as LatestCounterState).newCounterValue + 1);
//   } else if (event is DecreaseCounter) {
//     //yield state..counter -= 1;
//     yield LatestCounterState(
//         newCounterValue: (state as LatestCounterState).newCounterValue - 1);
//   }
// }
}
