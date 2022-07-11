import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_presentation/feature/utils/size_config.dart';
import 'package:pet_presentation/generated/assets.gen.dart';
import 'package:pet_presentation/resources/app_colors.dart';
import 'package:pet_presentation/resources/app_dimensions.dart';
import 'package:pet_presentation/widgets/Spacing.dart';
import 'package:pet_presentation/widgets/commons/typography/body_text.dart';

class AppBarHome extends StatelessWidget {
  final VoidCallback? onAvatarPressed;
  final String? userName;
  const AppBarHome({Key? key, this.onAvatarPressed, this.userName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: SizeConfig.getProportionateScreenHeight(93),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: AppColors.primaryLightColor,
      centerTitle: false,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize:
            Size.fromHeight(SizeConfig.getProportionateScreenHeight(93)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.defaultPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BodySText(
                        'Welcome',
                        color: AppColors.textColor,
                      ),
                      BodyMText(userName,
                          style: BodyMText.defaultStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor500,
                          )),
                      const Spacing(1)
                    ]),
              ),
              _buildHomeAction(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHomeAction() {
    return Column(
      children: [
        const Spacing(.5),
        ClipRRect(
          borderRadius: BorderRadius.circular(AppDimensions.roundedRadius),
          child: Assets.images.avartaIcon.svg(
              fit: BoxFit.scaleDown, height: AppDimensions.defaultIconSize),
        ),
      ],
    );
  }
}
