import 'package:get_it/get_it.dart';
import 'package:pet_data/data_source/data_storage.dart';
import 'package:pet_data/networking/service_manager.dart';
import 'package:pet_data/repository/log_service_impl.dart';
import 'package:pet_domain/repository/log_service.dart';

class DataSourceInjector {
  static void configureRepository(GetIt getIt) {
    _registerDataStore(getIt);
  }

  static void _registerDataStore(
    GetIt getIt,
  ) {
    getIt.registerLazySingleton<LogService>(() => LogServiceImpl());
    getIt.registerLazySingleton<DataStorage>(() => DataStorage());

    getIt.registerSingleton<ServiceManager>(ServiceManager(
      getIt<DataStorage>(),
      getIt<LogService>(),
    ));
  }
}
