import 'package:flutter/material.dart';
import 'package:pet_project_flutter/util/colors/app_colors.dart';

class BasicLayout extends StatefulWidget {
  final bool automaticallyImplyLeading;
  final PreferredSizeWidget? appBar;
  final Widget? child;
  const BasicLayout(
      {Key? key,
      this.automaticallyImplyLeading = false,
      this.appBar,
      this.child})
      : super(key: key);

  @override
  State<BasicLayout> createState() => _BasicLayoutState();
}

class _BasicLayoutState extends State<BasicLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar ??
          AppBar(
            elevation: 0.0,
            automaticallyImplyLeading: widget.automaticallyImplyLeading,
            leading: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Icon(
                Icons.navigate_before,
                size: 40,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(child: widget.child ?? Container()),
    );
  }
}
