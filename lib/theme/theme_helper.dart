import 'package:flutter/material.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // The current app theme
  var _appTheme = "lightCode";

  // A map of custom color themes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors(),
  };

  // A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme,
  };

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light();
}

class LightCodeColors {
  // App Colors
  Color get blue_gray_100_d8 => Color(0xD8DBD5D5);
  Color get white_A700 => Color(0xFFFFFFFF);
  Color get black_900_66 => Color(0x66000000);
  Color get teal_400 => Color(0xFF3AC680);
  Color get red_A700 => Color(0xFFFF0000);
  Color get red_600 => Color(0xFFEA3030);
  Color get indigo_A700 => Color(0xFF2E3FFF);
  Color get teal_400_01 => Color(0xFF3AC780);
  Color get blue_gray_800 => Color(0xFF2A5A42);
  Color get blue_gray_100 => Color(0xFFD9D9D9);
  Color get gray_100 => Color(0xFFF7F2F2);
  Color get gray_400_d8 => Color(0xD8B5B6B9);
  Color get gray_400 => Color(0xFFC9C9C9);
  Color get green_50 => Color(0xFFD8F3DC);
  Color get gray_500_4f => Color(0x4F9C9999);
  Color get red_A700_cc => Color(0xCCFC0808);
  Color get gray_400_01 => Color(0xFFB5B6B8);
  Color get green_800 => Color(0xFF2D6A4F);
  Color get green_A200 => Color(0xFF54E59D);
  Color get blue_gray_900 => Color(0xFF252F2B);
  Color get lime_A200 => Color(0xFFDFF632);
  Color get red_700 => Color(0xFFE01E1D);
  Color get gray_800_66 => Color(0x664D4D4D);

  // Additional Colors
  Color get transparentCustom => Colors.transparent;
  Color get redAccentCustom => Colors.redAccent;
  Color get greyCustom => Colors.grey;
  Color get color000000 => Color(0x00000000);
  Color get color330000 => Color(0x33000000);
  Color get color880000 => Color(0x88000000);
  Color get colorD8FFFF => Color(0xD8FFFFFF);
  Color get colorFFFC08 => Color(0xFFFC0808);
  Color get colorE5FFFF => Color(0xE5FFFFFF);
  Color get color40FFFF => Color(0x40FFFFFF);
  Color get color30FFFF => Color(0x30FFFFFF);
  Color get color50FFFF => Color(0x50FFFFFF);
  Color get color60FFFF => Color(0x60FFFFFF);
  Color get colorB2FFFF => Color(0xB2FFFFFF);
  Color get colorB5B6B8 => Color(0xB5B6B8FF);
  Color get colorD6FFFF => Color(0xD6FFFFFF);
  Color get colorFF2D50 => Color(0xFF2D5016);
  Color get colorFFE539 => Color(0xFFE53935);
  Color get colorFF0000 => Color(0xFF000000);
  Color get colorFF9C27 => Color(0xFF9C27B0);
  Color get colorFF43A0 => Color(0xFF43A047);
  Color get colorFFFFC1 => Color(0xFFFFC107);
  Color get colorFF1565 => Color(0xFF1565C0);
  Color get color661565 => Color(0x661565C0);
  Color get color42FFFF => Color(0x42FFFFFF);
  Color get color19FFFF => Color(0x19FFFFFF);
  Color get colorFFB0D0 => Color(0xFFB0D0E8);
  Color get colorFF6BA5 => Color(0xFF6BA5C8);
  Color get colorFF2A3A => Color(0xFF2A3A2A);
  Color get color2DFFFF => Color(0x2DFFFFFF);
  Color get colorFF8888 => Color(0xFF888888);
  Color get color33FFFF => Color(0x33FFFFFF);
  Color get color59FFFF => Color(0x59FFFFFF);
  Color get colorC9D9D9 => Color(0xC9D9D9D9);
  Color get color4FD9D9 => Color(0x4FD9D9D9);
  Color get colorFFB000 => Color(0xFFB00020);
  Color get color70FFFF => Color(0x70FFFFFF);
  Color get colorD5D8DB => Color(0xD5D8DBD5);
  Color get color0CFFFF => Color(0x0CFFFFFF);
  Color get color7FD9D9 => Color(0x7FD9D9D9);

  // Color Shades - Each shade has its own dedicated constant
  Color get grey200 => Colors.grey.shade200;
  Color get grey100 => Colors.grey.shade100;
}
