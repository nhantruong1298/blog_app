import 'package:go_router/go_router.dart';
import 'package:pet_presentation/feature/dashboard/all.dart';
import 'package:pet_presentation/feature/sign_in/all.dart';
import 'package:pet_presentation/feature/splash/views/splash_screen.dart';

final router = GoRouter(
  
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    SignInModule.buildRoute(),
    DashboardModule.buildRoute()
  ],
);
