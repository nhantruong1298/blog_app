import 'package:flutter/material.dart';
import 'package:pet_presentation/widgets/commons/layouts/avoid_keyboard.dart';


class KeyboardAvoidScrollView extends StatefulWidget {
  const KeyboardAvoidScrollView({
    Key? key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.autoScroll = true,
    this.padding,
  }) : super(key: key);

  final EdgeInsets? padding;
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final bool autoScroll;
  @override
  _KeyboardAvoidScrollViewState createState() =>
      _KeyboardAvoidScrollViewState();
}

class _KeyboardAvoidScrollViewState extends State<KeyboardAvoidScrollView> {
  @override
  Widget build(BuildContext context) {
    return AvoidKeyboard(
        child: SingleChildScrollView(
      child: Padding(
        padding: widget.padding ?? EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: widget.crossAxisAlignment,
          mainAxisAlignment: widget.mainAxisAlignment,
          mainAxisSize: widget.mainAxisSize,
          children: widget.children,
        ),
      ),
    ));
  }
}
