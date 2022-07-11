import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_presentation/base/base_screen.dart';
import 'package:pet_presentation/feature/authentication/cubit/authentication_cubit.dart';
import 'package:pet_presentation/feature/home/cubit/home_cubit.dart';
import 'package:pet_presentation/feature/home/views/widgets/app_bar_home.dart';
import 'package:pet_presentation/feature/utils/size_config.dart';
import 'package:pet_presentation/generated/assets.gen.dart';
import 'package:pet_presentation/resources/app_colors.dart';
import 'package:pet_presentation/resources/app_dimensions.dart';
import 'package:pet_presentation/widgets/commons/layouts/basic_layout.dart';
import 'package:pet_presentation/widgets/commons/typography/body_text.dart';
import 'package:pet_presentation/widgets/icons/rounded_icon.dart';
import 'package:pet_presentation/widgets/spacing.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseScreenState<HomeScreen> {
  AuthenticationCubit get authenticationCubit =>
      BlocProvider.of<AuthenticationCubit>(context);
  HomeCubit get homeCubit => BlocProvider.of<HomeCubit>(context);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeCubit.initScreen(authenticationCubit.state.firebaseAuthResult!);
    });
  }

  @override
  Widget builder(BuildContext context) {
    return BasicLayout(
      padding: EdgeInsets.zero,
      appBar: _buildAppBar(),
      child:
          Container(color: AppColors.greyColor300, child: Column(children: [])),
    );
  }

  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize:
          Size.fromHeight(SizeConfig.getProportionateScreenHeight(93)),
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) => current is HomeLoadedState,
        builder: (_, state) {
          if (state is! HomeLoadedState) return const SizedBox();
          final userName = state.userName;
          return AppBarHome(
            userName: userName,
            onAvatarPressed: () {},
          );
        },
      ),
    );
  }
}

