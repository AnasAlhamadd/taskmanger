import 'package:get_it/get_it.dart';
import 'package:untitledtaskmanger/core/database/cache.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
}
