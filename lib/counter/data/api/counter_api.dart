import 'package:dartz/dartz.dart';
import 'package:empty/counter/data/model/counter_model.dart';
import 'package:empty/counter/domain/entity/counter_entity.dart';
import 'package:empty/counter/domain/repository/counter_repository.dart';
import 'package:http/http.dart' as http;

class CounterApi extends CounterRepository {
  http.Client _client;
  CounterApi(http.Client client) : _client = client;

  @override
  Future<Either<Exception, CounterEntity>> getCounter() async {
    final data =  {'intCounter': 0};
    try {
      final api = CounterModel.fromJson(data);
      return Right(api);
    } catch (e) {
      return Left(Exception());
    }
  }
}
