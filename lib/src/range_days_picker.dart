import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nifty_range_picker/src/header.dart';
import 'package:nifty_range_picker/src/leading_date.dart';
import 'package:nifty_range_picker/src/range_days_view.dart';
import 'package:nifty_range_picker/src/week_names.dart';

class RangeDaysPicker extends StatefulWidget {
  RangeDaysPicker({
    super.key,
    required this.minDate,
    required this.maxDate,
    this.isVerticalAligned = false,
    this.initialDate,
    this.contentPadding,
    this.currentDate,
    this.selectedStartDate,
    this.selectedEndDate,
    this.daysOfTheWeekTextStyle,
    this.enabledCellsTextStyle,
    this.enabledCellsDecoration = const BoxDecoration(),
    this.disabledCellsTextStyle,
    this.disabledCellsDecoration = const BoxDecoration(),
    this.currentDateTextStyle,
    this.currentDateDecoration,
    this.selectedCellsTextStyle,
    this.selectedCellsDecoration,
    this.singelSelectedCellTextStyle,
    this.singelSelectedCellDecoration,
    this.onLeadingDateTap,
    this.onStartDateChanged,
    this.onEndDateChanged,
    this.leadingDateTextStyle,
    this.slidersColor,
    this.slidersSize,
    this.highlightColor,
    this.splashColor,
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
    this.dividerColor,
    this.leftArrowIcon,
    this.rightArrowIcon,
  }) {
    assert(!minDate.isAfter(maxDate), "minDate can't be after maxDate");

    assert(
      () {
        if (initialDate == null) return true;
        final init = DateTime(initialDate!.year, initialDate!.month, initialDate!.day);

        final min = DateTime(minDate.year, minDate.month, minDate.day);

        return init.isAfter(min) || init.isAtSameMomentAs(min);
      }(),
      'initialDate $initialDate must be on or after minDate $minDate.',
    );
    assert(
      () {
        if (initialDate == null) return true;
        final init = DateTime(initialDate!.year, initialDate!.month, initialDate!.day);

        final max = DateTime(maxDate.year, maxDate.month, maxDate.day);
        return init.isBefore(max) || init.isAtSameMomentAs(max);
      }(),
      'initialDate $initialDate must be on or before maxDate $maxDate.',
    );
  }

  final DateTime? initialDate;
  final bool? isVerticalAligned;

  final DateTime? currentDate;

  final DateTime? selectedStartDate;

  final DateTime? selectedEndDate;

  final ValueChanged<DateTime>? onStartDateChanged;

  final ValueChanged<DateTime>? onEndDateChanged;

  final DateTime minDate;

  final DateTime maxDate;

  final VoidCallback? onLeadingDateTap;

  final TextStyle? daysOfTheWeekTextStyle;

  final TextStyle? enabledCellsTextStyle;

  final BoxDecoration enabledCellsDecoration;

  final TextStyle? disabledCellsTextStyle;

  final BoxDecoration disabledCellsDecoration;

  final TextStyle? currentDateTextStyle;

  final BoxDecoration? currentDateDecoration;

  final TextStyle? selectedCellsTextStyle;

  final BoxDecoration? selectedCellsDecoration;

  final TextStyle? singelSelectedCellTextStyle;

  final BoxDecoration? singelSelectedCellDecoration;

  final TextStyle? leadingDateTextStyle;

  final Color? slidersColor;

  final double? slidersSize;

  final Color? splashColor;

  final Color? highlightColor;
  final Color? dividerColor;

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
  final Widget? leftArrowIcon;
  final Widget? rightArrowIcon;
  final EdgeInsets? contentPadding;

  @override
  State<RangeDaysPicker> createState() => __RangeDaysPickerState();
}

class __RangeDaysPickerState extends State<RangeDaysPicker> {
  DateTime? _displayedMonth;
  final GlobalKey _pageViewKey = GlobalKey();
  late final PageController _pageController;

  double maxHeight = 47.5 * 6;

  @override
  void initState() {
    _displayedMonth = DateUtils.dateOnly(widget.initialDate ?? DateTime.now());
    _pageController = PageController(
      initialPage: DateUtils.monthDelta(widget.minDate, _displayedMonth!),
    );

    super.initState();
  }

