part of 'sign_in_screen.dart';

extension SignInListener on _SignInScreenState {
  void listener(BuildContext context, SignInState state) {
    state.maybeWhen(
        loading: (isLoading) => toggleLoading(isLoading),
        exception: (appException) =>
            showErrorDialogByAppException(appException),
        success: (result) {
          router.goNamed(DashboardModule.routeName);
        },
        orElse: () {});
  }
}
