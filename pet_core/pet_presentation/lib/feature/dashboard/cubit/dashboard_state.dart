part of 'dashboard_cubit.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.init() = DashboardInitial;
  const factory DashboardState.initScreen(
          List<Widget> screens, List<FABBottomAppBarItem> navBarItems) =
      DashboardInitScreen;
  // const factory DashboardState.loading(bool isLoading) = LoadingState;
  // const factory DashboardState.exception(AppException appException) =
  //     SignInExceptionState;
  // const factory DashboardState.success(SignInResult result) = SignInSuccessState;
}
