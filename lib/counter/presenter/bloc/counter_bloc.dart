import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:empty/counter/domain/entity/counter_entity.dart';
import 'package:empty/counter/domain/repository/counter_repository.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final CounterRepository _repository;

  CounterBloc({
    required CounterRepository repository,
  })  : _repository = repository,
        super(CounterInitial()) {
    on<GetCounter>(_getCOunter);
  }

  FutureOr _getCOunter(GetCounter event, Emitter<CounterState> emit) async {
    emit(CounterLoading());
    final either = await _repository.getCounter();

    either.fold(
      (l) => emit(CounterError(
        message: l.toString(),
      )),
      (r) => emit(
        CounterLoaded(entity: r),
      ),
    );
  }
}
