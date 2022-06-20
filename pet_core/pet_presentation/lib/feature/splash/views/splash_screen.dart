import 'package:flutter/material.dart';
import 'package:pet_presentation/app/routes.dart';
import 'package:pet_presentation/feature/sign_in/all.dart';
import 'package:pet_presentation/widgets/commons/layouts/basic_layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      router.goNamed(SignInModule.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const BasicLayout(
      child: Center(
        child: Text('Splash screen'),
      ),
    );
  }
}
