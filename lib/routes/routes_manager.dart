import 'package:get/get.dart';
import 'package:pet_project_flutter/main.dart' show MyHomePage;
import 'package:pet_project_flutter/modules/notes/screen/notes_sreen.dart';
import 'package:pet_project_flutter/modules/profile/screen/profile_screen.dart'
    show ProfileScreen;

class RoutesManager {
  static List<GetPage> listRoutes = [
    GetPage(name: '/', page: () => MyHomePage()),
    GetPage(name: '/profile', page: () => ProfileScreen()),
    GetPage(name: '/notes', page: () => NotesScreen()),
  ];
}
