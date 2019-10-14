import 'package:app_desafio_inovacao/core/prefs/preferences.dart';
import 'package:app_desafio_inovacao/main/auth/auth_page.dart';
import 'package:app_desafio_inovacao/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Health Booklet',
        theme: theme,
        home: AuthPage(prefs: Preferences()));
  }
}
