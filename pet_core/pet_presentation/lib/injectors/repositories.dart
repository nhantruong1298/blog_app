import 'package:get_it/get_it.dart';
import 'package:pet_data/networking/service_manager.dart';
import 'package:pet_data/repository/firebase_auth_repository_impl.dart';
import 'package:pet_domain/repository/firebase_auth_repository.dart';

class RepositoryInjector {
  static void configureRepository(GetIt getIt) {
    getIt.registerLazySingleton<FirebaseAuthRepository>(
        () => FirebaseAuthRepositoryImpl(getIt<ServiceManager>()));
  }
}
