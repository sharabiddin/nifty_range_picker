import 'package:flutter/material.dart';

class NiftyRangePickerController extends ChangeNotifier {
  final DateTime _firstDate;
  final DateTime _lastDate;
  final DateTime currentDate;
  DateTimeRange? _selectedRange;

  NiftyRangePickerController({
    required DateTime firstDate,
    required DateTime lastDate,
    DateTime? currentDate,
  })  : _firstDate = firstDate,
        _lastDate = lastDate,
        currentDate = currentDate ?? DateTime.now();

  DateTime get firstDate => _firstDate;

  DateTime get lastDate => _lastDate;

  DateTimeRange? get selectedRange => _selectedRange;

  set selectedRange(DateTimeRange? value) {
    if (value != _selectedRange) {
      _selectedRange = value;
      notifyListeners();
    }
  }
}
