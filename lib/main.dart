import 'package:flutter/material.dart';
import 'package:flutter_imdb/pages/home.page.dart';
import 'package:flutter_imdb/services/translations.dart';
import 'package:flutter_imdb/widgets/launcher.widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(FlutterImdbApp());

class FlutterImdbApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LauncherWidget(
      child: MaterialApp(
        localizationsDelegates: [
          const TranslationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''),
        ],
        home: HomePage(),
      ),
    );
  }
}
