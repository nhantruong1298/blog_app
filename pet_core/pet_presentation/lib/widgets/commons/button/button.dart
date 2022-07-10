import 'package:flutter/material.dart';
import 'package:pet_presentation/resources/app_colors.dart';
import 'package:pet_presentation/resources/app_dimensions.dart';
import 'package:pet_presentation/widgets/commons/typography/body_text.dart';
import 'package:pet_presentation/widgets/commons/typography/button_text.dart';
import 'button_type.dart';
part 'icon_button.dart';
part 'link_button.dart';
part 'outlined_button.dart';


class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.onPressed,
    this.text,
    this.color,
    this.textColor,
    this.padding,
    this.textStyle,
    this.width,
    this.child,
    this.shape = AppButtonShape.Default,
    this.type = AppButtonType.Default,
    this.buttonSize = AppButtonSize.M,
    this.block = false,
    this.loading = false,
  }) : super(key: key);
  final Widget? child;
  final Color? color;
  final bool? block;
  final VoidCallback? onPressed;
  final AppButtonSize buttonSize;
  final AppButtonType type;
  final String? text;
  final AppButtonShape shape;
  final Color? textColor;
  final double? width;
  final TextStyle? textStyle;
  final bool loading;

  final EdgeInsetsGeometry? padding;

  EdgeInsetsGeometry get buttonPadding {
    if (padding != null) return padding!;
    var defaultPadding = AppDimensions.buttonMPadding;
    switch (buttonSize) {
      case AppButtonSize.L:
        defaultPadding = AppDimensions.buttonLPadding;
        break;
      case AppButtonSize.S:
        defaultPadding = AppDimensions.buttonSPadding;
        break;
      case AppButtonSize.M:
      default:
        break;
    }

    return defaultPadding;
  }

  Color get buttonTextColor {
    if (textColor != null) return textColor!;
    Color color = AppColors.textLightColor;
    switch (type) {
      case AppButtonType.Primary:
      case AppButtonType.Assertive:
      case AppButtonType.Information:
        color = AppColors.primaryLightColor;
        break;
      case AppButtonType.Default:
        color = AppColors.textColorDark;
        break;
      default:
        break;
    }
    return color;
  }

  double? get _buttonMinWidth => block == true ? double.infinity : width;

  Radius _getButtonRoundedRadius(AppButtonShape? shape) {
    final double radius = shape == AppButtonShape.Default
        ? AppDimensions.defaultXSRadius
        : AppDimensions.roundedRadius;
    return Radius.circular(radius);
  }

  Widget _buildTextWidget(String? text, AppButtonType? type) {
    return ButtonText(
      text,
      color: buttonTextColor,
      style: textStyle,
    );
  }

  Color get buttonBorderColor {
    Color _color;
    switch (type) {
      case AppButtonType.Primary:
        _color = AppColors.primaryBackgroundColor;
        break;
      case AppButtonType.Information:
        _color = AppColors.successColor;
        break;
      case AppButtonType.Assertive:
        _color = AppColors.errorColor;
        break;
      case AppButtonType.Default:
      default:
        _color = AppColors.greyColor300;
        break;
    }
    return _color;
  }

  VoidCallback? get _onWidgetPressed => (loading) ? null : onPressed;

  RoundedRectangleBorder get _buttonShape {
    return RoundedRectangleBorder(
        side: BorderSide(
          color: buttonBorderColor,
        ),
        borderRadius: BorderRadius.all(
          _getButtonRoundedRadius(shape),
        ));
  }

  Size get _size {
    double size = AppDimensions.buttonHeight;
    switch (buttonSize) {
      case AppButtonSize.S:
        size = AppDimensions.buttonSHeight;
        break;
      case AppButtonSize.L:
        size = AppDimensions.buttonLHeight;
        break;
      case AppButtonSize.M:
      default:
        size = AppDimensions.buttonHeight;
        break;
    }
    return Size(_buttonMinWidth ?? 0, size);
  }

  Color get _buttonColor {
    Color _color;
    if (color == null) {
      switch (type) {
        case AppButtonType.Primary:
          _color = AppColors.primaryBackgroundColor;
          break;
        case AppButtonType.Information:
          _color = AppColors.successColor;
          break;
        case AppButtonType.Assertive:
          _color = AppColors.errorColor;
          break;
        case AppButtonType.Default:
        default:
          _color = AppColors.greyColor500;
          break;
      }
    } else {
      _color = color!;
    }

    if (loading == true || _onWidgetPressed == null) {
      return _color.withAlpha(100);
    }
    return _color;
  }

  Widget buildChildWidget() {
    if (loading == true) return _buildLoadingWidget(type);
    return child ?? _buildTextWidget(text, type);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: buttonPadding,
        shape: _buttonShape,
        minimumSize: _size,
        alignment: Alignment.center,
        backgroundColor: _buttonColor,
      ),
      child: buildChildWidget(),
      clipBehavior: Clip.antiAlias,
      onPressed: _onWidgetPressed,
    );
  }

  const factory AppButton.outlined({
    Key? key,
    required VoidCallback? onPressed,
    String? text,
    Color? color,
    Color? textColor,
    EdgeInsetsGeometry? padding,
    TextStyle? textStyle,
    double? width,
    Widget? child,
    AppButtonShape shape,
    AppButtonType type,
    AppButtonSize buttonSize,
    bool block,
    bool loading,
  }) = AppOutlinedButton;

  const factory AppButton.icon({
    Key? key,
    required Widget icon,
    String? text,
    Color? color,
    Color? textColor,
    EdgeInsetsGeometry padding,
    TextStyle? textStyle,
    double? width,
    Widget? child,
    VoidCallback? onPressed,
    Alignment? align,
    double size,
    AppButtonSize buttonSize,
    bool loading,
  }) = AppIconButton;

  const factory AppButton.link({
    Key? key,
    MainAxisAlignment rowAlignment,
    List<Widget>? tralings,
    required VoidCallback? onPressed,
    String? text,
    Color? color,
    Color? textColor,
    EdgeInsetsGeometry? padding,
    double? width,
    Widget? child,
    AppButtonType type,
    bool loading,
    AppButtonSize buttonSize,
    TextStyle? textStyle,
    bool block,
  }) = AppLinkButton;

  Widget _buildLoadingWidget(AppButtonType? type) {
    Color? _loadingColor;
    // TODO: add more rule for button colors
    switch (type) {
      case AppButtonType.Primary:
      case AppButtonType.Assertive:
      case AppButtonType.Information:
        _loadingColor = AppColors.primaryLightColor;
        break;
      case AppButtonType.Default:
      default:
        _loadingColor = buttonTextColor;
        break;
    }
    return SizedBox(
        width: AppDimensions.defaultIconSizeSmall,
        height: AppDimensions.defaultIconSizeSmall,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color?>(_loadingColor),
        ));
  }
}
