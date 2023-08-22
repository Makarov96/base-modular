import 'package:equatable/equatable.dart';

class CounterEntity extends Equatable {
  final double intCounter;

  const CounterEntity({
    required this.intCounter,
  });
  @override
  List<Object> get props => [intCounter];
}
