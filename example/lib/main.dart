import 'package:example/nifty_range_picker_example.dart';
import 'package:flutter/material.dart';
import 'package:nifty_range_picker/nifty_range_picker.dart';

void main() {
  runApp(
    MaterialApp(
      locale: Locale("ru", "RU"),
      localizationsDelegates: const [
        CustomMaterialLocalizationsDelegate(),
      ],
      home: NiftyRangePickerExamplePage(),
    ),
  );
}
