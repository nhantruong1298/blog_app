import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:pet_presentation/exception/app.exception_handler.dart';
import 'package:pet_presentation/exception/app_global_exception_handler.dart';
import 'package:pet_presentation/injectors/repositories.dart';

final getIt = GetIt.instance;

FutureOr<GetIt> configureDependencies() async {
  RepositoryInjector.configureRepository(getIt);


   //* AppGlobalExceptionHandler
  getIt.registerLazySingleton<AppGlobalExceptionHandler>(
      () => AppGlobalExceptionHandler());

  //* AppGlobalExceptionHandler
  getIt.registerLazySingleton<AppExceptionHandler>(
      () => AppExceptionHandler(getIt<AppGlobalExceptionHandler>()));

  return getIt;
}
