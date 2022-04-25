import 'package:flutter/material.dart';
import 'package:pet_presentation/colors/app_colors.dart';
import 'package:pet_presentation/resources/app_dimension.dart';
import 'package:pet_presentation/widgets/commons/typography/heading_text.dart';

class BasicLayout extends StatefulWidget {
  final bool automaticallyImplyLeading;
  final PreferredSizeWidget? appBar;
  final String? title;
  final Widget? child;
  final EdgeInsets? padding;
  const BasicLayout(
      {Key? key,
      this.automaticallyImplyLeading = false,
      this.appBar,
      this.child,
      this.title,
      this.padding})
      : super(key: key);

  @override
  State<BasicLayout> createState() => _BasicLayoutState();
}

class _BasicLayoutState extends State<BasicLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.automaticallyImplyLeading
          ? AppBar(
              elevation: 0.0,
              automaticallyImplyLeading: widget.automaticallyImplyLeading,
              leading: const InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Icon(
                  Icons.navigate_before,
                  size: 30,
                  color: AppColors.backGroundColor,
                ),
              ),
            )
          : null,
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: widget.padding ?? const EdgeInsets.all(AppDimension.defaultPadding),
        child: (widget.child != null)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadingText(widget.title),
                  Expanded(child: widget.child!)])
            : const SizedBox.shrink(),
      )),
    );
  }
}
