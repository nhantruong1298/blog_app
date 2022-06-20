part of 'button.dart';

class AppLinkButton extends AppButton {
  final List<Widget>? tralings;
  final MainAxisAlignment rowAlignment;

  const AppLinkButton({
    Key? key,
    this.rowAlignment = MainAxisAlignment.start,
    this.tralings = const [],
    required VoidCallback? onPressed,
    String? text,
    Color? color,
    Color? textColor,
    EdgeInsetsGeometry? padding,
    double? width,
    Widget? child,
    AppButtonType type = AppButtonType.Primary,
    bool loading = false,
    AppButtonSize buttonSize = AppButtonSize.M,
    TextStyle? textStyle,
    bool block = false,
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
          type: type,
          buttonSize: buttonSize,
          loading: loading,
        );

  Color get _buttonTextColor {
    Color _color = AppColors.linkColor;

    if (loading == true || _onWidgetPressed == null) {
      return _color.withAlpha(100);
    }
    return _color;
  }

  Widget buildWidget() {
    return Row(
      mainAxisAlignment: rowAlignment,
      children: [
        Container(
          padding: padding,
          child: child ??
              ButtonText(
                text,
                color: textColor ?? _buttonTextColor,
                style: textStyle,
              ),
        ),
        Row(
            children:
                List.generate(tralings!.length, (index) => tralings![index])),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: loading ? null : onPressed,
      child: buildWidget(),
    );
    // return Material(
    //   color: Colors.transparent,
    //   child: InkWell(
    //     onTap: loading! ? null : onPressed,
    //     child: SizedBox(
    //       width: width,
    //       child: Row(
    //         mainAxisAlignment: rowAlignment,
    //         children: [
    //           Container(
    //             padding: padding ?? const EdgeInsets.all(5),
    //             child: child ??
    //                 ButtonText(
    //                   text,
    //                   color: textColor ?? _buttonTextColor,
    //                   style: textStyle,
    //                 ),
    //           ),
    //           Row(
    //               children: List.generate(
    //                   tralings!.length, (index) => tralings![index])),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
