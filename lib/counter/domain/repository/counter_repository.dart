import 'package:dartz/dartz.dart';
import 'package:empty/counter/domain/entity/counter_entity.dart';

abstract class CounterRepository {
 Future<Either<Exception,CounterEntity>> getCounter();
}