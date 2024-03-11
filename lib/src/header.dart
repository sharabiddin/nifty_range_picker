import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'leading_date.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.displayedDate,
    required this.onDateTap,
    required this.onNextPage,
    required this.onPreviousPage,
    required this.slidersColor,
    required this.slidersSize,
    required this.leadingDateTextStyle,
    this.leftArrowIcon,
    this.rightArrowIcon,
  });

  final String displayedDate;

  final TextStyle leadingDateTextStyle;

  final VoidCallback onDateTap;

  final VoidCallback onNextPage;

  final VoidCallback onPreviousPage;

  final Color slidersColor;

  final double slidersSize;

  final Widget? leftArrowIcon;
  final Widget? rightArrowIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AnimatedSize(
          duration: Durations.short1,
          child: LeadingDate(
            onTap: onDateTap,
            displayedText: displayedDate,
            displayedTextStyle: leadingDateTextStyle,
          ),
        ),
        Row(
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: onPreviousPage,
                child: leftArrowIcon ??
                    Icon(
                      CupertinoIcons.chevron_left,
                      size: slidersSize,
                      color: slidersColor,
                    ),
              ),
            ),
            const SizedBox(width: 16),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: onNextPage,
                child: rightArrowIcon ??
                    Icon(
                      CupertinoIcons.chevron_right,
                      size: slidersSize,
                      color: slidersColor,
                    ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
