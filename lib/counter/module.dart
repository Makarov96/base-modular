import 'package:empty/counter/data/api/counter_api.dart';
import 'package:empty/counter/domain/repository/counter_repository.dart';
import 'package:empty/counter/presenter/bloc/counter_bloc.dart';
import '../container.dart';

Future<void> counterModule() async {
  locator.registerLazySingleton<CounterRepository>(
    () => CounterApi(client: locator()),
  );

  locator.registerFactory<CounterBloc>(
    () => CounterBloc(
      repository: locator(),
    ),
  );
}
