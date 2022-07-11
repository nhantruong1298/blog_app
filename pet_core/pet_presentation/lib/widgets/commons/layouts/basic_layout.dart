import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_presentation/resources/app_colors.dart';
import 'package:pet_presentation/resources/app_dimensions.dart';
import 'package:pet_presentation/widgets/icons/app_icon.dart';

class BasicLayout extends StatelessWidget {
  const BasicLayout({
    Key? key,
    this.child,
    this.headerVisible = true,
    this.headerLeading,
    this.headerActions,
    this.title,
    this.centerTitle = true,
    this.padding,
    this.automaticallyImplyLeading = false,
    this.appBar,
    this.color = AppColors.backgroundColor,
    this.appBarColor = AppColors.backgroundColor,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.darkMode = false,
    this.safeTopPadding = true,
    this.builder,
    this.resizeToAvoidBottomInset = false,
  }) : super(key: key);
  final Widget Function(BuildContext scaffoldContext)? builder;

  static const defaultPadding = EdgeInsets.fromLTRB(
      1 * AppDimensions.defaultPadding,
      0,
      1 * AppDimensions.defaultPadding,
      1 * AppDimensions.defaultPadding);
  final bool safeTopPadding;
  final Widget? appBar;
  final bool automaticallyImplyLeading;
  final Widget? bottomNavigationBar;
  final Widget? child;
  final Color color;
  final Color appBarColor;

  final List<Widget>? headerActions;
  final Widget? headerLeading;
  final bool headerVisible;
  final EdgeInsets? padding;
  final Widget? title;
  final bool centerTitle;
  final Widget? floatingActionButton;
  final bool darkMode;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool resizeToAvoidBottomInset;

  Widget? getDefaultLeading(BuildContext context) {
    if (automaticallyImplyLeading == true) {
      final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
      final bool canPop = parentRoute?.canPop ?? false;

      if (canPop) {
        return IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
          onPressed: () {
            Navigator.of(context).pop();
          },
        );
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final appBackgroundColor = color;

    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: appBackgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        appBar: appBar as PreferredSizeWidget? ??
            AppBar(
              backgroundColor: appBarColor,
              automaticallyImplyLeading: automaticallyImplyLeading,
              leading: headerLeading ?? getDefaultLeading(context),
              actions: headerActions,
              toolbarHeight: headerVisible ? kToolbarHeight : 0,
              title: title,
              centerTitle: centerTitle,
              systemOverlayStyle: darkMode
                  ? SystemUiOverlayStyle.light
                  : SystemUiOverlayStyle.dark,
            ),
        body: Container(
          color: appBackgroundColor,
          child: SafeArea(
              top: safeTopPadding,
              maintainBottomViewPadding: true,
              child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: padding ?? defaultPadding,
                  child: _getBuildMethod())),
        ));
  }

  Widget _getBuildMethod() {
    return Builder(
      builder: (builderContext) {
        if (builder != null) {
          return builder!(builderContext);
        }
        return child!;
      },
    );
  }
}
