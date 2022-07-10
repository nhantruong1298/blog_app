import 'package:flutter/material.dart';
import 'package:pet_presentation/resources/app_dimensions.dart';
import 'package:pet_presentation/widgets/commons/typography/body_text.dart';

class ButtonText extends BodyText {
  static const TextStyle defaultStyle = TextStyle(
      fontSize: AppDimensions.bodyMFontSize, fontWeight: FontWeight.w700);
  const ButtonText(
    super.data, {
    super.key,
    super.style,
    super.color,
    super.textAlign = TextAlign.left,
    super.overflow,
    super.maxLines,
  }) : super(fallbackStyle: defaultStyle);
}
