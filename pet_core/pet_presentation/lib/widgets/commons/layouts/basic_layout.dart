import 'package:flutter/material.dart';
import 'package:pet_presentation/resources/app_colors.dart';
import 'package:pet_presentation/resources/app_dimensions.dart';

class BasicLayout extends StatelessWidget {
  const BasicLayout({
    super.key,
    this.child,
    this.headerVisible = true,
    this.headerLeading,
    this.headerActions,
    this.title,
    this.centerTitle = true,
    this.padding,
    this.automaticallyImplyLeading = false,
    this.appBar,
    this.color,
    this.appBarColor,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.darkMode = false,
    this.safeTopPadding = true,
    this.builder,
    this.resizeToAvoidBottomInset = false,
  });
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
  final Color? color;
  final Color? appBarColor;

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
          // AppIcon.asset(
          //   darkMode
          //       ? Assets.images.arrowBackIcon
          //       : Assets.images.arrowBackBlackIcon,
          //   size: 24,
          // ),
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
    final appBackgroundColor = color ?? AppColors.backgroundColor;

    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: appBackgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        appBar: appBar as PreferredSizeWidget? ??
            AppBar(
              backgroundColor: appBarColor ?? AppColors.backgroundColor,
              automaticallyImplyLeading: automaticallyImplyLeading,
              leading: headerLeading ?? getDefaultLeading(context),
              actions: headerActions,
              toolbarHeight: headerVisible ? kToolbarHeight : 0,
              title: title,
              centerTitle: centerTitle,
              // brightness: darkMode
              //     ? Brightness.dark
              //     : Brightness.light, // or use Brightness.dark
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
