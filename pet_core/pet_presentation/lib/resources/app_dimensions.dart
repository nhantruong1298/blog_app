import 'dart:io' show Platform;
import 'package:flutter/material.dart';

class AppDimensions {
  static const largeHeaderHeight = 176.0;

  // Size / padding and radius etc...
  static const double defaultPadding = 16;
  static const double defaultLPadding = 24;
  static const double defaultVerticalPadding = 24;
  static const double dialogMargin = 16;
  static const double dialogInnerPadding = 24;
  static const double defaultSPadding = 10;
  static const double defaultXSPadding = 8;
  static const double defaultXXSPadding = 5;

  static const double defaultRadius = 12;
  static const double defaultXLRadius = 16.0;
  static const double defaultSRadius = 8;
  static const double defaultXSRadius = 4;

  static const double buttonHeight = 48;
  static const double buttonSHeight = 32;
  static const double buttonLHeight = 56;
  static const double roundedRadius = 276;

// Font size
  static const double headingFontSize = 20;
  static const double heading1FontSize = 40;
  static const double heading2FontSize = 24;
  static const double heading3FontSize = 24;
  static const double heading4FontSize = 20;

  static const double titleFontSize = 18;
  static const double titleSFontSize = 16;

  static const double bodyXLFontSize = 16;
  static const double bodyLFontSize = 15;
  static const double bodyMFontSize = 15;
  static const double bodySFontSize = 14;
  static const double bodyXSFontSize = 12;
  static const double bodyXXSFontSize = 11;
  static const double bodyXXXSFontSize = 8;

  static const double descriptionFontSize = 12;
  static const double descriptionSFontSize = 11;

  static const double headingHeight = 1.3;
  static const double bodyHeight = 1.5;

// ?  static const double captionFontSize = 14;
  // static const double captionSFontSize = 12;

  static const double subtitleFontSize = 15;
  static const double defaultIconSize = 32;
  static const double defaultIconSizeSmall = 20;
  static const double defaultIconSizeLarge = 42;
  static const double defaultIconSizeXLarge = 64;
  static const double largeIconSize = 56;
  static const double defaultIconSizeXS = 16;
  static const double defaultIconSizeM = 24;

  static const double dialogButtonWidth = 100;
  static const double dialogButtonHeight = 24;
  static const double dialogCloseIconTopMargin = 50.0;

  static const double dialogCloseIconSize = 35.0;
  static EdgeInsets get defaultBottomBarPadding => EdgeInsets.only(
      top: AppDimensions.defaultPadding,
      left: AppDimensions.defaultPadding,
      right: AppDimensions.defaultPadding,
      bottom: (Platform.isIOS ? 1.2 : 1) * AppDimensions.defaultPadding);
  static const defaultListPadding = EdgeInsets.symmetric(
      horizontal: AppDimensions.defaultPadding,
      vertical: AppDimensions.defaultPadding / 2);

  static const double defaultButtonHeight = 40;

  static const EdgeInsetsGeometry buttonLPadding = EdgeInsets.symmetric(
      horizontal: AppDimensions.defaultPadding,
      vertical: AppDimensions.defaultPadding);

  static const EdgeInsetsGeometry buttonPadding = EdgeInsets.symmetric(
      horizontal: AppDimensions.defaultPadding,
      vertical: AppDimensions.defaultPadding);
  static const EdgeInsetsGeometry buttonMPadding = EdgeInsets.symmetric(
      horizontal: AppDimensions.defaultPadding,
      vertical: AppDimensions.defaultPadding / 2);
  static const EdgeInsetsGeometry buttonSPadding = EdgeInsets.symmetric(
      horizontal: AppDimensions.defaultPadding,
      vertical: AppDimensions.defaultPadding / 2);

  static const EdgeInsetsGeometry defaultContainerPadding =
      EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultVerticalPadding);

  static const EdgeInsets defaultHorizontalPadding =
      EdgeInsets.symmetric(horizontal: defaultPadding);

  static const EdgeInsets defaultBottomSheetPadding = EdgeInsets.fromLTRB(
      1 * AppDimensions.defaultPadding,
      0,
      1 * AppDimensions.defaultPadding,
      1 * AppDimensions.defaultPadding);

  static const buttonMinimalWidth = 120.0;
}
