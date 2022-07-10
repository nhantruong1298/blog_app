import 'package:flutter/material.dart';
import 'package:pet_presentation/generated/l10n.dart';
import 'package:pet_presentation/resources/app_colors.dart';
import 'package:pet_presentation/resources/app_dimensions.dart';
import 'package:pet_presentation/resources/app_theme.dart';
import 'package:pet_presentation/widgets/commons/typography/body_text.dart';

import '../app_dialog_manager.dart';
import 'app_dialog_widget.dart';

class InputDialogBuilder extends AppDialogBuilder {
  final Function(String) onDone;
  final Function() onCancel;
  final String? hintText;
  final String title;
  final String? description;
  final double width;
  final double height;
  final Widget? contentBuilder;
  final String? oKText;
  final String? cancelText;
  InputDialogBuilder(
      {required this.onDone,
      required this.onCancel,
      this.hintText,
      required this.title,
      this.description,
      this.width = 300,
      this.height = 200,
      this.contentBuilder,
      this.oKText,
      this.cancelText});
  String _textValue = '';
  @override
  Widget buildDialog(Key key) {
    return Container(
      constraints: BoxConstraints(minHeight: height, minWidth: width),
      child: AppDialogWidget(
        animated: true,
        title: title,
        iconStyle: DialogIconStyle.INNER,
        message: description,
        customWidget: Column(
          children: [
            TextField(
              textInputAction: TextInputAction.done,
              maxLength: 150,
              autofocus: true,
              buildCounter: (context,
                      {required currentLength,
                      required isFocused,
                      maxLength}) =>
                  const SizedBox.shrink(),
              // decoration: AppThemeStyle.textBoxInputDecoration(
              //   borderRadius: BorderRadius.zero,
              //   hintText: hintText,
              //   hintStyle: BodyText.defaultStyle.copyWith(
              //     color: AppColors.greyColor300,
              //   ),
              // ),
              onChanged: (value) {
                _textValue = value;
              },
            ),
            contentBuilder ?? Container(),
          ],
        ),
        buttonDirection: DialogButtonDirection.HORIZONTAL,
        negativeButton: DialogButton(
            buttonText: cancelText ?? S.current.COMMON__CONFIRM_BUTTON,
            minWidth: AppDimensions.buttonMinimalWidth,
            onButtonClick: () {
              onCancel();
            }),
        positiveButton: DialogButton(
            buttonText: oKText ?? S.current.COMMON__OK_BUTTON,
            minWidth: AppDimensions.buttonMinimalWidth,
            onButtonClick: () {
              onDone(_textValue);
            }),
        onCloseButtonPress: () {
          onCancel();
        },
      ),
    );
  }
}
