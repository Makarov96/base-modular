import 'package:bloc/bloc.dart';
import 'package:empty/counter/domain/repository/counter_repository.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final CounterRepository _repository;

  CounterBloc(CounterRepository repository)
      : _repository = repository,
        super(CounterInitial()) {
    on<CounterEvent>((event, emit) {});
  }
}
