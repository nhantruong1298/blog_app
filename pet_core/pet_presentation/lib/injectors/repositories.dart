import 'package:get_it/get_it.dart';
import 'package:pet_data/networking/service_manager.dart';
import 'package:pet_data/repository/blog_repository_impl.dart';
import 'package:pet_data/repository/firebase_auth_repository_impl.dart';
import 'package:pet_data/repository/topic_repository_impl.dart';
import 'package:pet_domain/repository/blog_repository.dart';
import 'package:pet_domain/repository/firebase_auth_repository.dart';
import 'package:pet_domain/repository/topic_repository.dart';
import 'package:pet_presentation/injectors/data_sources.dart';

class RepositoryInjector {
  static void configureRepository(GetIt getIt) {
    final dataMapperInjector = getIt<DataMapperInjector>();

    getIt.registerLazySingleton<FirebaseAuthRepository>(
        () => FirebaseAuthRepositoryImpl(getIt<ServiceManager>()));

    getIt.registerLazySingleton<TopicRepository>(
        () => TopicRepositoryImpl(getIt<ServiceManager>(),dataMapperInjector.topicDataMapper));

     getIt.registerLazySingleton<BlogRepository>(
        () => BlogRepositoryImpl(getIt<ServiceManager>(),dataMapperInjector.blogDataMapper));
  }
}
