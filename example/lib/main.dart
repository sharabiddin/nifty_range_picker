import 'package:example/nifty_range_picker_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    const MaterialApp(
      locale: Locale("en", "En"),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("az", "AZ"),
        const Locale("en", "US"),
        const Locale("ru", "RU"),
      ],
      home: NiftyRangePickerExamplePage(),
    ),
  );
}
