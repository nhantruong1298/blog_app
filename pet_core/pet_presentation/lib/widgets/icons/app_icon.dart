import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_presentation/generated/assets.gen.dart';
import 'package:pet_presentation/generated/extension.dart';
import 'package:pet_presentation/resources/app_dimensions.dart';

class AppIcon extends StatelessWidget {
  final String? icon;
  final double size;
  final BoxFit fit;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final Color? color;

  const AppIcon(
      {super.key,
      this.icon,
      this.size = AppDimensions.defaultIconSize,
      this.fit = BoxFit.scaleDown,
      this.padding = EdgeInsets.zero,
      this.color,
      this.child})
      : assert(icon != null || child != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: icon != null
          ? SvgPicture.asset(
              icon!,
              fit: fit,
              width: size,
              height: size,
              // color: color,
            )
          : child ?? Container(),
    );
  }

  // factory AppIcon.svg(
  //   String path, {
  //   double size = AppDimensions.defaultIconSize,
  //   bool absolutePath = false,
  //   BoxFit fit = BoxFit.scaleDown,
  //   Color? color,
  // }) {
  //   return AppIcon(
  //     icon: absolutePath ? path : AssetsGen.getRawString(path),
  //     size: size,
  //     fit: fit,
  //     color: color,
  //   );
  // }

  factory AppIcon.asset(
    SvgGenImage icon, {
    double size = AppDimensions.defaultIconSize,
    bool absolutePath = false,
    BoxFit fit = BoxFit.scaleDown,
    Color? color,
  }) {
    return AppIcon(
      icon: AssetsGen.getRawString(icon.path),
      size: size,
      fit: fit,
      color: color,
    );
  }
}
