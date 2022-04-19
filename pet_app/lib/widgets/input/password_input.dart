import 'package:flutter/material.dart';
import 'package:pet_project_flutter/util/colors/app_colors.dart';

class PasswordInput extends StatefulWidget {
  final List<String>? autofillHints;
  final InputDecoration? decoration;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final String? errorText;
  final String label;
  PasswordInput(
      {Key? key,
      this.autofillHints,
      this.decoration,
      this.controller,
      this.onChanged,
      this.focusNode,
      required this.label,
      this.errorText})
      : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  late final FocusNode _focusNode;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(onFocus);
  }

  @override
  void dispose() {
    _focusNode.removeListener(onFocus);
    _focusNode.dispose();
    super.dispose();
  }

  void onFocus() {
    print('on focus');
    setState(() {
      _hasFocus = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofillHints: [AutofillHints.password],
      controller: widget.controller,
      decoration: widget.decoration ??
          InputDecoration(
              errorText: widget.errorText,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              labelStyle: _getLabelStyle(),
              labelText: widget.label,
              hintText: (_hasFocus) ? '' : widget.label,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.blue))),
      onChanged: (value) {
        widget.onChanged?.call(value);
      },
      focusNode: _focusNode,
    );
  }

  TextStyle _getLabelStyle() {
    return (_hasFocus)
        ? TextStyle(color: AppColors.primaryColor)
        : TextStyle(color: AppColors.textColor);
  }
}
