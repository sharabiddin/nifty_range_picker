import 'package:flutter/material.dart';
import 'package:nifty_range_picker/nifty_range_picker.dart';

import 'range_days_picker.dart';

class NiftyRangeDatePicker extends StatefulWidget {
  NiftyRangeDatePicker({
    super.key,
    this.isVerticalAligned,
    this.initialDate,
    this.padding = const EdgeInsets.all(16),
    this.contentPadding,
    this.daysOfTheWeekTextStyle,
    this.enabledCellsTextStyle,
    this.enabledCellsDecoration = const BoxDecoration(),
    this.disabledCellsTextStyle,
    this.disabledCellsDecoration = const BoxDecoration(),
    this.currentDateTextStyle,
    this.currentDateDecoration,
    this.selectedCellsTextStyle,
    this.selectedCellsDecoration,
    this.singleSelectedCellTextStyle,
    this.singleSelectedCellDecoration,
    this.leadingDateTextStyle,
    this.slidersColor,
    this.slidersSize,
    this.highlightColor,
    this.splashColor,
    this.dividerColor,
    this.splashRadius,
    this.daysOfTheWeekTextStyleColor,
    this.enabledCellsTextStyleColor,
    this.disabledCellsTextStyleColor,
    this.currentDateTextStyleColor,
    this.selectedCellsTextStyleColor,
    this.singleSelectedCellTextStyleColor,
    this.leadingDateTextStyleColor,
    this.currentDateDecorationColor,
    this.selectedCellsDecorationColor,
    this.singleSelectedCellDecorationColor,
    this.leftArrowIcon,
    this.rightArrowIcon,
    required this.controller,
  }) {
    assert(!controller.firstDate.isAfter(controller.lastDate), "minDate can't be after maxDate");
  }

  final NiftyRangePickerController controller;

  final DateTime? initialDate;

  final EdgeInsets padding;

  final TextStyle? daysOfTheWeekTextStyle;

  final TextStyle? enabledCellsTextStyle;

  final BoxDecoration enabledCellsDecoration;

  final TextStyle? disabledCellsTextStyle;

  final BoxDecoration disabledCellsDecoration;

  final TextStyle? currentDateTextStyle;

  final BoxDecoration? currentDateDecoration;

  final TextStyle? selectedCellsTextStyle;

  final BoxDecoration? selectedCellsDecoration;

  final TextStyle? singleSelectedCellTextStyle;

  final BoxDecoration? singleSelectedCellDecoration;

  final TextStyle? leadingDateTextStyle;

  final Color? slidersColor;

  final double? slidersSize;

  final Color? splashColor;
  final Color? dividerColor;

  final Color? highlightColor;

  final double? splashRadius;

  final Color? daysOfTheWeekTextStyleColor;

  final Color? enabledCellsTextStyleColor;

  final Color? disabledCellsTextStyleColor;

  final Color? currentDateTextStyleColor;

  final Color? selectedCellsTextStyleColor;

  final Color? singleSelectedCellTextStyleColor;

  final Color? leadingDateTextStyleColor;

  final Color? currentDateDecorationColor;

  final Color? selectedCellsDecorationColor;

  final Color? singleSelectedCellDecorationColor;
  final bool? isVerticalAligned;
  final Widget? leftArrowIcon;
  final Widget? rightArrowIcon;
  final EdgeInsets? contentPadding;

  @override
  State<NiftyRangeDatePicker> createState() => _NiftyRangeDatePickerState();
}

class _NiftyRangeDatePickerState extends State<NiftyRangeDatePicker> {
  DateTime? _diplayedDate;
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;

  @override
  void initState() {
    _diplayedDate = DateUtils.dateOnly(widget.initialDate ?? DateTime.now());

    if (widget.controller.selectedRange != null) {
      _selectedStartDate = DateUtils.dateOnly(widget.controller.selectedRange!.start);
      _selectedEndDate = DateUtils.dateOnly(widget.controller.selectedRange!.end);
    }

    super.initState();
  }

