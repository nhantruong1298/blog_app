// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pet_presentation/resources/app_colors.dart';
import 'package:pet_presentation/resources/app_dimensions.dart';

class BodyText extends StatelessWidget {
  final String? data;
  final Color? color;
  final TextStyle? style;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextStyle? fallbackStyle;
  const BodyText(this.data,
      {Key? key,
      this.style,
      this.color,
      this.textAlign = TextAlign.left,
      this.overflow,
      this.maxLines,
      this.fallbackStyle}) : super(key: key);

  static  TextStyle get defaultStyle => const TextStyle(
      color: AppColors.textColor,
      fontSize: AppDimensions.bodyMFontSize,
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
          style: (style ?? TextStyle()).copyWith(fontWeight: FontWeight.w500),
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
          style: (style ?? TextStyle()).copyWith(fontWeight: FontWeight.w600),
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
          style: (style ?? TextStyle()).copyWith(fontWeight: FontWeight.w700),
          textAlign: textAlign);
}

class BodyMText extends BodyText {
  static TextStyle get defaultStyle => TextStyle(
      fontSize: AppDimensions.bodyMFontSize,
      color: AppColors.textColor,
      height: 1.5,
      letterSpacing: -0.01);

  BodyMText(
    super.data, {
    super.key,
    super.style,
    super.color,
    super.textAlign = TextAlign.left,
    super.overflow,
    super.maxLines,
  }) : super(fallbackStyle: defaultStyle);

