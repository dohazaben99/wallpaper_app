part of 'counter_bloc.dart';

//
// abstract class CounterState extends Equatable {
//   const CounterState();
// }
//
// class LatestCounterState extends CounterState {
//   final int newCounterValue;
//
//    LatestCounterState({required this.newCounterValue});
//
//   @override
//   List<Object> get props => [LatestCounterState];
// }
//
// // class CounterAddState extends CounterState {
// //   @override
// //   List<Object> get props => [];
// // }
// //
// // class CounterDecreaseState extends CounterState {
// //   @override
// //   List<Object> get props => [];
// // }
// //
// // class CounterSevenSate extends CounterState {
// //   @override
// //   List<Object> get props => [];
// // }
class CounterState {
  late int counter;

  CounterState._();

  CounterState({this.counter = 0}); //add this line

  factory CounterState.initial() {
    return CounterState._()..counter = 0;
  }
}
