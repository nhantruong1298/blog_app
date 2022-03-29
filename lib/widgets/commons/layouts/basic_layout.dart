import 'package:flutter/material.dart';
import 'package:pet_project_flutter/resources/app_dimension.dart';
import 'package:pet_project_flutter/util/colors/app_colors.dart';

class BasicLayout extends StatefulWidget {
  final bool automaticallyImplyLeading;
  final PreferredSizeWidget? appBar;
  final Widget? child;
  final EdgeInsets? padding;
  const BasicLayout(
      {Key? key,
      this.automaticallyImplyLeading = false,
      this.appBar,
      this.child,
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
              leading: InkWell(
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
        padding: widget.padding ?? EdgeInsets.all(AppDimension.defaultPadding),
        child: widget.child ?? Container(),
      )),
    );
  }
}
