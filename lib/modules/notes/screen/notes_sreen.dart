import 'package:flutter/material.dart';
import 'package:pet_project_flutter/modules/notes/screen/main_note.dart';
import 'package:pet_project_flutter/modules/notes/screen/sub_note.dart';
import 'package:pet_project_flutter/util/colors/app_colors.dart';
import 'package:pet_project_flutter/util/widgets/app_widgets.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBlue,
      appBar: AppWidgets.appbar(),
      body: PageView(
        controller: _pageController,
        children: [MainNote(), SubNote()],
      ),
    );
  }
}
