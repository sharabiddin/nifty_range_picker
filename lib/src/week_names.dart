import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class WeekNames extends StatelessWidget {
  const WeekNames({
    super.key,
    required this.daysOfTheWeekTextStyle,
  });

  final TextStyle daysOfTheWeekTextStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _dayHeaders(
        daysOfTheWeekTextStyle,
        Localizations.localeOf(context),
        MaterialLocalizations.of(context),
      ),
    );
  }

  List<Widget> _dayHeaders(
    TextStyle headerStyle,
    Locale locale,
    MaterialLocalizations localizations,
  ) {
    final List<Widget> result = <Widget>[];
    final weekdayNames =
        intl.DateFormat('', locale.toString()).dateSymbols.WEEKDAYS.map((e) => e[0].toUpperCase()).toList();

    for (int i = localizations.firstDayOfWeekIndex; true; i = (i + 1) % 7) {
      final String weekday = weekdayNames[i];
      result.add(
        ExcludeSemantics(
          child: Center(
            child: Text(
              weekday.toUpperCase(),
              style: daysOfTheWeekTextStyle,
            ),
          ),
        ),
      );
      if (i == (localizations.firstDayOfWeekIndex - 1) % 7) {
        break;
      }
    }
    return result;
  }
}
