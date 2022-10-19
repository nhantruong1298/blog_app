import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_domain/model/authentication/firebase_auth.dart';
import 'package:pet_presentation/exception/app_exception.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitial());

  void initScreen(FireBaseAuthResult userData) {
    emit(HomeLoadedState(userData.userName ?? ''));
  }
}
