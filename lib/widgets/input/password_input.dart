import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final List<String>? autofillHints;
  final InputDecoration? decoration;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  PasswordInput(
      {Key? key,
      this.autofillHints,
      this.decoration,
      this.controller,
      this.onChanged,
      this.focusNode})
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
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            
          ),
      onChanged: (value) {
        widget.onChanged?.call(value);
      },
      focusNode: _focusNode,
    );
  }
}
