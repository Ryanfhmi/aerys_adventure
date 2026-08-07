import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/// Enum for CustomIconButton style variants
enum CustomIconButtonVariant { filled, outlined }

/// A flexible and reusable icon button component supporting
/// filled and outlined style variants with customizable
/// background color, border, padding, and icon image.
///
/// [imagePath] - Path to the icon image (PNG or SVG)
/// [onTap] - Callback triggered when the button is tapped
/// [width] - Width of the button
/// [height] - Height of the button
/// [backgroundColor] - Background fill color of the button
/// [borderColor] - Border color (used in outlined variant)
/// [borderRadius] - Corner radius of the button
/// [padding] - Inner padding around the icon
/// [margin] - Outer margin around the button
/// [variant] - Style variant: filled or outlined
/// [imageWidth] - Width of the icon image
/// [imageHeight] - Height of the icon image
class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.imagePath,
    this.onTap,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.margin,
    this.variant,
    this.imageWidth,
    this.imageHeight,
  }) : super(key: key);

  final String imagePath;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final CustomIconButtonVariant? variant;
  final double? imageWidth;
  final double? imageHeight;

  @override
  Widget build(BuildContext context) {
    final double resolvedWidth = width ?? 60.h;
    final double resolvedHeight = height ?? 60.h;
    final double resolvedBorderRadius = borderRadius ?? 30.h;
    final EdgeInsetsGeometry resolvedPadding = padding ?? EdgeInsets.all(12.h);
    final CustomIconButtonVariant resolvedVariant =
        variant ?? CustomIconButtonVariant.filled;

    Color resolvedBackgroundColor;
    Border? resolvedBorder;

    if (resolvedVariant == CustomIconButtonVariant.outlined) {
      resolvedBackgroundColor = backgroundColor ?? appTheme.colorC9D9D9;
      resolvedBorder = Border.all(
        color: borderColor ?? appTheme.color4FD9D9,
        width: 1,
      );
    } else {
      resolvedBackgroundColor = backgroundColor ?? appTheme.blue_gray_800;
      resolvedBorder = null;
    }

    return Container(
      margin: margin,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(resolvedBorderRadius),
        child: Container(
          width: resolvedWidth,
          height: resolvedHeight,
          padding: resolvedPadding,
          decoration: BoxDecoration(
            color: resolvedBackgroundColor,
            borderRadius: BorderRadius.circular(resolvedBorderRadius),
            border: resolvedBorder,
          ),
          child: CustomImageView(
            imagePath: imagePath,
            width:
                imageWidth ??
                (resolvedWidth -
                    (resolvedPadding is EdgeInsets
                        ? (resolvedPadding).horizontal
                        : 24.h)),
            height:
                imageHeight ??
                (resolvedHeight -
                    (resolvedPadding is EdgeInsets
                        ? (resolvedPadding).vertical
                        : 24.h)),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
