import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_presentation/base/base_screen.dart';
import 'package:pet_presentation/feature/dashboard/cubit/dashboard_cubit.dart';
import 'package:pet_presentation/resources/app_colors.dart';
import 'package:pet_presentation/widgets/layouts/tab_layout/tab_layout.dart';
part 'dashboard_listener.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends BaseScreenState<DashBoardScreen>
    with SingleTickerProviderStateMixin {
  // List<Widget> _screens = [];
  // List<FABBottomAppBarItem> _navBarsItems = [];
  TabController? _tabController;

  DashboardCubit get dashboardCubit => BlocProvider.of<DashboardCubit>(context);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dashboardCubit.initScreen();
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget builder(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: listener,
      builder: (_, state) {
        if (state is! DashboardInitScreen) {
          return const SizedBox();
        }

        _tabController =
            TabController(length: state.screens.length, vsync: this);

        return TabLayout(
          darkMode: true,
          swipeable: false,
          appBarColor: AppColors.secondaryColor,
          headerVisible: false,
          color: AppColors.primaryLightColor,
          bottomAppBarColor: AppColors.greyColor800,
          bottomAppBarActiveColor: AppColors.primaryColor500,
          items: state.navBarItems,
          screens: state.screens,
          controller: _tabController,
          onDoubleTap: dashboardCubit.onDoubleTap,
        );
      },
    );
  }
}
