import 'package:flutter/material.dart';
import 'package:pet_presentation/resources/app_colors.dart';
import 'package:pet_presentation/resources/app_dimensions.dart';
import 'package:pet_presentation/widgets/commons/typography/body_text.dart';

class HeadingText extends BodyText {
  static get defaultStyle => TextStyle(
      color: AppColors.textColor,
      fontSize: AppDimensions.headingFontSize,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.01,
      height: 1.5);

  HeadingText(
    super.data, {
    super.key,
    super.style,
    super.color,
    super.textAlign = TextAlign.left,
    super.overflow,
    super.maxLines,
  }) : super(fallbackStyle: defaultStyle);
}

class Heading1Text extends BodyText {
  static get defaultStyle => TextStyle(
      color: AppColors.textColor,
      fontSize: AppDimensions.heading1FontSize,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.01,
      height: 1.5);

  Heading1Text(
    super.data, {
    super.key,
    super.style,
    super.color,
    super.textAlign = TextAlign.left,
    super.overflow,
    super.maxLines,
  }) : super(fallbackStyle: defaultStyle);
}

class Heading2Text extends BodyText {
  static get defaultStyle => TextStyle(
      color: AppColors.textColor,
      fontSize: AppDimensions.heading2FontSize,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.01,
      height: AppDimensions.headingHeight);
  static const TextAlign defaultTextAlign = TextAlign.start;

  Heading2Text(
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
      Heading2Text(data ?? '',
          color: color,
          style: (style ?? const TextStyle())
              .copyWith(fontWeight: FontWeight.w500),
          overflow: overflow,
          textAlign: textAlign,
          maxLines: maxLines);

  static Heading2Text bold(
    String? data, {
    TextStyle? style,
    Color? color,
    TextAlign textAlign = TextAlign.left,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      Heading2Text(data ?? '',
          color: color,
          style: (style ?? const TextStyle())
              .copyWith(fontWeight: FontWeight.w600),
          overflow: overflow,
          textAlign: textAlign,
          maxLines: maxLines);

  static Heading2Text bolder(
    String? data, {
    TextStyle? style,
    Color? color,
    TextAlign textAlign = TextAlign.left,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      Heading2Text(data ?? '',
          color: color,
          style: (style ?? const TextStyle())
              .copyWith(fontWeight: FontWeight.w700),
          overflow: overflow,
          textAlign: textAlign,
          maxLines: maxLines);
}

class Heading3Text extends BodyText {
  static get defaultStyle => TextStyle(
      color: AppColors.textColor,
      fontSize: AppDimensions.heading3FontSize,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.01,
      height: 1.5);
  static const TextAlign defaultTextAlign = TextAlign.start;

  Heading3Text(
    super.data, {
    super.key,
    super.style,
    super.color,
    super.textAlign = TextAlign.left,
    super.overflow,
    super.maxLines,
  }) : super(fallbackStyle: defaultStyle);
}

class Heading4Text extends BodyText {
  static get defaultStyle => TextStyle(
      color: AppColors.textColor,
      fontSize: AppDimensions.heading4FontSize,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.01,
      height: 1.5);
  static const TextAlign defaultTextAlign = TextAlign.start;

  Heading4Text(
    super.data, {
    super.key,
    super.style,
    super.color,
    super.textAlign = TextAlign.left,
    super.overflow,
    super.maxLines,
  }) : super(fallbackStyle: defaultStyle);
}
