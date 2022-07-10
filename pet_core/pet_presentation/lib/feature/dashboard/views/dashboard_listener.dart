part of 'dashboard_screen.dart';

extension DashboardListener on _DashBoardScreenState {
  void listener(BuildContext context, DashboardState state) {
    state.maybeWhen(orElse: () {});
  }
}
