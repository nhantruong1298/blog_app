import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pet_domain/model/authentication/firebase_auth.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(const AuthenticationState(isSignedIn: false));

  void authenticateWithFirebase({required FireBaseAuthResult data}) {
    emit(state.copyWith(isSignedIn: true, fireBaseAuthResult: data));
  }
}
