import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pet_presentation/resources/app_colors.dart';
import 'package:pet_presentation/widgets/layouts/tab_layout/fab_bottom_app_bar.dart';

class TabLayout extends StatefulWidget {
  final ValueChanged<int>? onDoubleTap;

  final ValueChanged<int>? onTabSelected;

  TabLayout({
    Key? key,
    this.screens,
    this.items,
    this.onWillPop,
    this.color,
    this.swipeable = true,
    this.appBarColor = AppColors.backgroundColor,
    this.headerVisible = true,
    this.centerButton,
    this.centerButtonText,
    this.bottomAppBarColor,
    this.onScaffoldInit,
    this.bottomAppBarActiveColor,
    this.darkMode = false,
    this.controller,
    this.onDoubleTap,
    this.onTabSelected,
  }) : super(key: key) {
    assert(items!.length == screens!.length);
  }

  final TabController? controller;
  final bool swipeable;
  final Color? color;
  final Color appBarColor;
  final Color? bottomAppBarColor;
  final Color? bottomAppBarActiveColor;
  final bool headerVisible;
  final List<FABBottomAppBarItem>? items;
  final List<Widget>? screens;
  final Widget? centerButton;
  final String? centerButtonText;
  final bool darkMode;
  final void Function(BuildContext scaffoldContext)? onScaffoldInit;

  @override
  _TabLayoutState createState() => _TabLayoutState();

  final Function()? onWillPop;
}

class _TabLayoutState extends State<TabLayout>
    with SingleTickerProviderStateMixin {
  final StreamController<int> _indexStream = StreamController();
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = widget.controller ??
        TabController(vsync: this, length: widget.screens!.length);
    _indexStream.add(0);

    _tabController!.addListener(onTabIndexUpdated);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (widget.onScaffoldInit != null) widget.onScaffoldInit(context);
    // });
  }

  onTabIndexUpdated() {
    _indexStream.add(_tabController!.index);
  }

  @override
  void dispose() {
    _indexStream.close();
    _tabController!.removeListener(onTabIndexUpdated);
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (widget.onScaffoldInit != null) {
            widget.onScaffoldInit!(context);
          }
          return SafeArea(
            top: false,
            // maintainBottomViewPadding: false,
            child: TabBarView(
              controller: _tabController,
              children: widget.screens!,
              physics: widget.swipeable
                  ? const PageScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
            ),
          );
        },
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: _buildFab(snapshot,
      // context), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _onTabSelected(int index) {
    _tabController!.animateTo(index);
    widget.onTabSelected?.call(index);
    // _indexStream.add(index);
  }

  Widget _buildBottomNavigationBar() {
    return StreamBuilder<int>(
        stream: _indexStream.stream,
        builder: (context, snapshot) {
          return FABBottomAppBar(
            index: snapshot.data ?? 0,
            centerItemText: widget.centerButtonText,
            color: widget.bottomAppBarColor,
            selectedColor: widget.bottomAppBarActiveColor,
            notchedShape: const CircularNotchedRectangle(),
            onTabSelected: (int? index) {
              if (_tabController!.index != index) {
                _onTabSelected(index!);
              } else {
                widget.onDoubleTap?.call(index!);
              }
            },
            items: widget.items,
          );
        });
  }

  ///* Example for overlay here:
  /// final icons = [Icons.sms, Icons.mail, Icons.phone];
  ///* AnchoredOverlay(
  ///   showOverlay: true,
  ///   overlayBuilder: (context, offset) {
  ///     return CenterAbout(
  ///       position: Offset(offset.dx, offset.dy - icons.length * 35.0),
  ///       child: FabWithIcons(
  ///         icons: icons,
  ///         onIconTapped: (int index) {
  ///           if (snapshot.data != index) _onTabSelected(index);
  ///         },
  ///       ),
  ///     );
  ///   },
  ///   child: FloatingActionButton(
  ///     onPressed: () {},
  ///     tooltip: 'Increment',
  ///     child: Icon(Icons.add),
  ///     elevation: 2.0,
  ///   ),
  /// );
  ///
  // _buildFab(AsyncSnapshot<int> snapshot, BuildContext context) {
  //   return widget.centerButton;
  // }

}
