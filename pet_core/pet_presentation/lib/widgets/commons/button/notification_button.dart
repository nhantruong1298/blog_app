import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:pet_presentation/resources/app_colors.dart';
import 'package:pet_presentation/resources/app_dimensions.dart';
import 'package:pet_presentation/widgets/commons/typography/body_text.dart';

class NotificationButton extends StatelessWidget {
  final int count;
  final VoidCallback onPressed;
  const NotificationButton({Key? key, required this.onPressed, this.count = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      IconButton(
          onPressed: onPressed,
          splashColor: Colors.transparent,
          padding: const EdgeInsets.only(right: AppDimensions.defaultXSPadding),
          icon: Badge(
            showBadge: count != 0,
            animationType: BadgeAnimationType.scale,
            padding: EdgeInsets.all(count < 10
                ? AppDimensions.defaultXSPadding
                : AppDimensions.defaultXXSPadding),
            badgeContent: BodySText(
              '$count',
              color: AppColors.primaryBackgroundColor,
            ),
            child: Container()
            // Assets.images.notificationIcon.svg(
            //     width: AppDimensions.defaultIconSize,
            //     height: AppDimensions.defaultIconSize,
            //     fit: BoxFit.scaleDown),
          ))
    ]);
  }
}
