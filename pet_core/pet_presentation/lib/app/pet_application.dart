import 'package:flutter/material.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:pet_presentation/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
      debugShowCheckedModeBanner: false,
      routerDelegate: router.routerDelegate,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FormBuilderLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