  @override
  void didUpdateWidget(covariant RangeDaysPicker oldWidget) {
    if (oldWidget.initialDate != widget.initialDate) {
      _displayedMonth = DateUtils.dateOnly(widget.initialDate ?? DateTime.now());
      _pageController.jumpToPage(
        DateUtils.monthDelta(widget.minDate, _displayedMonth!),
      );
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle daysOfTheWeekTextStyle = widget.daysOfTheWeekTextStyle ??
        TextStyle(
          color: widget.daysOfTheWeekTextStyleColor ?? Theme.of(context).textTheme.subtitle1!.color!.withOpacity(0.30),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        );

    final TextStyle enabledCellsTextStyle = widget.enabledCellsTextStyle ??
        TextStyle(
          fontWeight: FontWeight.normal,
          color: widget.enabledCellsTextStyleColor ?? Theme.of(context).textTheme.subtitle1!.color,
        );

    final BoxDecoration enabledCellsDecoration = widget.enabledCellsDecoration;

    final TextStyle disabledCellsTextStyle = widget.disabledCellsTextStyle ??
        TextStyle(
          fontWeight: FontWeight.normal,
          color: widget.disabledCellsTextStyleColor ?? Theme.of(context).textTheme.subtitle1!.color!.withOpacity(0.30),
        );

    final BoxDecoration disbaledCellsDecoration = widget.disabledCellsDecoration;

    final TextStyle currentDateTextStyle = widget.currentDateTextStyle ??
        TextStyle(
          fontWeight: FontWeight.normal,
          color: widget.currentDateTextStyleColor ?? Theme.of(context).primaryColor,
        );

    final BoxDecoration currentDateDecoration = widget.currentDateDecoration ??
        BoxDecoration(
          border: Border.all(color: widget.currentDateDecorationColor ?? Theme.of(context).primaryColor),
          shape: BoxShape.circle,
        );

    final TextStyle selectedCellsTextStyle = widget.selectedCellsTextStyle ??
        TextStyle(
          fontWeight: FontWeight.normal,
          color: widget.selectedCellsTextStyleColor ?? Theme.of(context).colorScheme.onPrimary,
        );

    final BoxDecoration selectedCellsDecoration = widget.selectedCellsDecoration ??
        BoxDecoration(
          color: widget.selectedCellsDecorationColor ?? Theme.of(context).colorScheme.primary,
          shape: BoxShape.rectangle,
        );

    final TextStyle singleSelectedCellTextStyle = widget.singelSelectedCellTextStyle ??
        TextStyle(
          fontWeight: FontWeight.normal,
          color: widget.singleSelectedCellTextStyleColor ?? Theme.of(context).colorScheme.onPrimary,
        );

    final BoxDecoration singleSelectedCellDecoration = widget.singelSelectedCellDecoration ??
        BoxDecoration(
          color: widget.singleSelectedCellDecorationColor ?? Theme.of(context).colorScheme.primary,
          shape: BoxShape.circle,
        );

    final leadingDateTextStyle = widget.leadingDateTextStyle ??
        TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: widget.leadingDateTextStyleColor ?? Theme.of(context).primaryColor,
        );

    final slidersColor = widget.slidersColor ?? Theme.of(context).primaryColor;
    final slidersSize = widget.slidersSize ?? 20;

    final splashColor = widget.splashColor ??
        selectedCellsDecoration.color?.withOpacity(0.3) ??
        Theme.of(context).primaryColor.withOpacity(0.3);

    final highlightColor = widget.highlightColor ?? Theme.of(context).highlightColor;
    final dividerColor = widget.dividerColor ?? Theme.of(context).dividerColor;

    return widget.isVerticalAligned == false
        ? Padding(
            padding: widget.contentPadding ?? EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Header(
                  leadingDateTextStyle: leadingDateTextStyle,
                  slidersColor: slidersColor,
                  slidersSize: slidersSize,
                  leftArrowIcon: widget.leftArrowIcon,
                  rightArrowIcon: widget.rightArrowIcon,
                  onDateTap: () => widget.onLeadingDateTap?.call(),
                  displayedDate: _leadingDateFormatter(_displayedMonth!),
                  onNextPage: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                  onPreviousPage: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                ),
                const SizedBox(height: 16),
                WeekNames(
                  daysOfTheWeekTextStyle: daysOfTheWeekTextStyle,
                ),
                Divider(
                  height: 12,
                  color: dividerColor,
                ),
                SizedBox(
                  key: ValueKey(maxHeight),
                  height: maxHeight,
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    key: _pageViewKey,
                    controller: _pageController,
                    itemCount: DateUtils.monthDelta(widget.minDate, widget.maxDate) + 1,
                    onPageChanged: (monthPage) {
                      final DateTime monthDate = DateUtils.addMonthsToMonthDate(widget.minDate, monthPage);

                      setState(() {
                        _displayedMonth = monthDate;
                      });
                    },
                    itemBuilder: (context, index) {
                      final DateTime month = DateUtils.addMonthsToMonthDate(widget.minDate, index);

                      return RangeDaysView(
                        key: ValueKey<DateTime>(month),
                        currentDate: DateUtils.dateOnly(widget.currentDate ?? DateTime.now()),
                        minDate: DateUtils.dateOnly(widget.minDate),
                        maxDate: DateUtils.dateOnly(widget.maxDate),
                        displayedMonth: month,
                        selectedEndDate:
                            widget.selectedEndDate == null ? null : DateUtils.dateOnly(widget.selectedEndDate!),
                        selectedStartDate:
                            widget.selectedStartDate == null ? null : DateUtils.dateOnly(widget.selectedStartDate!),
                        enabledCellsTextStyle: enabledCellsTextStyle,
                        enabledCellsDecoration: enabledCellsDecoration,
                        disabledCellsTextStyle: disabledCellsTextStyle,
                        disabledCellsDecoration: disbaledCellsDecoration,
                        currentDateDecoration: currentDateDecoration,
                        currentDateTextStyle: currentDateTextStyle,
                        selectedCellsDecoration: selectedCellsDecoration,
                        selectedCellsTextStyle: selectedCellsTextStyle,
                        singleSelectedCellTextStyle: singleSelectedCellTextStyle,
                        singleSelectedCellDecoration: singleSelectedCellDecoration,
                        highlightColor: highlightColor,
                        splashColor: splashColor,
                        splashRadius: widget.splashRadius,
                        onEndDateChanged: (value) => widget.onEndDateChanged?.call(value),
                        onStartDateChanged: (value) => widget.onStartDateChanged?.call(value),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: widget.contentPadding ?? EdgeInsets.zero,
                child: WeekNames(daysOfTheWeekTextStyle: daysOfTheWeekTextStyle),
              ),
              Divider(
                height: 12,
                color: dividerColor,
              ),
              Flexible(
                child: ListView.builder(
                    shrinkWrap: true,
                    padding: widget.contentPadding ?? EdgeInsets.zero,
                    itemCount: DateUtils.monthDelta(widget.minDate, widget.maxDate) + 1,
                    itemBuilder: (context, index) {
                      final DateTime month = DateUtils.addMonthsToMonthDate(widget.minDate, index);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 24),
                          LeadingDate(
                            onTap: () {
                              widget.onLeadingDateTap?.call();
                            },
                            displayedText: _leadingDateFormatter(month),
                            displayedTextStyle: leadingDateTextStyle,
                          ),
                          const SizedBox(height: 24),
                          RangeDaysView(
                            key: ValueKey<DateTime>(month),
                            currentDate: DateUtils.dateOnly(widget.currentDate ?? DateTime.now()),
                            minDate: DateUtils.dateOnly(widget.minDate),
                            maxDate: DateUtils.dateOnly(widget.maxDate),
                            displayedMonth: month,
                            selectedEndDate:
                                widget.selectedEndDate == null ? null : DateUtils.dateOnly(widget.selectedEndDate!),
                            selectedStartDate:
                                widget.selectedStartDate == null ? null : DateUtils.dateOnly(widget.selectedStartDate!),
                            enabledCellsTextStyle: enabledCellsTextStyle,
                            enabledCellsDecoration: enabledCellsDecoration,
                            disabledCellsTextStyle: disabledCellsTextStyle,
                            disabledCellsDecoration: disbaledCellsDecoration,
                            currentDateDecoration: currentDateDecoration,
                            currentDateTextStyle: currentDateTextStyle,
                            selectedCellsDecoration: selectedCellsDecoration,
                            selectedCellsTextStyle: selectedCellsTextStyle,
                            singleSelectedCellTextStyle: singleSelectedCellTextStyle,
                            singleSelectedCellDecoration: singleSelectedCellDecoration,
                            highlightColor: highlightColor,
                            splashColor: splashColor,
                            splashRadius: widget.splashRadius,
                            onEndDateChanged: (value) => widget.onEndDateChanged?.call(value),
                            onStartDateChanged: (value) => widget.onStartDateChanged?.call(value),
                          ),
                        ],
                      );
                    }),
              )
            ],
          );
  }

  String _leadingDateFormatter(DateTime month) => DateFormat("MMMM, yyyy").format(month);
}
