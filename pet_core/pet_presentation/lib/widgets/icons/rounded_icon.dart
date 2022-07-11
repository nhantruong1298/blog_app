import 'package:flutter/material.dart';
import 'package:pet_presentation/generated/extension.dart';
import 'package:pet_presentation/resources/app_colors.dart';
import 'package:pet_presentation/resources/app_dimensions.dart';

import 'app_icon.dart';

class RoundedIcon extends AppIcon {
  final Color? borderColor;
  final double iconPadding;
  final Color? backgroundColor;

  const RoundedIcon(
      {super.key,
      super.child,
      super.color,
      this.borderColor,
      super.icon,
      super.size = AppDimensions.defaultIconSizeSmall,
      super.padding,
      this.iconPadding = 3,
      this.backgroundColor,
      super.fit = BoxFit.scaleDown});

  double get _circleSize {
    return size + iconPadding;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        width: _circleSize,
        height: _circleSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.borderColor,
            borderRadius: BorderRadius.circular(_circleSize / 2),
            border: Border.all(
                color: borderColor ?? AppColors.borderColor, width: 0.5)),
        child: child ?? super.build(context));
  }

  static Widget svg(
    String path, {
    Key? key,
    Widget? child,
    Color? color,
    Color? borderColor,
    Color? backgroundColor,
    double size = AppDimensions.defaultIconSizeSmall,
    EdgeInsetsGeometry? padding,
    double iconPadding = 3,
    BoxFit fit = BoxFit.scaleDown,
    bool absolutePath = false,
  }) {
    return RoundedIcon(
      icon: absolutePath ? path : AssetsGen.getRawString(path),
      size: size,
      borderColor: borderColor,
      child: child,
      color: color,
      fit: fit,
      iconPadding: iconPadding,
      key: key,
      padding: padding,
      backgroundColor: backgroundColor,
    );
  }
}
