import 'package:flutter/material.dart';
import 'package:pet_project_flutter/app/routes.dart';

class PetApplication extends StatelessWidget {
  @override
  Widget build(_) {
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      debugShowCheckedModeBanner: false,
    );
  }
}
