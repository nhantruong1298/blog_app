import 'package:flutter/material.dart';
import 'package:pet_presentation/app/pet_application.dart';
import 'package:pet_presentation/injectors/all.dart';

class PetCore extends StatelessWidget {
  const PetCore({Key? key}) : super(key: key);

  static Future<void> initConfig() async {
    await configureDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const PetApplication();
  }
}
