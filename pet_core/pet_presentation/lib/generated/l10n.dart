// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Email`
  String get SIGN_IN__EMAIL {
    return Intl.message(
      'Email',
      name: 'SIGN_IN__EMAIL',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get SIGN_IN__PASSWORD {
    return Intl.message(
      'Password',
      name: 'SIGN_IN__PASSWORD',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get SIGN_IN__TEXT {
    return Intl.message(
      'Sign in',
      name: 'SIGN_IN__TEXT',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get COMMON__CANCEL_BUTTON {
    return Intl.message(
      'Cancel',
      name: 'COMMON__CANCEL_BUTTON',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get COMMON__OK_BUTTON {
    return Intl.message(
      'OK',
      name: 'COMMON__OK_BUTTON',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get COMMON__CONFIRM_BUTTON {
    return Intl.message(
      'Confirm',
      name: 'COMMON__CONFIRM_BUTTON',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected error`
  String get EXCEPTION__UNEXPECTED {
    return Intl.message(
      'Unexpected error',
      name: 'EXCEPTION__UNEXPECTED',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
