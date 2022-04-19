import 'package:flutter/material.dart';
import 'package:pet_project_flutter/resources/app_dimension.dart';
import 'package:pet_project_flutter/util/colors/app_colors.dart';
import 'package:pet_project_flutter/widgets/commons/typography/body_text.dart';

class HeadingText extends BodyText {
  static get defaultTextStyle => TextStyle(color: AppColors.textColor,
  fontSize: AppDimension.headingTextSize,
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
