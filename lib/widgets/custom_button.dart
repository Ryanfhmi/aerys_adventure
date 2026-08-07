import 'package:flutter/material.dart';

import '../core/app_export.dart';

/// CustomButton - A flexible and reusable button component
/// that supports multiple visual variants, sizes, and states.
///
/// [text] - The label text displayed inside the button (required)
/// [onPressed] - Callback triggered when the button is tapped
/// [buttonStyle] - Visual style variant of the button (CustomButtonStyleType)
/// [buttonWidth] - Width of the button (required)
/// [textColor] - Color of the button label text
/// [backgroundColor] - Background color of the button
/// [margin] - External margin around the button
/// [leftIcon] - Optional widget displayed to the left of the text
/// [rightIcon] - Optional widget displayed to the right of the text
class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.buttonWidth,
    this.onPressed,
    this.buttonStyle,
    this.textColor,
    this.backgroundColor,
    this.margin,
    this.leftIcon,
    this.rightIcon,
  }) : super(key: key);

  final String text;
  final double buttonWidth;
  final VoidCallback? onPressed;
  final CustomButtonStyleType? buttonStyle;
  final Color? textColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? margin;
  final Widget? leftIcon;
  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        style: _resolveButtonStyle(),
        child: _buildButtonContent(),
      ),
    );
  }

  ButtonStyle _resolveButtonStyle() {
    final resolvedBgColor = backgroundColor ?? _defaultBackgroundColor();
    return ElevatedButton.styleFrom(
      backgroundColor: resolvedBgColor,
      disabledBackgroundColor: resolvedBgColor.withAlpha(153),
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 30.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.h)),
      elevation: 0,
      shadowColor: appTheme.transparentCustom,
    );
  }

  Color _defaultBackgroundColor() {
    switch (buttonStyle) {
      case CustomButtonStyleType.primary:
        return appTheme
            .gray_400_01; // Modified: Added space between 'return' and 'appTheme'
      case CustomButtonStyleType.secondary:
        return appTheme
            .gray_400_d8; // Modified: Added space between 'return' and 'appTheme'
      default:
        return appTheme
            .gray_400_01; // Modified: Added space between 'return' and 'appTheme'
    }
  }

  Color _resolveTextColor() {
    return textColor ?? appTheme.white_A700;
  }

  Widget _buildButtonContent() {
    if (leftIcon == null && rightIcon == null) {
      return Text(
        text,
        style: TextStyleHelper.instance.body14BoldInter.copyWith(
          color: _resolveTextColor(),
          height: 17 / 14,
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leftIcon != null) ...[leftIcon!, SizedBox(width: 8.h)],
        Text(
          text,
          style: TextStyleHelper.instance.body14BoldInter.copyWith(
            color: _resolveTextColor(),
            height: 17 / 14,
          ),
        ),
        if (rightIcon != null) ...[SizedBox(width: 8.h), rightIcon!],
      ],
    );
  }
}

/// Enum defining the visual style variants for [CustomButton]
enum CustomButtonStyleType {
  /// Primary style with slightly transparent background (#d8b5b6b9)
  primary,

  /// Secondary style with solid background (#b5b6b8)
  secondary,
}
