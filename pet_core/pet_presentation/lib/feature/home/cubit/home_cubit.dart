import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_domain/model/authentication/firebase_auth.dart';
import 'package:pet_presentation/exception/app_exception.dart';
import 'package:pet_presentation/feature/authentication/cubit/authentication_cubit.dart';
import 'package:pet_presentation/feature/home/home_cubit_repository.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeCubitRepository _homeCubitRepository;
  final AuthenticationCubit _authenticationCubit;
  HomeCubit(this._homeCubitRepository, this._authenticationCubit)
      : super(const HomeInitial());

  void initScreen(SignInWithEmailResult userData) async {
    final result = await _homeCubitRepository.loadUserTopic(
        _authenticationCubit.state.firebaseAuthResult?.userId ?? '');

    emit(HomeLoadedState(userData.userName ?? ''));
  }
}
