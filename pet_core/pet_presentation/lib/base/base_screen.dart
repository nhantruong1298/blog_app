import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pet_presentation/exception/app.exception_handler.dart';
import 'package:pet_presentation/exception/app_exception.dart';
import 'package:pet_presentation/generated/l10n.dart';
import 'package:pet_presentation/injectors/all.dart';
import 'package:pet_presentation/resources/app_colors.dart';
import 'package:pet_presentation/resources/app_constants.dart';
import 'package:pet_presentation/resources/app_dimensions.dart';
import 'package:pet_presentation/widgets/commons/dialog/app_dialog_manager.dart';
import 'package:pet_presentation/widgets/commons/dialog/components/error_dialog.dart';
import 'package:pet_presentation/widgets/commons/dialog/components/process_dialog_builder.dart';
import 'package:pet_presentation/widgets/commons/typography/body_text.dart';
import 'package:pet_presentation/widgets/commons/typography/heading_text.dart';

abstract class _IBaseScreen {
  void toggleLoading(bool value, {bool showSpinner = false});
  void showErrorDialog(Object error, StackTrace stackTrace);
  void showErrorDialogByAppException(AppException exception);
  void showSnackBar(String message,
      {Duration? duration,
      Color? color,
      Color? textColor,
      EdgeInsetsGeometry? margin,
      EdgeInsetsGeometry? padding});

  void showUnderDevelopmentDialog();

  toggleAppDialog(bool isShow, {required AppDialogBuilder? dialogBuilder});

  Future<void> showDialog({
    required String title,
    Widget? content,
    String? message,
    String? oKText,
  });

  Future<bool> showConfirmDialog(
      {required String title,
      Widget? content,
      String? message,
      String? oKText,
      String? cancelText});

  AppDialogManager get dialogManager;

  AppExceptionHandler get appExceptionHandler;

  void hideKeyBoard(BuildContext context);

  Future<U?> showModalBottomSheet<U>(
      Widget Function(BuildContext context) builder);

  void copyTextToClipboard(String text);
}

