// ignore: file_names
import 'package:flutter/material.dart';
import 'package:pet_core/pet_core.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static Future<void> initConfig() async {
    await PetCore.initConfig();
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const PetCore();
  }
}
