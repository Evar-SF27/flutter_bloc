part of 'counter_bloc.dart';

sealed class CounterEvent {}

final class CounterIncremented implements CounterEvent {}

final class CounterDecremented implements CounterEvent {}
