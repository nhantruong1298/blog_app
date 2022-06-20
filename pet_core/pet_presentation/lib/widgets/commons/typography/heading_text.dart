import 'package:flutter/material.dart';
import 'package:pet_presentation/resources/app_colors.dart';
import 'package:pet_presentation/resources/app_dimensions.dart';
import 'package:pet_presentation/widgets/commons/typography/body_text.dart';

class HeadingText extends BodyText {
  static get defaultTextStyle => const TextStyle(
      color: AppColors.textColor,
      fontSize: AppDimensions.heading1FontSize,
      fontWeight: FontWeight.w600);
  final String? data;
  final Color? color;
  final TextStyle? style;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  HeadingText(
    this.data, {
    Key? key,
    this.style,
    this.color,
    this.textAlign = TextAlign.left,
    this.overflow,
    this.maxLines,
  }) : super(data,
            color: color,
            key: key,
            maxLines: maxLines,
            overflow: overflow,
            style: style,
            textAlign: textAlign,
            fallbackStyle: defaultTextStyle);
}
