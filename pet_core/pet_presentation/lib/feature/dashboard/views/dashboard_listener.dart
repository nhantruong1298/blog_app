part of 'dashboard_screen.dart';

extension DashboardListener on _DashBoardScreenState {
  void listener(BuildContext context, DashboardState state) {
    state.maybeWhen(
        initScreen: (List<Widget> screens, __) {
          // ignore: invalid_use_of_protected_member
          setState(() {
            _tabController = TabController(length: screens.length, vsync: this);
          });
        },
        orElse: () {});
  }
}
