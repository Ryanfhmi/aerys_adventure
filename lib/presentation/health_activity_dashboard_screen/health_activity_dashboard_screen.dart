import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_image_view.dart';
import '../group_health_tracker_screen/group_health_tracker_screen.dart';
import '../map_screen/map_screen.dart';
import './notifier/health_activity_dashboard_notifier.dart';

class HealthActivityDashboardScreen extends ConsumerStatefulWidget {
  HealthActivityDashboardScreen({Key? key}) : super(key: key);

  @override
  HealthActivityDashboardScreenState createState() =>
      HealthActivityDashboardScreenState();
}

class HealthActivityDashboardScreenState
    extends ConsumerState<HealthActivityDashboardScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Full-screen background image
            _buildFullScreenBackground(),
            // Dark gradient overlay
            _buildGradientOverlay(),
            // Main content
            Column(
              children: [
                _buildAppBar(context),
                Expanded(
                  child: SingleChildScrollView(
                    child: Consumer(
                      builder: (context, ref, _) {
                        final state = ref.watch(
                          healthActivityDashboardNotifier,
                        );
                        return Padding(
                          padding: EdgeInsets.only(
                            left: 6.h,
                            right: 6.h,
                            bottom: 8.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 8.h),
                              _buildGreetingSection(),
                              SizedBox(height: 16.h),
                              _buildLocationCard(context),
                              SizedBox(height: 6.h),
                              _buildWeatherCard(context),
                              SizedBox(height: 20.h),
                              _buildQuickActionsRow(context),
                              SizedBox(height: 20.h),
                              _buildHealthMetrics(context, state),
                              SizedBox(height: 80.h),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  Widget _buildFullScreenBackground() {
    return Image.network(
      'https://images.unsplash.com/photo-1551632811-561732d1e306?w=1200&q=90&fit=crop',
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      semanticLabel:
          'Hiker standing on mountain summit with panoramic view of valleys and peaks',
      errorBuilder: (context, error, stackTrace) => CustomImageView(
        imagePath: ImageConstant.imgImage7,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildGradientOverlay() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withAlpha(100),
            Colors.black.withAlpha(60),
            Colors.black.withAlpha(160),
          ],
          stops: [0.0, 0.4, 1.0],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          top: 8.h,
          left: 16.h,
          right: 16.h,
          bottom: 4.h,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 11.fSize,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                      color: Colors.white.withAlpha(180),
                    ),
                  ),
                  Text(
                    'Sunday, 23 Sep 2045',
                    style: TextStyle(
                      fontSize: 13.fSize,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Inter',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withAlpha(100),
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgAvatars3dAvatar11,
                    height: 44.h,
                    width: 44.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGreetingSection() {
    return Padding(
      padding: EdgeInsets.only(left: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello, Juned 👋',
            style: TextStyle(
              fontSize: 20.fSize,
              fontWeight: FontWeight.w800,
              fontFamily: 'Inter',
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Colors.black.withAlpha(150),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Ready for your next adventure?',
            style: TextStyle(
              fontSize: 13.fSize,
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter',
              color: Colors.white.withAlpha(200),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationCard(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(left: 6.h, right: 6.h),
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.black.withAlpha(100),
          borderRadius: BorderRadius.circular(16.h),
          border: Border.all(color: Colors.white.withAlpha(40), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(60),
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(6.h),
              decoration: BoxDecoration(
                color: Color(0xFF52B788).withAlpha(60),
                borderRadius: BorderRadius.circular(8.h),
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgLocation21,
                height: 20.h,
                width: 20.h,
              ),
            ),
            SizedBox(width: 10.h),
            Text(
              'Mt. Buthak',
              style: TextStyle(
                fontSize: 15.fSize,
                fontWeight: FontWeight.w700,
                fontFamily: 'Inter',
                color: Colors.white,
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(6.h),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(20),
                borderRadius: BorderRadius.circular(8.h),
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgMountain1,
                height: 20.h,
                width: 20.h,
              ),
            ),
            SizedBox(width: 6.h),
            Text(
              '3726 Mdpl',
              style: TextStyle(
                fontSize: 13.fSize,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
                color: Colors.white.withAlpha(220),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 6.h, right: 6.h),
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(100),
        borderRadius: BorderRadius.circular(14.h),
        border: Border.all(color: Colors.white.withAlpha(30), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildWeatherItem(ImageConstant.imgCloudy1, '23°C', 'Temp'),
          _buildWeatherDivider(),
          _buildWeatherItem(ImageConstant.imgWind1, '10 km/h', 'Wind'),
          _buildWeatherDivider(),
          _buildWeatherItem(ImageConstant.imgOpenPadlock1, 'Open', 'Trail'),
        ],
      ),
    );
  }

  Widget _buildWeatherItem(String imagePath, String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomImageView(imagePath: imagePath, height: 18.h, width: 18.h),
        SizedBox(height: 4.h),
        Text(
          value,
          style: TextStyle(
            fontSize: 12.fSize,
            fontWeight: FontWeight.w700,
            fontFamily: 'Inter',
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 10.fSize,
            fontWeight: FontWeight.w400,
            fontFamily: 'Inter',
            color: Colors.white.withAlpha(160),
          ),
        ),
      ],
    );
  }

  Widget _buildWeatherDivider() {
    return Container(width: 1, height: 36.h, color: Colors.white.withAlpha(30));
  }

  Widget _buildQuickActionsRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      child: Row(
        children: [
          Expanded(
            child: _buildQuickAction(
              icon: Icons.play_circle_filled,
              label: 'Start Hike',
              color: Color(0xFF52B788),
              onTap: () => _navigateToMap(context),
            ),
          ),
          SizedBox(width: 10.h),
          Expanded(
            child: _buildQuickAction(
              icon: Icons.backpack_outlined,
              label: 'Prep Gear',
              color: Color(0xFF4FC3F7),
              onTap: () {},
            ),
          ),
          SizedBox(width: 10.h),
          Expanded(
            child: _buildQuickAction(
              icon: Icons.group_outlined,
              label: 'My Group',
              color: Color(0xFFFFB74D),
              onTap: () => _showGroupScreen(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAction({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          color: color.withAlpha(30),
          borderRadius: BorderRadius.circular(14.h),
          border: Border.all(color: color.withAlpha(80), width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 24.h),
            SizedBox(height: 6.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 11.fSize,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHealthMetrics(
    BuildContext context,
    HealthActivityDashboardState state,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.h, bottom: 12.h),
          child: Text(
            'Health Overview',
            style: TextStyle(
              fontSize: 16.fSize,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              color: Colors.white,
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(100),
                    borderRadius: BorderRadius.circular(20.h),
                    border: Border.all(
                      color: Colors.white.withAlpha(40),
                      width: 1,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 38.h),
                      CustomImageView(
                        imagePath: ImageConstant.imgVector2,
                        height: 164.h,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(height: 56.h),
                      Padding(
                        padding: EdgeInsets.only(left: 14.h),
                        child: Text(
                          'SpO2',
                          style: TextStyle(
                            fontSize: 14.fSize,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Inter',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24.h),
                        child: Text(
                          '89',
                          style: TextStyle(
                            fontSize: 14.fSize,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter',
                            color: Color(0xFF52B788),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.h),
            Expanded(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(100),
                        borderRadius: BorderRadius.circular(20.h),
                        border: Border.all(
                          color: Colors.white.withAlpha(40),
                          width: 1,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16.h),
                          CustomImageView(
                            imagePath: ImageConstant.imgVector2RedA700,
                            height: 88.h,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.h),
                            child: Text(
                              'BPM',
                              style: TextStyle(
                                fontSize: 14.fSize,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Inter',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.h),
                            child: Text(
                              '89',
                              style: TextStyle(
                                fontSize: 14.fSize,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Inter',
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(100),
                        borderRadius: BorderRadius.circular(20.h),
                        border: Border.all(
                          color: Colors.white.withAlpha(40),
                          width: 1,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 26.h),
                          CustomImageView(
                            imagePath: ImageConstant.imgVector3,
                            height: 74.h,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.h),
                            child: Text(
                              'HRV',
                              style: TextStyle(
                                fontSize: 14.fSize,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Inter',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.h),
                            child: Text(
                              '89',
                              style: TextStyle(
                                fontSize: 14.fSize,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Inter',
                                color: Color(0xFF4FC3F7),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(100),
              borderRadius: BorderRadius.circular(16.h),
              border: Border.all(color: Colors.white.withAlpha(40), width: 1),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.h),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFB74D).withAlpha(40),
                    borderRadius: BorderRadius.circular(10.h),
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgManWalking1,
                    height: 24.h,
                    width: 24.h,
                  ),
                ),
                SizedBox(width: 12.h),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Activity',
                        style: TextStyle(
                          fontSize: 14.fSize,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Inter',
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Moderate',
                        style: TextStyle(
                          fontSize: 12.fSize,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                          color: Color(0xFF52B788),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.white.withAlpha(120),
                  size: 20.h,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    final tabs = [
      _NavTab(icon: Icons.home_rounded, label: 'Home'),
      _NavTab(icon: Icons.backpack_outlined, label: 'Prep'),
      _NavTab(icon: Icons.play_circle_filled, label: 'Start', isCenter: true),
      _NavTab(icon: Icons.history_rounded, label: 'History'),
      _NavTab(icon: Icons.group_outlined, label: 'Group'),
    ];

    return Container(
      height: 68.h,
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(220),
        border: Border(
          top: BorderSide(color: Color(0xFF52B788).withAlpha(80), width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(100),
            blurRadius: 12,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(tabs.length, (index) {
          final isSelected = _selectedTabIndex == index;
          final tab = tabs[index];
          return GestureDetector(
            onTap: () {
              setState(() => _selectedTabIndex = index);
              _handleTabTap(context, index);
            },
            child: tab.isCenter
                ? Container(
                    width: 52.h,
                    height: 52.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF52B788), Color(0xFF2D6A4F)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF52B788).withAlpha(100),
                          blurRadius: 12,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(tab.icon, color: Colors.white, size: 20.h),
                        Text(
                          tab.label,
                          style: TextStyle(
                            fontSize: 8.fSize,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Inter',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.h,
                      vertical: 4.h,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          tab.icon,
                          color: isSelected
                              ? Color(0xFF52B788)
                              : Colors.white.withAlpha(120),
                          size: 22.h,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          tab.label,
                          style: TextStyle(
                            fontSize: 10.fSize,
                            fontWeight: isSelected
                                ? FontWeight.w700
                                : FontWeight.w400,
                            fontFamily: 'Inter',
                            color: isSelected
                                ? Color(0xFF52B788)
                                : Colors.white.withAlpha(120),
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        }),
      ),
    );
  }

  void _handleTabTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        break;
      case 2:
        _navigateToMap(context);
        break;
      case 4:
        _showGroupScreen(context);
        break;
      default:
        break;
    }
  }

  void _navigateToMap(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => MapScreen()));
  }

  void _showGroupScreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return GroupHealthTrackerScreen();
      },
    );
  }
}

class _NavTab {
  final IconData icon;
  final String label;
  final bool isCenter;
  _NavTab({required this.icon, required this.label, this.isCenter = false});
}
