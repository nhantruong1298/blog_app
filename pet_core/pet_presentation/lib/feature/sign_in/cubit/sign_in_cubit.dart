import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_domain/model/authentication/sign_in_result.dart';
import 'package:pet_domain/repository/firebase_repository.dart';
import 'package:pet_presentation/exception/app.exception_handler.dart';
import 'package:pet_presentation/exception/app_exception.dart';
import 'package:pet_presentation/injectors/all.dart';
part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

class SignInCubit extends Cubit<SignInState> {
  late final FirebaseRepository _firebaseAuthRepository;
  late final AppExceptionHandler _appExceptionHandler;
  SignInCubit() : super(const SignInInitial()) {
    _firebaseAuthRepository = getIt<FirebaseRepository>();
    _appExceptionHandler = getIt<AppExceptionHandler>();
  }

  void onSignInPressed(String userName, String password) async {
    emit(const LoadingState(true));
    try {
      final result = await _firebaseAuthRepository.signInWithEmailAndPassword(
          userName, password);

      //print(result.userName);
    } catch (error, stackTrace) {
      final appException =
          _appExceptionHandler.map(error, stackTrace: stackTrace);
      emit(SignInExceptionState(appException));
    } finally {
      emit(const LoadingState(false));
    }
  }
}
