import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PasswordInputField extends StatefulWidget {
  final String name;
  final String? initValue;
  const PasswordInputField({Key? key, required this.name, this.initValue})
      : super(key: key);

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
        initialValue: widget.initValue ?? '',
        //validator: FormBuilderValidators.compose([]),
        builder: (field) {
          return TextFormField(
            initialValue: widget.initValue ?? '',
            onChanged: (value) {
              field.didChange(value);
            },
          );
        },
        name: widget.name);
  }
}
