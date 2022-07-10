part of 'button.dart';

class AppOutlinedButton extends AppButton {
  @override
  Color get buttonTextColor {
    if (textColor != null) return textColor!;
    Color color = AppColors.backgroundColor;
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

  const AppOutlinedButton({
    Key? key,
    required VoidCallback? onPressed,
    String? text,
    Color? color,
    Color? textColor,
    EdgeInsetsGeometry? padding,
    TextStyle? textStyle,
    double? width,
    Widget? child,
    AppButtonShape shape = AppButtonShape.Default,
    AppButtonType type = AppButtonType.Default,
    AppButtonSize buttonSize = AppButtonSize.M,
    bool block = false,
    bool loading = false,
  }) : super(
          key: key,
          onPressed: onPressed,
          text: text,
          color: color,
          textColor: textColor,
          padding: padding,
          textStyle: textStyle,
          width: width,
          child: child,
          block: block,
          shape: shape,
          type: type,
          buttonSize: buttonSize,
          loading: loading,
        );

  Widget get _outlinedText {
    Color _textColor;
    switch (type) {
      case AppButtonType.Primary:
        _textColor = AppColors.primaryBackgroundColor;
        break;
      case AppButtonType.Assertive:
        _textColor = AppColors.errorColor;
        break;
      case AppButtonType.Default:
      default:
        _textColor = buttonTextColor;
        break;
    }

    return ButtonText(text,
        color: onPressed != null
            ? _textColor
            : _textColor.withOpacity(AppColors.disabledOpacity));
  }

  BoxDecoration get _containerBoxDecoration {
    return BoxDecoration(
        borderRadius: BorderRadius.all(_getButtonRoundedRadius(shape)),
        border: Border.all(
          color: onPressed != null
              ? _buttonColor
              : _buttonColor.withOpacity(AppColors.disabledOpacity),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final _size = this._size;
    return Container(
        width: _size.width,
        height: _size.height,
        decoration: _containerBoxDecoration,
        child: TextButton(
          clipBehavior: Clip.antiAlias,
          child: _outlinedText,
          onPressed: onPressed,
        ));
  }
}
