import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pet_project_flutter/app/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pet_project_flutter/generated/l10n.dart';

class PetApplication extends StatelessWidget {
  @override
  Widget build(_) {
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      localizationsDelegates: [
        FormBuilderLocalizations.delegate,
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
