import 'package:flutter/material.dart';
import 'package:pet_presentation/app/routes.dart';
import 'package:pet_presentation/feature/sign_in/all.dart';
import 'package:pet_presentation/generated/assets.gen.dart';
import 'package:pet_presentation/resources/app_colors.dart';
import 'package:pet_presentation/resources/app_dimensions.dart';
import 'package:pet_presentation/widgets/commons/layouts/basic_layout.dart';
import 'package:pet_presentation/widgets/commons/loading_indicator/circular_loading.dart';

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
      Future.delayed(const Duration(seconds: 2), () {
        router.goNamed(SignInModule.routeName);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      color: AppColors.primaryColor500,
      automaticallyImplyLeading: false,
      headerVisible: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.blogBg.image(width: 200, height: 200,color: Colors.white),
          Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 2 * AppDimensions.defaultPadding,
                  vertical: AppDimensions.defaultPadding * 3),
              child: const CircularLoading()),
        ],
      ),
    );
  }
}
