import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final bool readOnly;
  final String labelText;
  final String? initialValue;
  final String? value;
  final TextInputAction textInputAction;
  final List<String> autofillHints;
  final Function(String value)? onChanged;
  final TextEditingController? controller;
  final String? errorText;
  final InputDecoration? decoration;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final VoidCallback? onTap;
  final VoidCallback? onFocus;

  const PasswordInput(
      {Key? key,
      this.readOnly = false,
      this.labelText = '',
      this.initialValue,
      this.value,
      this.textInputAction = TextInputAction.done,
      this.autofillHints = const [AutofillHints.password],
      this.onChanged,
      this.controller,
      this.errorText,
      this.decoration,
      this.hintText,
      this.hintStyle,
      this.onTap,
      this.onFocus,
      this.labelStyle})
      : super(key: key);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  TextEditingController? _passwordController;

  bool isPasswordVisible = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _passwordController =
        TextEditingController(text: widget.initialValue ?? '');
    if (widget.onFocus != null) {
      _focusNode.addListener(widget.onFocus!);
    }

    super.initState();
  }

  @override
  void dispose() {
    _passwordController!.dispose();
    if (widget.onFocus != null) {
      _focusNode.removeListener(widget.onFocus!);
    }
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Widget assetIcon = isPasswordVisible
        ? const Icon(Icons.visibility_off)
        : const Icon(Icons.visibility);
    final effectiveDecoration = const InputDecoration()
        .applyDefaults(Theme.of(context).inputDecorationTheme);

    return TextField(
        readOnly: widget.readOnly,
        focusNode: _focusNode,
        controller: widget.controller ?? _passwordController,
        obscureText: !isPasswordVisible,
        textInputAction: widget.textInputAction,
        autofillHints: widget.readOnly ? null : widget.autofillHints,
        onTap: () {
          widget.onTap?.call();
        },
        onChanged: (value) {
          widget.onChanged?.call(value);
        },
        decoration: (widget.decoration ?? effectiveDecoration).copyWith(
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelText: widget.labelText,
            labelStyle: widget.labelStyle,
            errorText: widget.errorText,
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            suffixIcon: IconButton(
              icon: assetIcon,
              onPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
            )));
  }
}
