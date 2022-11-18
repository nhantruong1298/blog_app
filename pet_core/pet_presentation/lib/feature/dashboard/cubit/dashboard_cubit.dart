import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_presentation/feature/home/module.dart';
import 'package:pet_presentation/feature/home/views/home_screen.dart';
import 'package:pet_presentation/generated/assets.gen.dart';
import 'package:pet_presentation/widgets/icons/app_icon.dart';
import 'package:pet_presentation/widgets/layouts/tab_layout/fab_bottom_app_bar.dart';

part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardInitial());
  void initScreen() {
    _initDashboardTabs();
  }

  Future<void> _initDashboardTabs() async {
    const double inActiveIconSize = 22;
    const double activeIconSize = 24;

    List<Widget> screens = [
      HomeModule.build(),
      Container(),
    ];

    List<FABBottomAppBarItem> items = [
      FABBottomAppBarItem(
        icon: AppIcon.asset(
          Assets.images.homeIcon,
          size: inActiveIconSize,
        ),
        activeIcon: AppIcon.asset(
          Assets.images.homeIcon,
          size: activeIconSize,
        ),
        title: 'Home',
      ),
      FABBottomAppBarItem(
        icon: AppIcon.asset(
          Assets.images.homeIcon,
          size: inActiveIconSize,
        ),
        activeIcon: AppIcon.asset(
          Assets.images.homeIcon,
          size: activeIconSize,
        ),
        title: 'Home',
      ),
    ];

    emit(DashboardInitScreen(screens, items));
  }

  void onDoubleTap(int value) {}
}
