import 'package:flutter/material.dart';
import './routes.dart';

class PetApplication extends StatefulWidget {
  const PetApplication({Key? key}) : super(key: key);

  @override
  State<PetApplication> createState() => _PetApplicationState();
}

class _PetApplicationState extends State<PetApplication> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
