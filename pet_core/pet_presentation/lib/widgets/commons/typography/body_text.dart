import 'package:flutter/material.dart';
import 'package:pet_presentation/colors/app_colors.dart';
import 'package:pet_presentation/resources/app_dimension.dart';

class BodyText extends StatelessWidget {
  final String? data;
  final Color? color;
  final TextStyle? style;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextStyle? fallbackStyle;
  BodyText(this.data,
      {Key? key,
      this.style,
      this.color,
      this.textAlign = TextAlign.left,
      this.overflow,
      this.maxLines,
      this.fallbackStyle});

  static TextStyle get defaultStyle => TextStyle(
      color: AppColors.textColor,
      fontSize: AppDimension.bodyMFontSize,
      height: 1.5);

  TextStyle getTextStyle(Color? color, TextStyle? style) {
    TextStyle mergedStyle;
    TextStyle clonedStyle = (fallbackStyle ?? defaultStyle).copyWith();
    mergedStyle = (style != null) ? clonedStyle.merge(style) : clonedStyle;

    if (color != null) {
      mergedStyle = mergedStyle.copyWith(color: color);
    }
    return mergedStyle;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      data ?? '',
      key: key,
      style: getTextStyle(color, style),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }

  factory BodyText.medium(
    String? data, {
    Key? key,
    TextStyle? style,
    Color? color,
    TextAlign textAlign = TextAlign.left,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      BodyText(data,
          color: color,
          key: key,
          maxLines: maxLines,
          overflow: overflow,
          style: (style ?? TextStyle())
              .copyWith(fontWeight: FontWeight.w500),
          textAlign: textAlign);

  factory BodyText.bold(
    String? data, {
    Key? key,
    TextStyle? style,
    Color? color,
    TextAlign textAlign = TextAlign.left,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      BodyText(data,
          color: color,
          key: key,
          maxLines: maxLines,
          overflow: overflow,
          style: (style ??TextStyle())
              .copyWith(fontWeight: FontWeight.w600),
          textAlign: textAlign);

  factory BodyText.bolder(
    String? data, {
    Key? key,
    TextStyle? style,
    Color? color,
    TextAlign textAlign = TextAlign.left,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      BodyText(data,
          color: color,
          key: key,
          maxLines: maxLines,
          overflow: overflow,
          style: (style ?? TextStyle())
              .copyWith(fontWeight: FontWeight.w700),
          textAlign: textAlign);
}
