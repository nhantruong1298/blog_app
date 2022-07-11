import 'package:flutter/material.dart';

class AppColors {
  static const Color borderColor = Color(0xFFCED0D6);
  static const Color lighterBorderColor = Color(0xFFDADADA);

  static const dialog_background_color = Color(0x00000000);
  static const loading_background = Color(0xff2E3479);
  static const text_highlight = Color(0XFF4C4C4C);
  static const button_negative = Color(0xFFbbbbbb);
  static const text_normal = Color(0xFF898989);
  static const floatingLabel = Color(0xFF494C57);

  static const dialogBackGroundColor = Color(0xFF000000);
  static final dialogBackDropColor = const Color(0xFF16171C).withOpacity(.5);
  // Color palettle
  // static Color get primaryColor =>
  //     LunaApplication.appConfig().primaryColor ?? const Color(0xFF4F32E2);

  static const primaryColor500 = Color(0xFF1877f2);
  static const primaryColor400 = Color(0xFF3e8df4);
  static const primaryColor300 = Color(0xFF6ea9f7);
  static const primaryColor200 = Color(0xFF9fc6f9);
  static const primaryColor100 = Color(0xFFDEDDFD);

  static const secondaryColor = Color(0xFF2E3479);
  static const secondaryDarkColor = Color(0x80141419);

  static const tertiaryColor = Color(0xFF76B5FF);
  static const terliaryColor400 = Color(0xFF98CCFF);
  static const terliaryColor300 = Color(0xFFACDAFF);
  static const terliaryColor200 = Color(0xFFC8E9FF);
  static const terliaryColor100 = Color(0xFFE3F5FF);

  static const ctaColor = Color(0xFF3DC442);

  // Grey color
  static const greyColor900 = Color(0xFF494C57);
  static const greyColor800 = Color(0xFF888B94);
  static const greyColor700 = Color(0xFF494C57);
  static const greyColor600 = Color(0xFFDCDEE5);
  static const greyColor500 = Color(0xFFE4E7F1);
  static const greyColor400 = Color(0xFFF2F3FA);
  static const greyColor300 = Color(0xFFFAFAFD);

  static const shadowColor = Color(0xFFCED0D6);

  //System color
  static const successColor = Color(0xFF15B138);
  static const successColor400 = Color(0xFF46D058);
  static const successColor300 = Color(0xFF6DE771);
  static const successColor200 = Color(0xFFA5F7A0);
  static const successColor100 = Color(0xFFD5FBCE);

  static const errorColor = Color(0xFFF54848);
  static const errorColor400 = Color(0xFFFF6868);
  static const errorColor300 = Color(0xFFFF9595);
  static const errorColor200 = Color(0xFFFFC2C2);
  static const errorColor100 = Color(0xFFFFD9D9);
  static const errorColor40 = Color(0xFFFFF4F4);

  static const infoColor = Color(0xFF3870FF);
  static const infoColor400 = Color(0xFF6998FF);
  static const infoColor300 = Color(0xFF87B0FF);
  static const infoColor200 = Color(0xFFAFCCFF);
  static const infoColor100 = Color(0xFFD7E7FF);

  static const warnColor = Color(0xFFE5B302);
  static const warnColor400 = Color(0xFFEFCC3D);
  static const warnColor300 = Color(0xFFF7DD64);
  static const warnColor200 = Color(0xFFFCED98);
  static const warnColor100 = Color(0xFFFDF7CB);
  static const warnColor50 = Color(0xFFFDF9D8);
  static const warnColor40 = Color(0xFFFEFBE0);
  // Background color
  static const primaryLightColor = Color(0xFFFFFFFF);
  static const primaryDarkColor = Color(0xFF000000);
  static const backgroundColor = primaryLightColor;
  static const backgroundGreyColor = Color(0xFFF2F3FA);
  static const backgroundLightGreyColor = Color(0xFFF1F3FA);
  static const primaryBackgroundColor = primaryColor500;
  static const gradientStartColor = Color(0xFFFFA53E);
  static const gradientEndColor = Color(0xFFFF7643);

  static const linkColor = infoColor;

  static const primaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [gradientStartColor, gradientEndColor],
  );

// Text Color
  static const textColor = Color(0xFF16171C);
  static const textLightColor = Color(0xFFFFFFFF);
  static const textAlternateColor = secondaryColor;
  static const textAnchorColor = secondaryColor;
  static const textColorDisabled = Color(0xFFCED0D6);
  static const textColorDark = primaryDarkColor;
  static const textGreyColor = Color(0xFF888B94);
  static const buttonTextColor = Color(0xFFFFFFFF);
  static const iconLightColor = Color(0xFFFFFFFF);
  static const disabledOpacity = 0.66;
  static const inactiveOpacity = 0.66;
}
