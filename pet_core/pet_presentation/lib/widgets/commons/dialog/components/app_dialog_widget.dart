import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pet_presentation/generated/l10n.dart';
import 'package:pet_presentation/resources/app_colors.dart';
import 'package:pet_presentation/resources/app_constants.dart';
import 'package:pet_presentation/resources/app_dimensions.dart';
import 'package:pet_presentation/widgets/commons/button/button.dart';
import 'package:pet_presentation/widgets/commons/button/button_type.dart';
import 'package:pet_presentation/widgets/commons/typography/body_text.dart';
import 'package:pet_presentation/widgets/commons/typography/heading_text.dart';

import '../app_dialog_manager.dart';

enum DialogIconStyle {
  OUTER,
  INNER,
}

enum DialogButtonDirection {
  VERTICAL,
  HORIZONTAL,
}

class AppDialogWidgetState extends State<AppDialogWidget>
    with TickerProviderStateMixin {
  final double outerIconWidth = 135.0;
  final double outerIconHeight = 110.0;
  final double outerIconTopSpace = 70.0;
  final Duration animationDuration = AppConstants.animationDuration;

  late Animation<double> animatedScale;
  late Animation<double> animatedOpacity;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  void initAnimation() {
    if (!widget.animated) return;
    animationController =
        AnimationController(duration: animationDuration, vsync: this);
    animatedScale = Tween<double>(
      begin: 1.08,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
    animatedOpacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    disposeAnimation();
  }

  void disposeAnimation() {
    if (!widget.animated) return;
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.animated) {
      return FadeTransition(
        opacity: animatedOpacity,
        child: Material(
          color: AppColors.dialogBackDropColor,
          child: ScaleTransition(
            scale: animatedScale,
            child: buildMainContent(context),
          ),
        ),
      );
    }
    return Material(
      color: AppColors.dialogBackDropColor.withOpacity(0.2),
      child: buildMainContent(context),
    );
  }

  Widget buildMainContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.defaultPadding),
      color: AppColors.dialogBackDropColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Material(
              type: MaterialType.transparency,
              child: Stack(
                children: <Widget>[
                  buildContent(),
                  buildOuterIcon(),
                ],
              ),
            ),
            buildCloseButton(),
          ],
        ),
      ),
    );
  }

  Future<void> startHideDialogAnimation() {
    if (!widget.animated) return Future.value();
    animationController.reverse();
    return Future.delayed(animationDuration);
  }

  Widget buildOuterIcon() {
    if (widget.iconStyle != DialogIconStyle.OUTER || widget.icon == null) {
      return Container();
    }

    return Center(
      child: SizedBox(
        height: outerIconHeight,
        width: outerIconWidth,
        child: widget.icon,
      ),
    );
  }

  Widget buildContent() {
    return Center(
      child: Container(
        margin: getDialogOuterMargin(),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: const BorderRadius.all(
              Radius.circular(AppDimensions.defaultRadius)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildInnerImage(),
            Container(
              padding: getDialogInnerPadding(),
              child: Column(
                children: <Widget>[
                  _buildTittle(),
                  _buildMessage(),
                  _buildCustomWidget(),
                  _buildBottomButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  EdgeInsetsGeometry getDialogOuterMargin() {
    return widget.iconStyle == DialogIconStyle.OUTER && widget.icon != null
        ? EdgeInsets.only(top: outerIconTopSpace)
        : const EdgeInsets.all(0);
  }

  EdgeInsetsGeometry getDialogInnerPadding() {
    return widget.iconStyle == DialogIconStyle.OUTER && widget.icon != null
        ? EdgeInsets.only(
            top: outerIconHeight - outerIconTopSpace,
            bottom: AppDimensions.defaultPadding)
        : const EdgeInsets.all(AppDimensions.defaultPadding);
  }

  Widget _buildInnerImage() {
    if (widget.iconStyle != DialogIconStyle.INNER || widget.icon == null) {
      return Container();
    }

    return Row(
      children: [
        Expanded(
          child: Container(child: widget.icon),
        ),
      ],
    );
  }

  Widget _buildTittle() {
    if (widget.title == null) {
      return Container();
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.defaultPadding / 2),
      child: HeadingText(widget.title!,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: AppColors.textColorDark,
          ),
          textAlign: TextAlign.start),
    );
  }

  Widget _buildMessage() {
    if (widget.message == null) {
      return Container();
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.defaultPadding / 2),
      child: BodyText(
        widget.message ?? '',
        color: AppColors.textColor,
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _buildCustomWidget() {
    if (widget.customWidget == null) {
      return Container();
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.defaultPadding / 2,
        vertical: AppDimensions.defaultPadding / 2,
      ),
      child: widget.customWidget,
    );
  }

  _buildBottomButtons() {
    List<Widget> buttons = [];
    if (widget.positiveButton != null) {
      buttons.add(buildBottomButton(widget.positiveButton!,
          type: widget.positiveButton!.buttonType ?? AppButtonType.Primary));
    }
    if (widget.negativeButton != null) {
      buttons.add(const SizedBox(
        height: AppDimensions.defaultPadding,
        width: AppDimensions.defaultPadding,
      ));
      buttons.add(buildBottomButton(widget.negativeButton!,
          backgroundColor: AppColors.greyColor400));
    }

    if (buttons.isEmpty) {
      return Container();
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: AppDimensions.defaultPadding,
      ),
      child: Container(
        child: widget.buttonDirection == DialogButtonDirection.HORIZONTAL
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: buttons.reversed.toList())
            : Column(children: buttons),
      ),
    );
  }

  Widget buildCloseButton() {
    if (!widget.isShowCloseButton) {
      return Container();
    }

    return Container(
      margin: const EdgeInsets.only(
        top: AppDimensions.dialogCloseIconTopMargin,
      ),
      child: TextButton(
        child: SizedBox(
          width: AppDimensions.dialogCloseIconSize,
          height: AppDimensions.dialogCloseIconSize,
          child: Text(S.current.COMMON__CONFIRM_BUTTON),
        ),
        onPressed: () {
          AppDialogManager.instance().forceHideDialog();
          if (widget.onCloseButtonPress != null) {
            widget.onCloseButtonPress!();
          }
        },
      ),
    );
  }

  Widget buildBottomButton(DialogButton dialogButton,
      {Color? backgroundColor, AppButtonType type = AppButtonType.Default}) {
    Widget button = AppButton(
      type: type,
      text: dialogButton.buttonText,
      textStyle: dialogButton.buttonTextStyle,
      width: dialogButton.minWidth,
      onPressed: dialogButton.disabled
          ? null
          : () {
              AppDialogManager.instance().forceHideDialog();
              if (dialogButton.onButtonClick != null) {
                dialogButton.onButtonClick!();
              }
            },
    );

    if (widget.buttonDirection == DialogButtonDirection.VERTICAL) {
      return button;
    }
    return dialogButton.minWidth != null
        ? button
        : Expanded(
            flex: 1,
            child: button,
          );
  }
}

class AppDialogWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppDialogWidgetState();

  const AppDialogWidget(
      {Key? key,
      this.iconStyle = DialogIconStyle.OUTER,
      this.icon,
      this.title,
      this.message,
      this.customWidget,
      this.buttonDirection = DialogButtonDirection.HORIZONTAL,
      this.negativeButton,
      this.positiveButton,
      this.isShowCloseButton = false,
      this.onCloseButtonPress,
      this.animated = false,
      this.dialogPadding})
      : super(key: key);
  final EdgeInsets? dialogPadding;
  final DialogIconStyle iconStyle;
  final Widget? icon;
  final String? title;
  final String? message;
  final Widget? customWidget;
  final DialogButtonDirection buttonDirection;
  final DialogButton? negativeButton;
  final DialogButton? positiveButton;
  final bool isShowCloseButton;
  final VoidCallback? onCloseButtonPress;
  final bool animated;
}

class DialogButton {
  final String? buttonText;
  final VoidCallback? onButtonClick;
  final Color? buttonColor;
  final TextStyle? buttonTextStyle;
  final double? minWidth;
  final bool disabled;
  final AppButtonType? buttonType;
  DialogButton({
    this.buttonColor,
    this.buttonText,
    this.onButtonClick,
    this.buttonTextStyle,
    this.minWidth,
    this.buttonType,
    this.disabled = false,
  });
}

class SpecialText extends StatelessWidget {
  // ignore: unnecessary_string_escapes
  final RegExp exp = RegExp("<\s*(.*?)>(.*?)<\s*/\s*(.*?)>");

  final String? text;
  final TextStyle? style;
  final TextAlign textAlign;
  final String? keyString;

  SpecialText(
      {Key? key,
      this.text,
      this.style,
      this.textAlign = TextAlign.start,
      this.keyString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TextSpan> textSpans = splitText(text ?? "");
    return RichText(
      key: keyString != null ? Key(keyString!) : null,
      textAlign: textAlign,
      text: TextSpan(
        style: style ?? BodyText.defaultStyle,
        children: textSpans,
      ),
    );
  }

  List<TextSpan> splitText(String text) {
    List<TextSpan> results = [];
    Iterable<Match> matches = exp.allMatches(text);
    int start = 0;
    for (var match in matches) {
      String? tag = "n";
      if (match.start != start) {
        String normalText = text.substring(start, match.start);
        results.add(buildText(normalText, tag));
      }
      String? htmlText = match.group(2);
      tag = match.group(1);
      results.add(buildText(htmlText, tag));
      start = match.end;
    }

    if (start < text.length) {
      String normalText = text.substring(start, text.length);
      results.add(buildText(normalText, "n"));
    }
    return results;
  }

  TextSpan buildText(String? text, String? tag) {
    return TextSpan(
      text: text,
      style: buildStyleByTag(tag),
    );
  }

  TextStyle buildStyleByTag(String? tag) {
    switch (tag) {
      case "n":
        return const TextStyle(fontWeight: FontWeight.normal);

      case "b":
        return const TextStyle(fontWeight: FontWeight.bold);

      case "i":
        return const TextStyle(fontStyle: FontStyle.italic);

      default:
        return const TextStyle(fontWeight: FontWeight.normal);
    }
  }
}
