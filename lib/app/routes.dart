import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_project_flutter/features/sign_in/views/sign_in.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
        path: '/signIn',
        builder: (BuildContext context, GoRouterState state) {
          return const SignInScreen();
        }),
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SignInScreen();
        }),
  ],
);
