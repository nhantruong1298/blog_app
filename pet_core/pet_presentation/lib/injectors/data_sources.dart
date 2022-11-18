import 'package:get_it/get_it.dart';
import 'package:pet_data/data_source/data_storage.dart';
import 'package:pet_data/mapper/blog_data_mapper.dart';
import 'package:pet_data/mapper/topic_data_mapper.dart';
import 'package:pet_data/networking/service_manager.dart';
import 'package:pet_data/repository/log_service_impl.dart';
import 'package:pet_domain/repository/log_service.dart';

class DataSourceInjector {
  static void configureRepository(GetIt getIt) {
    _registerDataMapper(getIt);
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

  static void _registerDataMapper(GetIt getIt) {
    getIt.registerLazySingleton<DataMapperInjector>(() => DataMapperInjector());
  }
}

class DataMapperInjector {
  TopicDataMapper get topicDataMapper => TopicDataMapper();

  BlogDataMapper get blogDataMapper => BlogDataMapper();
}
