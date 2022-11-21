import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_domain/model/blog/blog.dart';
import 'package:pet_presentation/exception/app.exception_handler.dart';
import 'package:pet_presentation/exception/app_exception.dart';
import 'package:pet_presentation/feature/authentication/cubit/authentication_cubit.dart';
import 'package:pet_presentation/feature/home/home_cubit_repository.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeCubitRepository _homeCubitRepository;
  final AuthenticationCubit _authenticationCubit;
  late final AppExceptionHandler _appExceptionHandler;
  HomeCubit(this._homeCubitRepository, this._authenticationCubit)
      : super(const HomeInitial()) {
    _appExceptionHandler = GetIt.instance.get<AppExceptionHandler>();
  }

  void onInitScreen() async {
    try {
      final loadUserTopicResult = await _homeCubitRepository.loadUserTopic(
          _authenticationCubit.state.firebaseAuthResult?.userId ?? '');

      final loadBlogResult =
          await _homeCubitRepository.loadBlogs(loadUserTopicResult.topics);

      final userName = _authenticationCubit.state.firebaseAuthResult!.userName;

      emit(HomeLoadedState(
         userName ?? '',
        loadBlogResult,
      ));

      

    } catch (error) {
      final appException = _appExceptionHandler.map(error);

      emit(HomeExceptionState(appException));
    }
  }
}
