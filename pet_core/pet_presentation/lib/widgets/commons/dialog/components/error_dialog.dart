import 'package:flutter/material.dart';
import 'package:pet_domain/exception/business_exception_code.dart';
import 'package:pet_presentation/exception/app_exception.dart';
import 'package:pet_presentation/generated/l10n.dart';
import 'package:pet_presentation/resources/app_dimensions.dart';
import 'package:pet_presentation/widgets/commons/button/button_type.dart';

import '../app_dialog_manager.dart';
import 'app_dialog_widget.dart';

class ErrorDialogBuilder extends AppDialogBuilder {
  final VoidCallback? onCloseButtonPress;
  final AppException exception;
  final Widget? title;
  final double width;
  final double height;
  final double? buttonWidth;

  ErrorDialogBuilder(
      {this.onCloseButtonPress,
      required this.exception,
      this.title,
      this.buttonWidth,
      this.width = 300,
      this.height = 200});

  @override
  Widget buildDialog(Key key) {
    return Container(
        constraints: BoxConstraints(minHeight: height, minWidth: width),
        child: ErrorDialog(
          exception: exception,
          onCloseButtonPress: () {
            if (onCloseButtonPress != null) onCloseButtonPress!();
          },
        ));
  }
}

class ErrorDialog extends AppDialogWidget {
  final AppException exception;

  ErrorDialog(
      {Key? key,
      required this.exception,
      VoidCallback? onCloseButtonPress,
      double? buttonWidth})
      : super(
          key: key,
          animated: true,
          iconStyle: DialogIconStyle.INNER,
          onCloseButtonPress: onCloseButtonPress,
          icon:
              exception.exceptionCode == BusinessExceptionCode.UNEXPECTED_ERROR
                  ? Container(
                      padding: const EdgeInsets.all(8),
                      // child: Assets.images.errorIcon
                      //     .svg(height: 115, fit: BoxFit.fitHeight),
                    )
                  : null,
          title:
              exception.exceptionCode == BusinessExceptionCode.UNEXPECTED_ERROR
                  ? "S.current.COMMON__SOMETHING_WENT_WRONG_HEADER_TEXT"
                  : "S.current.COMMON__ERROR_TITLE_TEXT",
          message: exception.displayMessage,
          isShowCloseButton: false,
          buttonDirection: DialogButtonDirection.HORIZONTAL,
          positiveButton: DialogButton(
              buttonType: AppButtonType.Default,
              buttonText: S.current.COMMON__OK_BUTTON,
              minWidth: buttonWidth ?? AppDimensions.buttonMinimalWidth,
              onButtonClick: onCloseButtonPress),
        );
}
