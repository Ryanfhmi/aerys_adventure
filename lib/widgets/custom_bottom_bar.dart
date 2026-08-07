import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/// CustomBottomBar - A bottom navigation bar with a centered FAB button.
///
/// This component renders a bottom app bar with up to 4 navigation items
/// and an optional centered Floating Action Button (FAB).
///
/// Arguments:
/// - [bottomBarItemList]: List of [CustomBottomBarNavItem] items to display.
/// - [selectedIndex]: The currently selected navigation index.
/// - [onChanged]: Callback triggered when a nav item is tapped with its index.
/// - [onFabTap]: Optional callback triggered when the FAB is tapped.
/// - [fabImagePath]: Path to the FAB icon image.
class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    Key? key,
    required this.bottomBarItemList,
    required this.onChanged,
    this.selectedIndex = 0,
    this.onFabTap,
    this.fabImagePath,
  }) : super(key: key);

  final List<CustomBottomBarNavItem> bottomBarItemList;
  final int selectedIndex;
  final Function(int) onChanged;
  final VoidCallback? onFabTap;
  final String? fabImagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 74.h,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBarContent(context),
          ),
          Positioned(top: 0, child: _buildFab()),
        ],
      ),
    );
  }

  Widget _buildBarContent(BuildContext context) {
    return Container(
      height: 54.h,
      margin: EdgeInsets.only(top: 20.h),
      decoration: BoxDecoration(
        color: appTheme.black_900_66,
        border: Border(
          top: BorderSide(color: appTheme.color33FFFF, width: 1.h),
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.color0CFFFF,
            offset: Offset(1.h, 1.h),
            blurRadius: 4.h,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 4.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(bottomBarItemList.length, (index) {
            // Leave space for FAB in the center
            if (index == bottomBarItemList.length ~/ 2) {
              return SizedBox(width: 60.h);
            }
            final item = bottomBarItemList[index];
            final isSelected = selectedIndex == index;
            return InkWell(
              onTap: () => onChanged(index),
              child: _buildNavItem(item, isSelected),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildNavItem(CustomBottomBarNavItem item, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: isSelected ? (item.activeIcon ?? item.icon) : item.icon,
          height: 24.h,
          width: 24.h,
        ),
        SizedBox(height: 2.h),
        Text(
          item.title ?? '',
          style: TextStyleHelper.instance.label11SemiBoldInter.copyWith(
            height: 14 / 11,
          ),
        ),
      ],
    );
  }

  Widget _buildFab() {
    return GestureDetector(
      onTap: onFabTap,
      child: Container(
        width: 60.h,
        height: 60.h,
        decoration: BoxDecoration(
          color: appTheme.blue_gray_800,
          borderRadius: BorderRadius.circular(30.h),
        ),
        child: Center(
          child: CustomImageView(
            imagePath: fabImagePath ?? ImageConstant.imgPlay,
            height: 28.h,
            width: 28.h,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

/// Data model for each navigation item in [CustomBottomBar].
///
/// Arguments:
/// - [icon]: Path to the default (inactive) icon.
/// - [activeIcon]: Path to the active icon (optional, falls back to [icon]).
/// - [title]: Label text shown below the icon.
/// - [routeName]: Route name for navigation.
class CustomBottomBarNavItem {
  CustomBottomBarNavItem({
    this.icon,
    this.activeIcon,
    this.title,
    this.routeName,
  });

  final String? icon;
  final String? activeIcon;
  final String? title;
  final String? routeName;
}
