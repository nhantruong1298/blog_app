import 'package:flutter/material.dart';
import 'package:pet_presentation/widgets/commons/typography/body_text.dart';

import 'app_colors.dart';
import 'app_dimensions.dart';

class AppThemeStyle {
  static ThemeData getDialogTheme(BuildContext context) =>
      Theme.of(context).copyWith(
          colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryColor500,
        onPrimary: AppColors.textLightColor,
        surface: AppColors.backgroundColor,
        onSurface: AppColors.textColor,
      ));

  static TextStyle get headingStyle => const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryDarkColor,
        height: 1.5,
      );
  static TextStyle get labelTextFieldStyle => const TextStyle(
        fontSize: 16,
        color: AppColors.textGreyColor,
      );

  static InputDecoration inputDecoration(
      {EdgeInsets? contentPadding,
      Widget? suffixIcon,
      String? hintText,
      Widget? label,
      TextStyle? hintStyle}) {
    return InputDecoration(
        contentPadding: contentPadding,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: suffixIcon,
        hintText: hintText,
        label: label,
        hintStyle: hintStyle);
  }

  static InputDecoration get searchHeaderDecoration {
    const inputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.backgroundColor),
    );

    return InputDecoration(
      hintText: '',
      helperStyle:
          BodyMText.defaultStyle.copyWith(color: AppColors.greyColor800),
      contentPadding: const EdgeInsets.symmetric(
        vertical: AppDimensions.defaultPadding,
        // horizontal: 15
      ),
      filled: true,
      fillColor: AppColors.backgroundColor,
      border: inputBorder,
      focusedBorder: inputBorder.copyWith(
        borderSide: const BorderSide(color: AppColors.backgroundColor),
      ),
      enabledBorder: inputBorder,
      floatingLabelBehavior: FloatingLabelBehavior.never,
    );
  }

  // static InputDecoration get searchInputDecoration {
  //   final inputBorder = OutlineInputBorder(
  //     borderRadius: const BorderRadius.all(Radius.circular(6)),
  //     borderSide: BorderSide(color: AppColors.backgroundColor),
  //   );
  //   return InputDecoration(
  //     hintText: '',
  //     helperStyle:
  //         BodyMText.defaultStyle.copyWith(color: AppColors.re),
  //     prefixIcon: Assets.images.searchGreyIcon.svg(
  //       width: 20,
  //       height: 20,
  //       fit: BoxFit.scaleDown,
  //     ),
  //     contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
  //     filled: true,
  //     fillColor: AppColors.greyColors.shade400,
  //     border: inputBorder,
  //     focusedBorder: inputBorder.copyWith(
  //       borderSide: BorderSide(color: AppColors.successColor),
  //     ),
  //     enabledBorder: inputBorder,
  //     floatingLabelBehavior: FloatingLabelBehavior.never,
  //   );
  // }

  // static InputDecoration get otpInputDecoration => InputDecoration(
  //       contentPadding: const EdgeInsets.symmetric(vertical: 15),
  //       border: outlineInputBorder(),
  //       focusedBorder: outlineInputBorder(),
  //       enabledBorder: outlineInputBorder(),
  //     );

  // static InputBorder outlineInputBorder(
  //     {BorderRadius? borderRadius, Color? borderColor}) {
  //   return OutlineInputBorder(
  //     borderRadius:
  //         borderRadius ?? BorderRadius.circular(AppDimensions.defaultSRadius),
  //     borderSide: BorderSide(color: borderColor ?? AppColors.textColor),
  //   );
  // }

  // static ThemeData theme(BuildContext context) {
  //   final textTheme = Theme.of(context).textTheme;

  //   return ThemeData(
  //       brightness: Brightness.light,
  //       scaffoldBackgroundColor: Colors.white,
  //       fontFamily: FontFamily.retHatDisplay,
  //       appBarTheme: appBarTheme,
  //       textTheme: textTheme.copyWith(
  //         bodyText1: BodyMText.defaultStyle,
  //         // bodyText2: BodyMText.defaultStyle,
  //         headline1: TextStyle(color: AppColors.textColorSecondary),
  //       ),
  //       inputDecorationTheme: inputDecorationTheme,
  //       visualDensity: VisualDensity.adaptivePlatformDensity,
  //       primaryColor: AppColors.primaryColor,
  //       primarySwatch: AppColors.primaryColors,
  //       // accentColor: AppColors.infoColor,

  //       // iconTheme: IconThemeData(),
  //       buttonTheme: const ButtonThemeData(
  //         height: AppDimensions.buttonHeight,
  //       ));
  // }

  // static InputBorder underlineInputBorder(Color? color) => UnderlineInputBorder(
  //     borderSide: BorderSide(
  //         color: color ?? AppColors.greyColors.shade200, width: 1.33));

  // static getInputLabelStyle({bool hasFocus = false, bool hasError = false}) =>
  //     TextStyle(
  //       fontSize: BodyMText.defaultStyle.fontSize,
  //       textBaseline: TextBaseline.alphabetic,
  //       // fontSize: AppDimensions.bodyXSFontSize,
  //       color: hasFocus
  //           ? (hasError ? AppColors.errorColor : AppColors.textColorPrimary)
  //           : AppColors.textColorGrey,
  //     );

  // static getFilledColor({bool hasFocus = false}) =>
  //     hasFocus ? AppColors.textColorLight : AppColors.backgroundColor;

  // static const _inputContentPadding =
  //     EdgeInsets.symmetric(horizontal: 5, vertical: 5);

  // static InputDecorationTheme get inputDecorationTheme {
  //   return InputDecorationTheme(
  //     labelStyle: TextStyle(color: AppColors.textColorGrey),
  //     floatingLabelStyle: TextStyle(color: AppColors.primaryColor),
  //     errorStyle: TextStyle(
  //         color: AppColors.errorColor,
  //         fontSize: AppDimensions.descriptionFontSize),
  //     hintStyle: TextStyle(color: AppColors.textColorGrey),
  //     helperStyle:
  //         BodyMText.defaultStyle.copyWith(color: AppColors.primaryColor),
  //     focusColor: AppColors.primaryColors.shade500,

  //     // filled: true,
  //     // fillColor: AppColors.greyColors.shade200,
  //     contentPadding: _inputContentPadding,
  //     // alignLabelWithHint: true,
  //     floatingLabelBehavior: FloatingLabelBehavior.always,

  //     border: underlineInputBorder(AppColors.borderColor),
  //     // If  you are using latest version of flutter then lable text and hint text shown like this
  //     // if you r using flutter less then 1.20.* then maybe this is not working properly
  //     // if we are define our floatingLabelBehavior in our theme then it's not applayed
  //     // floatingLabelBehavior: FloatingLabelBehavior.always,
  //     // contentPadding: EdgeInsets.symmetric(vertical: 12),
  //     enabledBorder: underlineInputBorder(AppColors.borderColor),
  //     focusedBorder: underlineInputBorder(AppColors.primaryColors.shade500),
  //     errorBorder: underlineInputBorder(AppColors.errorColors.shade500),
  //     focusedErrorBorder: underlineInputBorder(AppColors.errorColor),
  //   );
  // }

  static AppBarTheme get appBarTheme {
    return const AppBarTheme(
      color: AppColors.primaryLightColor,
      elevation: 0,
      // systemOverlayStyle: SystemUiOverlayStyle.light,
      iconTheme:  IconThemeData(color: AppColors.primaryDarkColor),
      titleTextStyle:
           TextStyle(color: AppColors.primaryLightColor, fontSize: 18),
    );
  }

  // static BoxDecoration get roundedBoxDecoration => BoxDecoration(
  //     color: AppColors.backgroundColor,
  //     borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
  //     border: Border.all(
  //       color: AppColors.backgroundColor,
  //       width: 1,
  //     ));

  // static BoxDecoration get transparentBoxDecoration => BoxDecoration(
  //     color: Colors.transparent,
  //     borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
  //     border: Border.all(
  //       color: Colors.transparent,
  //       width: 1,
  //     ));
  // static InputDecoration textBoxInputDecoration({
  //   BorderRadius? borderRadius,
  //   TextStyle? hintStyle,
  //   String? hintText,
  // }) =>
  //     InputDecoration(
  //         isDense: true,
  //         border: AppThemeStyle.outlineInputBorder(
  //             borderRadius: borderRadius,
  //             borderColor: AppColors.greyColors.shade500),
  //         focusedBorder: AppThemeStyle.outlineInputBorder(
  //             borderRadius: borderRadius,
  //             borderColor: AppColors.greyColors.shade500),
  //         enabledBorder: AppThemeStyle.outlineInputBorder(
  //             borderRadius: borderRadius,
  //             borderColor: AppColors.greyColors.shade500),
  //         contentPadding: const EdgeInsets.symmetric(
  //           vertical: AppDimensions.defaultSPadding,
  //           horizontal: AppDimensions.defaultSPadding,
  //         ),
  //         hintText: hintText,
  //         hintStyle: hintStyle);
}