  static BodyText medium(
    String? data, {
    TextStyle? style,
    Color? color,
    TextAlign textAlign = TextAlign.left,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      BodyText(data ?? '',
          color: color,
          style: (style ?? const TextStyle())
              .copyWith(fontWeight: FontWeight.w500),
          overflow: overflow,
          textAlign: textAlign,
          maxLines: maxLines,
          fallbackStyle: defaultStyle);

  static BodyText bold(
    String? data, {
    TextStyle? style,
    Color? color,
    TextAlign textAlign = TextAlign.left,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      BodyText(data ?? '',
          color: color,
          style: (style ?? const TextStyle())
              .copyWith(fontWeight: FontWeight.w600),
          overflow: overflow,
          textAlign: textAlign,
          maxLines: maxLines,
          fallbackStyle: defaultStyle);

  static BodyText bolder(
    String? data, {
    TextStyle? style,
    Color? color,
    TextAlign textAlign = TextAlign.left,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      BodyText(data ?? '',
          color: color,
          style: (style ?? const TextStyle())
              .copyWith(fontWeight: FontWeight.w700),
          overflow: overflow,
          textAlign: textAlign,
          maxLines: maxLines,
          fallbackStyle: defaultStyle);
}

class BodySText extends BodyText {
  static TextStyle get defaultStyle => TextStyle(
      fontSize: AppDimensions.bodySFontSize,
      color: AppColors.textColor,
      height: 1.5,
      letterSpacing: -0.01);

  BodySText(
    super.data, {
    super.key,
    super.style,
    super.color,
    super.textAlign = TextAlign.left,
    super.overflow,
    super.maxLines,
  }) : super(fallbackStyle: defaultStyle);

  static BodyText medium(
    String? data, {
    TextStyle? style,
    Color? color,
    TextAlign textAlign = TextAlign.left,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      BodyText(
        data ?? '',
        color: color,
        style:
            (style ?? const TextStyle()).copyWith(fontWeight: FontWeight.w500),
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
        fallbackStyle: defaultStyle,
      );

  static BodyText bold(
    String? data, {
    TextStyle? style,
    Color? color,
    TextAlign textAlign = TextAlign.left,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      BodyText(
        data ?? '',
        color: color,
        style:
            (style ?? const TextStyle()).copyWith(fontWeight: FontWeight.w600),
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
        fallbackStyle: defaultStyle,
      );

  static BodyText bolder(
    String? data, {
    TextStyle? style,
    Color? color,
    TextAlign textAlign = TextAlign.left,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      BodyText(
        data ?? '',
        color: color,
        style:
            (style ?? const TextStyle()).copyWith(fontWeight: FontWeight.w700),
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
        fallbackStyle: defaultStyle,
      );
}

class BodyXLText extends BodyText {
  static TextStyle get defaultStyle => TextStyle(
      fontSize: AppDimensions.bodyXLFontSize,
      color: AppColors.textColor,
      height: 1.5,
      letterSpacing: -0.01);

  BodyXLText(
    super.data, {
    super.key,
    super.style,
    super.color,
    super.textAlign = TextAlign.left,
    super.overflow,
    super.maxLines,
  }) : super(fallbackStyle: defaultStyle);

  static BodyText medium(
    String? data, {
    TextStyle? style,
    Color? color,
    TextAlign textAlign = TextAlign.left,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      BodyText(
        data ?? '',
        color: color,
        style:
            (style ?? const TextStyle()).copyWith(fontWeight: FontWeight.w500),
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
        fallbackStyle: defaultStyle,
      );

  static BodyText bold(
    String? data, {
    TextStyle? style,
    Color? color,
    TextAlign textAlign = TextAlign.left,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      BodyText(
        data ?? '',
        color: color,
        style:
            (style ?? const TextStyle()).copyWith(fontWeight: FontWeight.w600),
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
        fallbackStyle: defaultStyle,
      );

  static BodyText bolder(
    String? data, {
    TextStyle? style,
    Color? color,
    TextAlign textAlign = TextAlign.left,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      BodyText(
        data ?? '',
        color: color,
        style:
            (style ?? const TextStyle()).copyWith(fontWeight: FontWeight.w700),
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
        fallbackStyle: defaultStyle,
      );
}

class BodyLText extends BodyText {
  static TextStyle get defaultStyle => TextStyle(
      fontSize: AppDimensions.bodyLFontSize,
      color: AppColors.textColor,
      height: 1.5,
      letterSpacing: -0.01);

  BodyLText(
    super.data, {
    super.key,
    super.style,
    super.color,
    super.textAlign = TextAlign.left,
    super.overflow,
    super.maxLines,
  }) : super(fallbackStyle: defaultStyle);

  static BodyText light(
    String? data, {
    TextStyle? style,
    Color? color,
    TextAlign textAlign = TextAlign.left,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      BodyText(
        data ?? '',
        color: color,
        style:
            (style ?? const TextStyle()).copyWith(fontWeight: FontWeight.w400),
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
        fallbackStyle: defaultStyle,
      );

  static BodyText medium(
    String? data, {
    TextStyle? style,
    Color? color,
    TextAlign textAlign = TextAlign.left,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      BodyText(
        data ?? '',
        color: color,
        style:
            (style ?? const TextStyle()).copyWith(fontWeight: FontWeight.w500),
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
        fallbackStyle: defaultStyle,
      );

  static BodyText bold(
    String? data, {
    TextStyle? style,
    Color? color,
    TextAlign textAlign = TextAlign.left,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      BodyText(
        data ?? '',
        color: color,
        style:
            (style ?? const TextStyle()).copyWith(fontWeight: FontWeight.w600),
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
        fallbackStyle: defaultStyle,
      );

  static BodyText bolder(
    String? data, {
    TextStyle? style,
    Color? color,
    TextAlign textAlign = TextAlign.left,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      BodyText(
        data ?? '',
        color: color,
        style:
            (style ?? const TextStyle()).copyWith(fontWeight: FontWeight.w700),
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
        fallbackStyle: defaultStyle,
      );
}

class BodyXXSText extends BodyText {
  static TextStyle get defaultStyle => TextStyle(
      fontSize: AppDimensions.descriptionSFontSize,
      color: AppColors.textColor,
      height: 1.5,
      letterSpacing: -0.01);

  BodyXXSText(
    super.data, {
    super.key,
    super.style,
    super.color,
    super.textAlign = TextAlign.left,
    super.overflow,
    super.maxLines,
  }) : super(fallbackStyle: defaultStyle);

  static BodyText light(
    String? data, {
    TextStyle? style,
    Color? color,
    TextAlign textAlign = TextAlign.left,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      BodyText(
        data ?? '',
        color: color,
        style:
            (style ?? const TextStyle()).copyWith(fontWeight: FontWeight.w400),
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
        fallbackStyle: defaultStyle,
      );

  static BodyText medium(
    String? data, {
    TextStyle? style,
    Color? color,
    TextAlign textAlign = TextAlign.left,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      BodyText(
        data ?? '',
        color: color,
        style:
            (style ?? const TextStyle()).copyWith(fontWeight: FontWeight.w500),
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
        fallbackStyle: defaultStyle,
      );

  static BodyText bold(
    String? data, {
    TextStyle? style,
    Color? color,
    TextAlign textAlign = TextAlign.left,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      BodyText(
        data ?? '',
        color: color,
        style:
            (style ?? const TextStyle()).copyWith(fontWeight: FontWeight.w600),
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
        fallbackStyle: defaultStyle,
      );

  static BodyText bolder(
    String? data, {
    TextStyle? style,
    Color? color,
    TextAlign textAlign = TextAlign.left,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      BodyText(
        data ?? '',
        color: color,
        style:
            (style ?? const TextStyle()).copyWith(fontWeight: FontWeight.w700),
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
        fallbackStyle: defaultStyle,
      );
}

class BodyXSText extends BodyText {
  static TextStyle get defaultStyle => TextStyle(
      fontSize: AppDimensions.bodyXSFontSize,
      color: AppColors.textColor,
      height: 1.5,
      letterSpacing: -0.02);
  BodyXSText(
    super.data, {
    super.key,
    super.style,
    super.color,
    super.textAlign = TextAlign.left,
    super.overflow,
    super.maxLines,
  }) : super(fallbackStyle: defaultStyle);
}
