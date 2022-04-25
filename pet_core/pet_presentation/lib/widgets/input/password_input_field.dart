import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pet_presentation/widgets/input/password_input.dart';

class PasswordInputField extends StatefulWidget {
  final String name;
  final String? initValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final String label;
  final Function(String text)? onChanged;
  const PasswordInputField(
      {Key? key,
      required this.name,
      required this.label,
      this.initValue,
      this.validator,
      this.autovalidateMode,
      this.onChanged,
      this.controller})
      : super(key: key);

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
        initialValue: widget.initValue ?? '',
        validator: widget.validator,
        autovalidateMode: widget.autovalidateMode ?? AutovalidateMode.disabled,
        builder: (field) {
          return PasswordInput(
            label: widget.label,
            errorText: field.errorText,
            onChanged: (text) {
              field.didChange(text);
            },
          );
        },
        name: widget.name);
  }
}
