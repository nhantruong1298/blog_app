import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_presentation/feature/dashboard/cubit/dashboard_cubit.dart';
import 'package:pet_presentation/feature/dashboard/views/dashboard_screen.dart';

class DashboardModule {
  static const String routeName = '/dashboard';
  static const String routePath = '/dashboard';

  static GoRoute buildRoute() {
    return GoRoute(
      path: routePath,
      name: routeName,
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => DashboardCubit()),
          ],
          child: const DashBoardScreen(),
        );
      },
    );
  }
}
