import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/// A custom AppBar component that displays a greeting section with
/// a day label, full date text, and a user avatar on the right side.
///
/// Implements [PreferredSizeWidget] to be used directly in [Scaffold.appBar].
///
/// [dayLabel] - Small label text shown above the date (e.g., "Today")
/// [dateText] - Full date string displayed below the day label
/// [avatarImagePath] - Path to the avatar image shown on the right
/// [onAvatarTap] - Optional callback triggered when the avatar is tapped
/// [backgroundColor] - Optional background color for the AppBar
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.dayLabel,
    this.dateText,
    this.avatarImagePath,
    this.onAvatarTap,
    this.backgroundColor,
  }) : super(key: key);

  /// Small label text shown above the date (e.g., "Today")
  final String? dayLabel;

  /// Full date string displayed below the day label
  final String? dateText;

  /// Path to the avatar image shown on the right
  final String? avatarImagePath;

  /// Optional callback triggered when the avatar is tapped
  final VoidCallback? onAvatarTap;

  /// Optional background color for the AppBar
  final Color? backgroundColor;

  @override
  Size get preferredSize => Size.fromHeight(56.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor ?? appTheme.transparentCustom,
      elevation: 0,
      titleSpacing: 0,

      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 2.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitleSection(),
            const Spacer(),
            _buildAvatarSection(),
          ],
        ),
      ),
    );
  }

  /// Builds the left section containing the day label and date text
  Widget _buildTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          dayLabel ?? "Today",
          style: TextStyleHelper.instance.label8BoldInter.copyWith(
            color: appTheme.colorD5D8DB,
            height: 10 / 8,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 1.h),
        Text(
          dateText ?? "Sunday, 23 Sep 2045",
          style: TextStyleHelper.instance.label10BoldInter.copyWith(
            height: 13 / 10,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  /// Builds the right section containing the tappable avatar image
  Widget _buildAvatarSection() {
    return GestureDetector(
      onTap: onAvatarTap,
      child: Padding(
        padding: EdgeInsets.only(right: 8.h),
        child: CustomImageView(
          imagePath: avatarImagePath ?? ImageConstant.imgAvatars3dAvatar11,
          height: 50.h,
          width: 50.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
