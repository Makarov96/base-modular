import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:empty/counter/domain/entity/counter_entity.dart';
import 'package:empty/counter/domain/repository/counter_repository.dart';
import 'package:empty/counter/presenter/bloc/counter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCounterRepository extends Mock implements CounterRepository {}

void main() {
  late CounterBloc _tBloc;
  late CounterRepository _mockRepository;
  var modelMock = const CounterEntity(intCounter: 4);
  var exception = Exception();

  setUp(() {
    _mockRepository = MockCounterRepository();
    _tBloc = CounterBloc(repository: _mockRepository);
  });

  group(
    'testt success and failure cases',
    () {
      blocTest<CounterBloc, CounterState>(
        'should be return a failure state',
        setUp: () {
          when(() => _mockRepository.getCounter()).thenAnswer(
            (_) async => Left(exception),
          );
        },
        build: () => _tBloc,
        act: (bloc) => bloc.add(GetCounter()),
        expect: () => [
          CounterLoading(),
          CounterError(
            message: exception.toString(),
          ),
        ],
      );
      blocTest<CounterBloc, CounterState>(
        'should be return a success state',
        setUp: () {
          when(() => _mockRepository.getCounter()).thenAnswer(
            (_) async => Right(modelMock),
          );
        },
        build: () => _tBloc,
        act: (bloc) => bloc.add(GetCounter()),
        expect: () => [
          CounterLoading(),
          CounterLoaded(entity: modelMock),
        ],
      );
    },
  );
}
