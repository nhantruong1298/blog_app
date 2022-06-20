part of 'sign_in_cubit.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState.init() = SignInInitial;
  const factory SignInState.loading(bool isLoading) = LoadingState;
  const factory SignInState.exception(String errorMessage) =
      SignInExceptionState;
  const factory SignInState.success(SignInResult result) = SignInSuccessState;
}
