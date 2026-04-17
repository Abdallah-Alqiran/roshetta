import 'package:get_it/get_it.dart';
import 'package:roshetta/core/services/local/cache_helper.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Services
  final cacheHelper = CacheHelper();
  await cacheHelper.init();
  sl.registerLazySingleton<CacheHelper>(() => cacheHelper);

}
