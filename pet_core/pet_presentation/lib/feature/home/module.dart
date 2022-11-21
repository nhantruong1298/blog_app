
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_presentation/feature/authentication/cubit/authentication_cubit.dart';
import 'package:pet_presentation/feature/home/cubit/home_cubit.dart';
import 'package:pet_presentation/feature/home/home_cubit_repository.dart';
import 'package:pet_presentation/feature/home/views/home_screen.dart';

class HomeModule {
  static String routeName = 'home';
  static String routePath = 'home';

  static Widget build() {
    return RepositoryProvider(
      create: (context) => HomeCubitRepository(),
      child: BlocProvider(
        create: (context) => HomeCubit(
          context.read<HomeCubitRepository>(),
          context.read<AuthenticationCubit>()
        ),
        child: const HomeScreen(),
      ),
    );
  }
}
