import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A helper class for managing text styles in the application
class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._();
    return _instance!;
  }

  // Headline Styles
  // Medium-large text styles for section headers

  TextStyle get headline25SemiBoldInter => TextStyle(
    fontSize: 25.fSize,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: appTheme.green_A200,
  );

  // Title Styles
  // Medium text styles for titles and subtitles

  TextStyle get title21BoldInter => TextStyle(
    fontSize: 21.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: appTheme.white_A700,
  );

  TextStyle get title20BoldInter => TextStyle(
    fontSize: 20.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: appTheme.colorD8FFFF,
  );

  TextStyle get title20RegularRoboto => TextStyle(
    fontSize: 20.fSize,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
  );

  TextStyle get title18SemiBold => TextStyle(
    fontSize: 18.fSize,
    fontWeight: FontWeight.w600,
    color: appTheme.white_A700,
  );

  TextStyle get title17SemiBoldInter => TextStyle(
    fontSize: 17.fSize,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: appTheme.colorE5FFFF,
  );

  TextStyle get title17RegularInter => TextStyle(
    fontSize: 17.fSize,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    color: appTheme.white_A700,
  );

  // Body Styles
  // Standard text styles for body content

  TextStyle get body15BoldInter => TextStyle(
    fontSize: 15.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: appTheme.white_A700,
  );

  TextStyle get body15RegularInter => TextStyle(
    fontSize: 15.fSize,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    color: appTheme.white_A700,
  );

  TextStyle get body15SemiBoldInter => TextStyle(
    fontSize: 15.fSize,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: appTheme.teal_400,
  );

  TextStyle get body14RegularInter => TextStyle(
    fontSize: 14.fSize,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    color: appTheme.gray_100,
  );

  TextStyle get body14ExtraBoldInter => TextStyle(
    fontSize: 14.fSize,
    fontWeight: FontWeight.w800,
    fontFamily: 'Inter',
    color: appTheme.white_A700,
  );

  TextStyle get body14BoldInter => TextStyle(
    fontSize: 14.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
  );

  TextStyle get body13 =>
      TextStyle(fontSize: 13.fSize, color: appTheme.white_A700);

  TextStyle get body13SemiBoldInter => TextStyle(
    fontSize: 13.fSize,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: appTheme.colorD8FFFF,
  );

  TextStyle get body12BoldInter => TextStyle(
    fontSize: 12.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: appTheme.white_A700,
  );

  TextStyle get body12SemiBoldInter => TextStyle(
    fontSize: 12.fSize,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
  );

  TextStyle get body12RegularInter => TextStyle(
    fontSize: 12.fSize,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    color: appTheme.white_A700,
  );

  // Label Styles
  // Small text styles for labels, captions, and hints

  TextStyle get label11BoldInter => TextStyle(
    fontSize: 11.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: appTheme.white_A700,
  );

  TextStyle get label11SemiBoldInter => TextStyle(
    fontSize: 11.fSize,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: appTheme.colorD8FFFF,
  );

  TextStyle get label10LightInter => TextStyle(
    fontSize: 10.fSize,
    fontWeight: FontWeight.w300,
    fontFamily: 'Inter',
    color: appTheme.white_A700,
  );

  TextStyle get label10BoldInter => TextStyle(
    fontSize: 10.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: appTheme.white_A700,
  );

  TextStyle get label9MediumInter => TextStyle(
    fontSize: 9.fSize,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
    color: appTheme.red_A700_cc,
  );

  TextStyle get label8LightInter => TextStyle(
    fontSize: 8.fSize,
    fontWeight: FontWeight.w300,
    fontFamily: 'Inter',
    color: appTheme.colorE5FFFF,
  );

  TextStyle get label8BoldInter => TextStyle(
    fontSize: 8.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: appTheme.blue_gray_100_d8,
  );

  TextStyle get label8RegularInter => TextStyle(
    fontSize: 8.fSize,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    color: appTheme.colorE5FFFF,
  );

  // Other Styles
  // Miscellaneous text styles without specified font size

  TextStyle get bodyTextSemiBold =>
      TextStyle(fontWeight: FontWeight.w600, color: appTheme.white_A700);
}
