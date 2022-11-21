part of 'authentication_cubit.dart';

// * this cubit is used for storing all security related variable and data
// ! only used to store credientials
// ! do not store password here!!
@immutable
class AuthenticationState extends Equatable {
  final bool isSignedIn;
  final SignInWithEmailResult? firebaseAuthResult;
  const AuthenticationState({this.isSignedIn = false, this.firebaseAuthResult});

  @override
  List<Object?> get props => [isSignedIn, firebaseAuthResult];

  AuthenticationState copyWith(
      {bool? isSignedIn, SignInWithEmailResult? fireBaseAuthResult}) {
    return AuthenticationState(
        isSignedIn: isSignedIn ?? this.isSignedIn,
        firebaseAuthResult: firebaseAuthResult);
  }
}
