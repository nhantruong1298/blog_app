import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_presentation/base/base_screen.dart';
import 'package:pet_presentation/feature/dashboard/cubit/dashboard_cubit.dart';
import 'package:pet_presentation/feature/utils/size_config.dart';
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
  Widget builder(BuildContext context) {
    SizeConfig.init(context);
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: listener,
      buildWhen: (_, current) => current is DashboardInitScreen,
      builder: (_, state) {
        if (state is! DashboardInitScreen) {
          return const SizedBox();
        }

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
