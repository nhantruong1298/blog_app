import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pet_presentation/widgets/commons/dialog/alert_dialog_builder.dart';
import 'package:pet_presentation/widgets/commons/dialog/components/confirm_dialog.dart';
import 'package:pet_presentation/widgets/commons/dialog/components/input_dialog.dart';


class AppDialogManager {
  AppDialogBuilder? _currentDialogBuilder;
  OverlayEntry? _dialogOverlay;

  final GlobalKey _dialogKey =
      GlobalKey();

  AppDialogManager._internal();

  static final AppDialogManager _instance = AppDialogManager._internal();

  static AppDialogManager instance() {
    return _instance;
  }

  bool isShowingDialog() {
    return _currentDialogBuilder != null;
  }

  toggleDialog(bool isShow, BuildContext context,
      {AppDialogBuilder? appDialogBuilder}) {
    if (isShow) {
      showDialog(context, appDialogBuilder: appDialogBuilder);
      return;
    }
    hideDialog(dialogBuilder: appDialogBuilder);
  }

  Widget _buildDialogContent() {
    if (_currentDialogBuilder != null) {
      return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: _currentDialogBuilder!.buildDialog(_dialogKey),
      );
    }

    return Container();
  }

  void showDialog(BuildContext context, {AppDialogBuilder? appDialogBuilder}) {
    _currentDialogBuilder = appDialogBuilder;
    _createAndInsertDialogOverlay(context);
  }

  void _createAndInsertDialogOverlay(BuildContext context) {
    if (_currentDialogBuilder == null) {
      return;
    }
    FocusScope.of(context).requestFocus(FocusNode());
    _removeDialogOverlay();
    AppDialogManager.instance()._dialogOverlay = _createOverlayEntry(context);
    Overlay.of(context)!.insert(AppDialogManager.instance()._dialogOverlay!);
  }

  _getSizeContext(BuildContext ctx) => MediaQuery.of(ctx).size;

  OverlayEntry _createOverlayEntry(BuildContext context) {
    double screenWidth = _getSizeContext(context).width;
    double screenHeight = _getSizeContext(context).height;

    return OverlayEntry(
      builder: (context) => Positioned(
        left: 0,
        top: 0,
        width: screenWidth,
        height: screenHeight,
        child: Material(
          color: Colors.transparent,
          child: _buildDialogContent(),
        ),
      ),
    );
  }

  void hideDialog({required AppDialogBuilder? dialogBuilder}) {
    if (dialogBuilder == null || _currentDialogBuilder == null) {
      return;
    }
    if (dialogBuilder.runtimeType != _currentDialogBuilder.runtimeType) {
      return;
    }

    if (dialogBuilder.code != _currentDialogBuilder!.code) {
      return;
    }
    forceHideDialog();
  }

  void forceHideDialog() {
    _currentDialogBuilder = null;
    _removeDialogOverlay();
  }

  void _removeDialogOverlay() {
    if (_dialogOverlay != null) {
      AppDialogManager.instance()._dialogOverlay!.remove();
      _dialogOverlay = null;
    }
  }

  // Future<void> showComingSoonDialog(
  //   context,
  // ) async {
  //   Completer<void> completer = Completer<void>();

  //   toggleDialog(true, context,
  //       appDialogBuilder: CommingSoonDialogBuilder(onCloseButtonPress: () {
  //     forceHideDialog();
  //     completer.complete();
  //   }));
  //   return completer.future;
  // }

  Future<bool> showConfirmDialog(
      {required String title,
      required BuildContext context,
      Widget? content,
      Widget? image,
      String? oKText,
      String? message,
      String? cancelText}) async {
    Completer<bool> completer = Completer<bool>();

    toggleDialog(
      true,
      context,
      appDialogBuilder: ConfirmDialogBuilder(
          title: title,
          contentBuilder: content,
          message: message,
          image: image,
          onCancel: () {
            forceHideDialog();
            completer.complete(false);
          },
          onConfirm: () {
            forceHideDialog();
            completer.complete(true);
          },
          positiveText: oKText,
          negativeText: cancelText),
    );

    return completer.future;
  }

  Future<bool> showAlertDialog({
    required String title,
    required BuildContext context,
    Widget? content,
    Widget? image,
    String? oKText,
    String? message,
  }) async {
    Completer<bool> completer = Completer<bool>();

    toggleDialog(
      true,
      context,
      appDialogBuilder: AlertDialogBuilder(
        title: title,
        contentBuilder: content,
        message: message,
        onCancel: () {
          forceHideDialog();
          completer.complete(false);
        },
        positiveText: oKText,
      ),
    );

    return completer.future;
  }

  Future<String?> showInputDialog({
    required String title,
    required BuildContext context,
    Widget? content,
    String? description,
    String? hintText,
    String? oKText,
    String? cancelText,
  }) async {
    Completer<String?> completer = Completer<String?>();

    return toggleDialog(
      true,
      context,
      appDialogBuilder: InputDialogBuilder(
        title: title,
        contentBuilder: content,
        hintText: hintText,
        description: description,
        onCancel: () {
          forceHideDialog();
          completer.complete(null);
        },
        onDone: (value) {
          forceHideDialog();
          completer.complete(value);
        },
        cancelText: cancelText,
        oKText: oKText,
      ),
    );
  }
}

abstract class AppDialogBuilder {
  /// @code to identify the dialog, help the dialog manager
  /// to recognize the correct dialog for showing and hiding correctly
  /// in case the screen contain multiple same dialog types
  int code = 0;

  AppDialogBuilder withCode(int code) {
    this.code = code;
    return this;
  }

  Widget buildDialog(Key key);
}