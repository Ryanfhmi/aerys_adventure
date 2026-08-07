import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/// A customizable Floating Action Button widget that supports
/// custom icons, colors, and sizes with responsive design.
///
/// [onPressed] - Callback triggered when the FAB is tapped
/// [imagePath] - Path to the icon image (SVG, PNG, etc.)
/// [backgroundColor] - Background color of the FAB
/// [buttonSize] - Size (width and height) of the FAB
/// [borderRadius] - Border radius of the FAB
class CustomFab extends StatelessWidget {
  const CustomFab({
    Key? key,
    required this.onPressed,
    this.imagePath,
    this.backgroundColor,
    this.buttonSize,
    this.borderRadius,
  }) : super(key: key);

  /// Callback triggered when the FAB is tapped
  final VoidCallback onPressed;

  /// Path to the icon image (SVG, PNG, etc.)
  final String? imagePath;

  /// Background color of the FAB
  final Color? backgroundColor;

  /// Size (width and height) of the FAB
  final double? buttonSize;

  /// Border radius of the FAB
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    final double resolvedSize = buttonSize ?? 60.h;
    final double resolvedBorderRadius = borderRadius ?? 30.h;
    final Color resolvedBackgroundColor =
        backgroundColor ?? appTheme.blue_gray_800;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: resolvedSize,
        height: resolvedSize,
        decoration: BoxDecoration(
          color: resolvedBackgroundColor,
          borderRadius: BorderRadius.circular(resolvedBorderRadius),
        ),
        alignment: Alignment.center,
        child: imagePath != null
            ? CustomImageView(
                imagePath: imagePath!,
                height: resolvedSize * 0.5,
                width: resolvedSize * 0.5,
                fit: BoxFit.contain,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
