import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pet_presentation/resources/app_colors.dart';
import 'package:pet_presentation/resources/app_theme.dart';
import 'package:pet_presentation/widgets/input/types.dart';


class TextInputField extends StatefulWidget {
  final bool readOnly;
  final String name;
  final String? initialValue;
  final String? labelText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? textStyle;
  final int? maxLength;
  final Function(String? value)? onChanged;
  final VoidCallback? onTap;
  final EdgeInsets? contentPadding;
  final bool disable;
  final FocusNode? focusNode;
  final String? hintText;
  final bool markRequired;
  final TextStyle? hintStyle;
  final List<String>? autofillHints;
  final bool autocorrect;
  final FormValidator<String?>? validator;
  final AutovalidateMode? autovalidateMode;
  final TextCapitalization? textCapitalization;

  const TextInputField({
    Key? key,
    required this.name,
    this.validator,
    this.initialValue,
    this.labelText,
    this.textInputAction = TextInputAction.done,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.inputFormatters,
    this.textStyle,
    this.readOnly = false,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.autofillHints,
    this.autocorrect = false,
    this.contentPadding,
    this.disable = false,
    this.focusNode,
    this.hintText,
    this.hintStyle,
    this.markRequired = false,
    this.autovalidateMode,
    this.textCapitalization,
  }) : super(key: key);

  @override
  _TextInputFieldState createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  late FocusNode _focusNode;

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

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
        initialValue: widget.initialValue,
        validator: widget.validator,
        name: widget.name,
        autovalidateMode:
            widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
        onTap: widget.onTap,
        autocorrect: widget.autocorrect,
        focusNode: _focusNode,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        inputFormatters: widget.inputFormatters,
        style: widget.disable
            ? widget.textStyle?.copyWith(color: AppColors.textGreyColor)
            : widget.textStyle,
        readOnly: widget.readOnly,
        maxLength: widget.maxLength,
        autofillHints: widget.readOnly ? null : widget.autofillHints,
        onChanged: widget.onChanged,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        decoration: AppThemeStyle.inputDecoration(
          contentPadding: widget.contentPadding,
          suffixIcon: widget.suffixIcon,
          hintText: widget.hintText,
          label: _buildLabel(_hasFocus),
        ));
  }

  Widget _buildLabel(bool hasFocus) {
    return Row(
      children: [
        Text('${widget.labelText ?? ''} ', style: _getLabelStyle(hasFocus)),
        Text(
          (widget.markRequired) ? '*' : '',
          style: const TextStyle(color: AppColors.errorColor),
        )
      ],
    );
  }

  TextStyle _getLabelStyle(bool hasFocus) {
    return TextStyle(
      color: hasFocus ? AppColors.primaryColor500 : AppColors.textGreyColor,
    );
  }

  void onFocus() {
    setState(() {
      _hasFocus = _focusNode.hasFocus;
    });
  }
}
