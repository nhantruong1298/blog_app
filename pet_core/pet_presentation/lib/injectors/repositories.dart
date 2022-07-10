import 'package:get_it/get_it.dart';
import 'package:pet_data/networking/service_manager.dart';
import 'package:pet_domain/repository/firebase_repository.dart';
import 'package:pet_data/repository/firebase_repository_impl.dart';

class RepositoryInjector {
  static void configureRepository(GetIt getIt) {
    getIt.registerLazySingleton<FirebaseRepository>(
        () => FirebaseRepositoryImpl(getIt<ServiceManager>()));
  }
}
