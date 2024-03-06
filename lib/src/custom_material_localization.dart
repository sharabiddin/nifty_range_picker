import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomMaterialLocalizationsDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  const CustomMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<MaterialLocalizations> load(Locale locale) =>
      SynchronousFuture<MaterialLocalizations>(CustomMaterialLocalizations());

  @override
  bool shouldReload(CustomMaterialLocalizationsDelegate old) => false;
}

class CustomMaterialLocalizations extends DefaultMaterialLocalizations {
  @override
  int get firstDayOfWeekIndex => DateTime.monday;
}
