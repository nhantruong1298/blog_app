import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pet_presentation/widgets/input/password_input.dart';

import './types.dart';

class PasswordInputField extends StatelessWidget {
  final bool readOnly;
  final String name;
  final String labelText;
  final String? initialValue;
  final TextInputAction textInputAction;
  final String? hintText;
  final TextStyle? hintStyle;
  final List<String> autofillHints;
  final FormValidator<String>? validator;
  final Function(String value)? onChanged;
  final AutovalidateMode? autovalidateMode;

  const PasswordInputField(
      {Key? key,
      required this.name,
      this.labelText = '',
      this.readOnly = false,
      this.initialValue,
      this.textInputAction = TextInputAction.done,
      this.autofillHints = const [AutofillHints.password],
      this.hintText,
      this.hintStyle,
      this.validator,
      this.onChanged,
      this.autovalidateMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
        name: name,
        enabled: !readOnly,
        validator: validator,
        initialValue: initialValue,
        autovalidateMode:
            autovalidateMode ?? AutovalidateMode.onUserInteraction,
        builder: (field) {
          return PasswordInput(
            errorText: field.errorText,
            initialValue: initialValue,
            autofillHints: autofillHints,
            textInputAction: textInputAction,
            readOnly: readOnly,
            labelText: labelText,
            hintText: hintText,
            hintStyle: hintStyle,
            onTap: () {
              if (autovalidateMode != AutovalidateMode.disabled) {
                field.validate();
              }
            },
            onChanged: (value) {
              if (onChanged != null) onChanged!(value);
              field.didChange(value);
            },
          );
        });
  }
}