abstract class BaseScreenState<T extends StatefulWidget> extends State<T>
    with AutomaticKeepAliveClientMixin<T>
    implements _IBaseScreen {
  ErrorDialogBuilder? errorDialog;

  Widget builder(BuildContext context);

  @override
  AppDialogManager get dialogManager => AppDialogManager.instance();

  @override
  AppExceptionHandler get appExceptionHandler => getIt<AppExceptionHandler>();

  @override
  bool get wantKeepAlive => false;

  bool get willPop => true;

  ///   Override this function to handle will pop scope in case
  ///   you need to custom it
  bool onPhysicalBackPress() {
    return willPop;
  }

  Future<bool> onWillPop() {
    if (dialogManager.isShowingDialog()) {
      return Future.value(false);
    }
    return Future.value(onPhysicalBackPress());
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: builder(context),
    );
  }

  @override
  toggleAppDialog(bool isShow, {required AppDialogBuilder? dialogBuilder}) {
    dialogManager.toggleDialog(isShow, context,
        appDialogBuilder: dialogBuilder);
  }

  @override
  void showErrorDialog(Object error, StackTrace stackTrace) {
    AppException appException =
        appExceptionHandler.map(error, stackTrace: stackTrace);
    showErrorDialogByAppException(appException);
  }

  @override
  void showErrorDialogByAppException(AppException exception) {
    errorDialog = ErrorDialogBuilder(
        exception: exception,
        title: HeadingText(
          S.current.COMMON__ERROR_TITLE_TEXT,
          color: AppColors.textColor,
        ),
        onCloseButtonPress: () =>
            toggleAppDialog(false, dialogBuilder: errorDialog));
    toggleAppDialog(true, dialogBuilder: errorDialog);
  }

  @override
  void toggleLoading(bool value, {bool showSpinner = false}) {
    toggleAppDialog(value,
        dialogBuilder: ProcessingDialogBuilder(showLoading: showSpinner));
  }

  @override
  Future<bool> showConfirmDialog(
      {required String title,
      Widget? content,
      String? message,
      String? oKText,
      String? cancelText}) {
    return dialogManager.showConfirmDialog(
      title: title,
      content: content,
      message: message,
      context: context,
      cancelText: cancelText,
      oKText: oKText,
    );
  }

  Future<String?> showInputDialog({
    required String title,
    required BuildContext context,
    Widget? content,
    String? description,
    String? hintText,
    String? oKText,
    String? cancelText,
  }) {
    return dialogManager.showInputDialog(
      title: title,
      content: content,
      context: context,
      description: description,
      hintText: hintText,
      oKText: oKText,
      cancelText: cancelText,
    );
  }

  @override
  void showUnderDevelopmentDialog() async {
    // dialogManager.showComingSoonDialog(context);
  }

  @override
  void copyTextToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    showSnackBar(
      'Copy to clipboard'
      //S.current.COMMON__COPPIED_TO_CLIPBOARD
      ,
      margin: const EdgeInsets.only(
          bottom: AppDimensions.defaultRadius,
          left: AppDimensions.defaultRadius,
          right: AppDimensions.defaultRadius),
      color: AppColors.textColorDark.withOpacity(.8),
    );
  }

  @override
  Future<bool> showDialog(
      {required String title,
      Widget? content,
      String? message,
      String? oKText,
      String? cancelText}) {
    return dialogManager.showAlertDialog(
        title: title, content: content, message: message, context: context);
  }

  @override
  void hideKeyBoard(BuildContext context) {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Future<U?> showModalBottomSheet<U>(
      Widget Function(BuildContext context) builder) async {
    return showBarModalBottomSheet<U>(
        barrierColor: AppColors.dialogBackDropColor,
        context: context,
        enableDrag: true,
        expand: false,
        duration: AppConstants.animationDuration,
        builder: builder);
  }

  @override
  void showSnackBar(String message,
      {Duration? duration,
      Color? color,
      Color? textColor,
      EdgeInsetsGeometry? margin,
      EdgeInsetsGeometry? padding}) {
    final snackBar = SnackBar(
      elevation: 0,
      backgroundColor: color,
      content: BodyText(message, color: textColor),
      duration: duration ?? AppConstants.defaultTimeoutDuration,
      behavior: SnackBarBehavior.floating,
      margin: margin,
      padding: padding,
    );

    // Find the Scaffold in the widget tree and use it to show a SnackBar.
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

// ignore: must_be_immutable
// abstract class StatelessBaseScreen extends StatelessWidget {
//   StatelessBaseScreen({Key? key}) : super(key: key);

//   Widget builder(BuildContext context);

//   AppDialogManager get dialogManager => AppDialogManager.instance();

//   bool get willPop => true;

//   ///   Override this function to handle will pop scope in case
//   ///   you need to custom it
//   bool onPhysicalBackPress() {
//     return willPop;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: onWillPop,
//       child: builder(context),
//     );
//   }

//   Future<bool> onWillPop() {
//     if (dialogManager.isShowingDialog()) {
//       return Future.value(false);
//     }
//     return Future.value(onPhysicalBackPress());
//   }

//   void copyTextToClipboard(String text, {required BuildContext context}) {
//     Clipboard.setData(ClipboardData(text: text));
//     showSnackBar(
//       S.current.COMMON__COPPIED_TO_CLIPBOARD,
//       context: context,
//       margin: const EdgeInsets.only(
//           bottom: AppDimensions.defaultRadius,
//           left: AppDimensions.defaultRadius,
//           right: AppDimensions.defaultRadius),
//       color: AppColors.textColorDark.withOpacity(.8),
//     );
//   }

//   void hideKeyBoard(BuildContext context) {
//     if (FocusScope.of(context).hasFocus) {
//       FocusScope.of(context).unfocus();
//     }
//   }

//   Future<bool> showConfirmDialog(
//       {required String title,
//       required context,
//       Widget? content,
//       String? message,
//       String? oKText,
//       String? cancelText}) {
//     return dialogManager.showConfirmDialog(
//       title: title,
//       content: content,
//       message: message,
//       context: context,
//       cancelText: cancelText,
//       oKText: oKText,
//     );
//   }

//   Future<void> showDialog(
//       {required String title,
//       required BuildContext context,
//       Widget? content,
//       String? message,
//       String? oKText}) {
//     return dialogManager.showAlertDialog(
//         title: title, content: content, message: message, context: context);
//   }

//   late ErrorDialogBuilder _errorDialog;
//   void showErrorDialog(AppException appException,
//       {required BuildContext context}) {
//     _errorDialog = ErrorDialogBuilder(
//         exception: appException,
//         title: Heading3Text(
//           S.current.COMMON__ERROR_TITLE_TEXT,
//           color: AppColors.textColor,
//         ),
//         onCloseButtonPress: () => toggleAppDialog(false,
//             dialogBuilder: _errorDialog, context: context));
//     toggleAppDialog(true, dialogBuilder: _errorDialog, context: context);
//   }

//   Future<U?> showModalBottomSheet<U>(
//       Widget Function(BuildContext context) builder,
//       {required BuildContext context}) {
//     return showBarModalBottomSheet<U>(
//         barrierColor: AppColors.backDropColor,
//         context: context,
//         enableDrag: true,
//         expand: false,
//         duration: AppConstants.animationDuration,
//         builder: builder);
//   }

//   void showSnackBar(String message,
//       {required BuildContext context,
//       Duration? duration,
//       Color? color,
//       Color? textColor,
//       EdgeInsetsGeometry? margin,
//       EdgeInsetsGeometry? padding}) {
//     final snackBar = SnackBar(
//       elevation: 0,
//       backgroundColor: color,
//       content: BodyText(message, color: textColor),
//       duration: duration ?? AppConstants.defaultTimeoutDuration,
//       behavior: SnackBarBehavior.floating,
//       margin: margin,
//       padding: padding,
//     );

//     // Find the Scaffold in the widget tree and use it to show a SnackBar.
//     ScaffoldMessenger.of(context).hideCurrentSnackBar();
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }

//   void showUnderDevelopmentDialog(BuildContext context) {
//     dialogManager.showComingSoonDialog(context);
//   }

//   dynamic toggleAppDialog(bool isShow,
//       {required BuildContext context,
//       required AppDialogBuilder? dialogBuilder}) {
//     return dialogManager.toggleDialog(isShow, context,
//         appDialogBuilder: dialogBuilder);
//   }

//   void toggleLoading(bool value,
//       {required BuildContext context, bool showSpinner = false}) {
//     toggleAppDialog(value,
//         context: context,
//         dialogBuilder: ProcessingDialogBuilder(showLoading: showSpinner));
//   }
// }
