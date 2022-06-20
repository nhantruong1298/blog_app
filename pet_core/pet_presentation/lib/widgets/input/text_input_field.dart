import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pet_presentation/resources/app_dimensions.dart';

class TextInputField extends StatefulWidget {
  final String name;
  final String? initValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final Function(String text)? onChanged;
  final TextInputType? textInputType;
  final List<String>? autoFillHints;
  final String label;
  const TextInputField(
      {Key? key,
      required this.name,
      this.initValue,
      this.validator,
      this.autovalidateMode,
      this.onChanged,
      this.controller,
      this.autoFillHints,
      required this.label,
      this.textInputType})
      : super(key: key);

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
        initialValue: widget.initValue ?? '',
        validator: widget.validator,
        builder: (field) {
          final errorText = field.errorText;
          return TextFormField(
            autovalidateMode: widget.autovalidateMode,
            keyboardType: widget.textInputType,
            autofillHints: widget.autoFillHints,
            decoration: InputDecoration(
                labelText: widget.label,
                errorText: errorText,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(AppDimensions.defaultRadius)),
                    borderSide: BorderSide(color: Colors.blue))),
            onChanged: (text) {
              field.didChange(text);
            },
            onTap: () {
              if (widget.autovalidateMode != AutovalidateMode.disabled)
                field.validate();
            },
          );
        },
        name: widget.name);
  }
}
