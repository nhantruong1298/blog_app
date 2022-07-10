import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_presentation/feature/sign_in/cubit/sign_in_cubit.dart';
import 'package:pet_presentation/feature/sign_in/views/sign_in_screen.dart';

class SignInModule {
  static const String routeName = '/sign-in';
  static const String routePath = '/sign-in';

  static GoRoute buildRoute() {
    return GoRoute(
      path: routePath,
      name: routeName,
      builder: (context, state) {
        return BlocProvider(
          create: (context) => SignInCubit(),
          child: const SignInScreen(),
        );
      },
    );
  }
}
