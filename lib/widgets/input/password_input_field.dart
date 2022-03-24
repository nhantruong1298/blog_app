import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PasswordInputField extends StatefulWidget {
  final String name;
  final String? initValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final Function(String text)? onChanged;
  const PasswordInputField(
      {Key? key,
      required this.name,
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
          return TextFormField(
            autovalidateMode: widget.autovalidateMode,
            autofillHints: [AutofillHints.password],
            controller: widget.controller,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
            initialValue: widget.initValue ?? '',
            onChanged: (value) {
              if (widget.onChanged != null) widget.onChanged!(value);
              field.didChange(value);
            },
          );
        },
        name: widget.name);
  }
}
