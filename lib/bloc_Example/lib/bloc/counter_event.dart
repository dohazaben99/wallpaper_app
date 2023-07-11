part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

class AddCounter extends CounterEvent {
  @override
  List<Object?> get props => [];
}

class DecreaseCounter extends CounterEvent {
  @override
  List<Object?> get props => [];
}
