import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BrandIcon {
  static SvgPicture calenderIcon(ColorFilter color, double magnification) {
    return SvgPicture.asset(
      'assets/icons/calendar_month.svg',
      semanticsLabel: 'calender',
      width: 24 * magnification,
      height: 24 * magnification,
      colorFilter: color,
    );
  }

  static SvgPicture editIcon(ColorFilter color, double magnification) {
    return SvgPicture.asset(
      'assets/icons/edit_calendar.svg',
      semanticsLabel: 'edit',
      width: 24 * magnification,
      height: 24 * magnification,
      colorFilter: color,
    );
  }

  static SvgPicture flagIcon(ColorFilter color, double magnification) {
    return SvgPicture.asset(
      'assets/icons/flag.svg',
      semanticsLabel: 'flag',
      width: 24 * magnification,
      height: 24 * magnification,
      colorFilter: color,
    );
  }

  static SvgPicture moreIcon = SvgPicture.asset(
    'assets/icons/more_horiz.svg',
    semanticsLabel: 'more',
    width: 24,
    height: 24,
  );

  static SvgPicture deleteIcon = SvgPicture.asset(
    'assets/icons/delete.svg',
    semanticsLabel: 'delete',
    width: 24,
    height: 24,
  );
}
