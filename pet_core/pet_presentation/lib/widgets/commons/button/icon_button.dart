part of 'button.dart';


class AppIconButton extends AppButton {
  const AppIconButton({
    Key? key,
    required this.icon,
    String? text,
    Color? color,
    Color? textColor,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    TextStyle? textStyle,
    double? width,
    Widget? child,
    VoidCallback? onPressed,
    this.align = Alignment.center,
    this.size = AppDimensions.defaultIconSize,
    AppButtonSize buttonSize = AppButtonSize.M,
    bool loading = false,
  }) : super(
          key: key,
          text: text,
          onPressed: onPressed,
          color: color,
          textColor: textColor,
          padding: padding,
          textStyle: textStyle,
          width: width,
          child: child,
          loading: loading,
        );

  final Alignment? align;
  final double size;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final List<Widget> component = [
      Container(
        alignment: align,
        padding: padding,
        child: IconButton(
          icon: icon,
          iconSize: size,
          onPressed: onPressed,
          padding: EdgeInsets.zero,
        ),
      ),
    ];
    if (text != null) {
      component.add(BodySText(
        text!,
        color: buttonTextColor,
      ));
    }
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: component,
      ),
    );
  }
}
