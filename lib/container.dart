import 'package:empty/counter/module.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

Future<void> init() async {
  //thirds part dependencies
  locator.registerLazySingleton(() => http.Client());

  //core modules

  //features modules
  counterModule();
}
