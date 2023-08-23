part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {
  const CounterState();
  @override
  List<Object> get props => [];
}

final class CounterInitial extends CounterState {}

final class CounterLoading extends CounterState {}

final class CounterLoaded extends CounterState {
  final CounterEntity entity;

  const CounterLoaded({
    required this.entity,
  });

  @override
  List<Object> get props => [
        entity,
      ];
}

final class CounterError extends CounterState {
  final String message;

  const CounterError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