  @override
  void didUpdateWidget(covariant NiftyRangeDatePicker oldWidget) {
    if (widget.controller.selectedRange != oldWidget.controller.selectedRange) {
      if (widget.controller.selectedRange == null) {
        _selectedStartDate = null;
        _selectedEndDate = null;
      } else {
        _selectedStartDate = DateUtils.dateOnly(widget.controller.selectedRange!.start);
        _selectedEndDate = DateUtils.dateOnly(widget.controller.selectedRange!.end);
      }
    }

    if (widget.initialDate != oldWidget.initialDate) {
      _diplayedDate = DateUtils.dateOnly(widget.initialDate ?? DateTime.now());
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) => RangeDaysPicker(
        currentDate: DateUtils.dateOnly(widget.controller.currentDate),
        initialDate: _diplayedDate,
        isVerticalAligned: widget.isVerticalAligned,
        selectedEndDate: _selectedEndDate,
        selectedStartDate: _selectedStartDate,
        maxDate: DateUtils.dateOnly(widget.controller.lastDate),
        minDate: DateUtils.dateOnly(widget.controller.firstDate),
        daysOfTheWeekTextStyle: widget.daysOfTheWeekTextStyle,
        enabledCellsTextStyle: widget.enabledCellsTextStyle,
        enabledCellsDecoration: widget.enabledCellsDecoration,
        disabledCellsTextStyle: widget.disabledCellsTextStyle,
        disabledCellsDecoration: widget.disabledCellsDecoration,
        currentDateDecoration: widget.currentDateDecoration,
        currentDateTextStyle: widget.currentDateTextStyle,
        selectedCellsDecoration: widget.selectedCellsDecoration,
        selectedCellsTextStyle: widget.selectedCellsTextStyle,
        singelSelectedCellTextStyle: widget.singleSelectedCellTextStyle,
        singelSelectedCellDecoration: widget.singleSelectedCellDecoration,
        slidersColor: widget.slidersColor,
        slidersSize: widget.slidersSize,
        leadingDateTextStyle: widget.leadingDateTextStyle,
        splashColor: widget.splashColor,
        highlightColor: widget.highlightColor,
        dividerColor: widget.dividerColor,
        splashRadius: widget.splashRadius,
        daysOfTheWeekTextStyleColor: widget.daysOfTheWeekTextStyleColor,
        enabledCellsTextStyleColor: widget.enabledCellsTextStyleColor,
        disabledCellsTextStyleColor: widget.disabledCellsTextStyleColor,
        currentDateTextStyleColor: widget.currentDateTextStyleColor,
        selectedCellsTextStyleColor: widget.selectedCellsTextStyleColor,
        singleSelectedCellTextStyleColor: widget.singleSelectedCellTextStyleColor,
        leadingDateTextStyleColor: widget.leadingDateTextStyleColor,
        currentDateDecorationColor: widget.currentDateDecorationColor,
        selectedCellsDecorationColor: widget.selectedCellsDecorationColor,
        singleSelectedCellDecorationColor: widget.singleSelectedCellDecorationColor,
        leftArrowIcon: widget.leftArrowIcon,
        rightArrowIcon: widget.rightArrowIcon,
        contentPadding: widget.contentPadding,
        onEndDateChanged: (date) {
          setState(() {
            _selectedEndDate = date;
          });

          if (_selectedStartDate != null) {
            widget.controller.selectedRange = DateTimeRange(
              start: _selectedStartDate!,
              end: _selectedEndDate!,
            );
          }
        },
        onStartDateChanged: (date) {
          setState(() {
            _selectedStartDate = date;
            _selectedEndDate = null;
          });
          widget.controller.selectedRange = DateTimeRange(
            start: _selectedStartDate!,
            end: _selectedStartDate!,
          );
        },
      );
}
