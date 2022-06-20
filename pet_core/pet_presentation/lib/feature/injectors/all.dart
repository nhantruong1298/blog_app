import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:pet_presentation/feature/injectors/repositories.dart';

final getIt = GetIt.instance;

FutureOr<GetIt> configureDependencies() async {
  RepositoryInjector.configureRepository(getIt);
  return getIt;
}
