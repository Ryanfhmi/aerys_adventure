import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_image_view.dart';
import './widgets/group_member_status_item.dart';
import 'notifier/group_health_tracker_notifier.dart';

class GroupHealthTrackerScreen extends ConsumerStatefulWidget {
  GroupHealthTrackerScreen({Key? key}) : super(key: key);

  @override
  GroupHealthTrackerScreenState createState() =>
      GroupHealthTrackerScreenState();
}

class GroupHealthTrackerScreenState
    extends ConsumerState<GroupHealthTrackerScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [_buildMapSection(context), _buildHealthPanel(context)],
    );
  }

  Widget _buildMapSection(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          // Map background
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(color: appTheme.colorFF2D50),
            child: CustomImageView(
              imagePath: ImageConstant.imgMapBackground,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Map markers and labels
          ..._buildMapMarkers(),
          // Emergency call button
          Positioned(
            right: 16.h,
            bottom: 80.h,
            child: GestureDetector(
              onTap: () => _onEmergencyCallTap(context),
              child: Container(
                width: 54.h,
                height: 54.h,
                decoration: BoxDecoration(
                  color: appTheme.colorFFE539,
                  borderRadius: BorderRadius.circular(27.h),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black_900_66,
                      blurRadius: 8.h,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.phone,
                  color: appTheme.white_A700,
                  size: 26.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildMapMarkers() {
    return [
      // Puncak Gunu Buthak label
      Positioned(
        top: 30.h,
        right: 10.h,
        child: GestureDetector(
          onTap: () => _onLocationTap(context, 'Puncak Gunu Buthak'),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.h),
            decoration: BoxDecoration(
              color: appTheme.white_A700,
              borderRadius: BorderRadius.circular(6.h),
            ),
            child: Text(
              'Puncak Gunu\nButhak',
              textAlign: TextAlign.center,
              style: TextStyleHelper.instance.label11BoldInter.copyWith(
                color: appTheme.colorFF0000,
                height: 1.3,
              ),
            ),
          ),
        ),
      ),
      // D marker (purple)
      Positioned(
        top: 20.h,
        right: 90.h,
        child: GestureDetector(
          onTap: () => _onMarkerTap(context, 'D'),
          child: _buildPinMarker(
            'D',
            appTheme.colorFF9C27,
            ImageConstant.imgAvatars3dAvatar11,
          ),
        ),
      ),
      // Pos 2 label (top right)
      Positioned(
        top: 100.h,
        right: 10.h,
        child: GestureDetector(
          onTap: () => _onLocationTap(context, 'Pos 2'),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.h),
            decoration: BoxDecoration(
              color: appTheme.white_A700,
              borderRadius: BorderRadius.circular(6.h),
            ),
            child: Text(
              'Pos 2',
              style: TextStyleHelper.instance.label11BoldInter.copyWith(
                color: appTheme.colorFF0000,
              ),
            ),
          ),
        ),
      ),
      // Rudi marker (red)
      Positioned(
        top: 80.h,
        left: 16.h,
        child: GestureDetector(
          onTap: () => _onMarkerTap(context, 'Rudi'),
          child: Row(
            children: [
              Text(
                'Rudi',
                style: TextStyleHelper.instance.body12BoldInter.copyWith(
                  shadows: [
                    Shadow(color: appTheme.colorFF0000, blurRadius: 4.h),
                  ],
                ),
              ),
              SizedBox(width: 4.h),
              _buildPinMarker(
                'R',
                appTheme.colorFFE539,
                ImageConstant.imgAvatars3dAvatar11,
              ),
            ],
          ),
        ),
      ),
      // Andi marker (green)
      Positioned(
        top: 160.h,
        left: 40.h,
        child: GestureDetector(
          onTap: () => _onMarkerTap(context, 'Andi'),
          child: Row(
            children: [
              Text(
                'Andi',
                style: TextStyleHelper.instance.body12BoldInter.copyWith(
                  shadows: [
                    Shadow(color: appTheme.colorFF0000, blurRadius: 4.h),
                  ],
                ),
              ),
              SizedBox(width: 4.h),
              _buildPinMarker(
                'A',
                appTheme.colorFF43A0,
                ImageConstant.imgAvatars3dAvatar11,
              ),
            ],
          ),
        ),
      ),
      // Maya marker (yellow)
      Positioned(
        top: 180.h,
        right: 20.h,
        child: GestureDetector(
          onTap: () => _onMarkerTap(context, 'Maya'),
          child: Row(
            children: [
              _buildPinMarker(
                'M',
                appTheme.colorFFFFC1,
                ImageConstant.imgAvatars3dAvatar11,
              ),
              SizedBox(width: 4.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pos 2',
                    style: TextStyleHelper.instance.label11BoldInter.copyWith(
                      shadows: [
                        Shadow(color: appTheme.colorFF0000, blurRadius: 4.h),
                      ],
                    ),
                  ),
                  Text(
                    'Maya',
                    style: TextStyleHelper.instance.label11BoldInter.copyWith(
                      shadows: [
                        Shadow(color: appTheme.colorFF0000, blurRadius: 4.h),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // sisi Anda marker (blue)
      Positioned(
        bottom: 120.h,
        left: 30.h,
        child: GestureDetector(
          onTap: () => _onMarkerTap(context, 'sisi Anda'),
          child: Column(
            children: [
              _buildCurrentUserMarker(),
              Text(
                'sisi Anda',
                style: TextStyleHelper.instance.label11BoldInter.copyWith(
                  shadows: [
                    Shadow(color: appTheme.colorFF0000, blurRadius: 4.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  Widget _buildPinMarker(String label, Color color, String imagePath) {
    return SizedBox(
      width: 44.h,
      height: 54.h,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomPaint(size: Size(44.h, 54.h), painter: _PinPainter(color)),
          Positioned(
            top: 4.h,
            child: Container(
              width: 36.h,
              height: 36.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
                border: Border.all(color: appTheme.white_A700, width: 2.h),
              ),
              child: ClipOval(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomImageView(
                      imagePath: imagePath,
                      width: 36.h,
                      height: 36.h,
                      fit: BoxFit.cover,
                    ),
                    Container(color: color.withAlpha(128)),
                    Text(
                      label,
                      style: TextStyleHelper.instance.body14ExtraBoldInter,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentUserMarker() {
    return Container(
      width: 50.h,
      height: 50.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: appTheme.colorFF1565,
        border: Border.all(color: appTheme.white_A700, width: 3.h),
        boxShadow: [
          BoxShadow(
            color: appTheme.color661565,
            blurRadius: 10.h,
            spreadRadius: 4.h,
          ),
        ],
      ),
      child: ClipOval(
        child: CustomImageView(
          imagePath: ImageConstant.imgAvatars3dAvatar11,
          width: 50.h,
          height: 50.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildHealthPanel(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: appTheme.gray_800_66,
        borderRadius: BorderRadius.circular(24.h),
        border: Border.all(color: appTheme.color42FFFF, width: 1.h),
      ),
      padding: EdgeInsets.only(top: 10.h, right: 4.h, bottom: 10.h, left: 4.h),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drag handle
            Center(
              child: Container(
                width: 80.h,
                height: 8.h,
                decoration: BoxDecoration(
                  color: appTheme.blue_gray_100,
                  borderRadius: BorderRadius.circular(4.h),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            // My Health title
            Padding(
              padding: EdgeInsets.only(left: 12.h),
              child: Text(
                'My Health',
                style: TextStyleHelper.instance.title17SemiBoldInter.copyWith(
                  height: 1.24,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            // Health metrics row
            _buildHealthMetricsRow(context),
            SizedBox(height: 14.h),
            // Group Status title
            Padding(
              padding: EdgeInsets.only(left: 6.h),
              child: Text(
                'Group Status',
                style: TextStyleHelper.instance.title17SemiBoldInter.copyWith(
                  height: 1.24,
                ),
              ),
            ),
            SizedBox(height: 2.h),
            // Group status list
            _buildGroupStatusList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHealthMetricsRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildHealthMetricCard('Avg.\nSpO2', '89', appTheme.color19FFFF),
          _buildHealthMetricCard('Avg.\nBPM', '89', appTheme.blue_gray_900),
          _buildHealthMetricCard('Avg.\nHRV', '89', appTheme.blue_gray_900),
        ],
      ),
    );
  }

  Widget _buildHealthMetricCard(
    String label,
    String value,
    Color backgroundColor,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 6.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(42.h),
        border: Border.all(color: appTheme.green_A200, width: 3.h),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyleHelper.instance.body15BoldInter.copyWith(
              height: 1.2,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyleHelper.instance.headline25SemiBoldInter.copyWith(
              height: 1.24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGroupStatusList(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(groupHealthTrackerNotifier);
        final members = state.groupHealthTrackerModel?.members ?? [];
        return Column(
          spacing: 6.h,
          children: members.map((member) {
            return GroupMemberStatusItem(
              model: member,
              onTap: () => _onMemberTap(context, member.name ?? ''),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(groupHealthTrackerNotifier);
        return CustomBottomBar(
          selectedIndex: state.selectedBottomBarIndex ?? 4,
          onChanged: (index) {
            ref
                .read(groupHealthTrackerNotifier.notifier)
                .onBottomBarChanged(index);
            _handleBottomNavigation(context, index);
          },
          onFabTap: () => _onFabTap(context),
          fabImagePath: ImageConstant.imgPlay,
          bottomBarItemList: [
            CustomBottomBarNavItem(
              icon: ImageConstant.imgHome1,
              activeIcon: ImageConstant.imgHome1,
              title: 'Home',
              routeName: AppRoutes.healthActivityDashboardScreen,
            ),
            CustomBottomBarNavItem(
              icon: ImageConstant.imgNavPrep,
              activeIcon: ImageConstant.imgNavPrep,
              title: 'Prep',
              routeName: '/prep',
            ),
            CustomBottomBarNavItem(
              icon: ImageConstant.imgAncientscroll11,
              activeIcon: ImageConstant.imgAncientscroll11,
              title: 'History',
              routeName: '/history',
            ),
            CustomBottomBarNavItem(
              icon: ImageConstant.imgPeople1,
              activeIcon: ImageConstant.imgPeople1,
              title: 'Group',
              routeName: AppRoutes.groupHealthTrackerScreen,
            ),
          ],
        );
      },
    );
  }

  void _onEmergencyCallTap(BuildContext context) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '112');
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not initiate emergency call'),
          backgroundColor: appTheme.colorFFE539,
        ),
      );
    }
  }

  void _onMarkerTap(BuildContext context, String memberName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Viewing location for $memberName'),
        duration: Duration(seconds: 2),
        backgroundColor: appTheme.blue_gray_800,
      ),
    );
  }

  void _onLocationTap(BuildContext context, String locationName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Location: $locationName'),
        duration: Duration(seconds: 2),
        backgroundColor: appTheme.blue_gray_800,
      ),
    );
  }

  void _onMemberTap(BuildContext context, String memberName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Viewing health details for $memberName'),
        duration: Duration(seconds: 2),
        backgroundColor: appTheme.blue_gray_800,
      ),
    );
  }

  void _onFabTap(BuildContext context) {
    ref.read(groupHealthTrackerNotifier.notifier).onFabTap();
  }

  void _handleBottomNavigation(BuildContext context, int index) {
    switch (index) {
      case 0:
        NavigatorService.pushNamed(AppRoutes.healthActivityDashboardScreen);
        break;
      case 3:
        break;
      default:
        break;
    }
  }
}

class _PinPainter extends CustomPainter {
  final Color color;
  _PinPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    final centerX = size.width / 2;
    final radius = size.width / 2;
    final circleBottom = size.height * 0.68;

    path.addOval(
      Rect.fromCircle(center: Offset(centerX, radius), radius: radius),
    );
    path.moveTo(centerX - radius * 0.3, circleBottom - 4);
    path.lineTo(centerX, size.height);
    path.lineTo(centerX + radius * 0.3, circleBottom - 4);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_PinPainter oldDelegate) => oldDelegate.color != color;
}
