import 'package:flutter/material.dart';

import '../../core/app_export.dart';

class MapScreen extends ConsumerStatefulWidget {
  MapScreen({Key? key}) : super(key: key);

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends ConsumerState<MapScreen>
    with TickerProviderStateMixin {
  bool _isGeneratingRoute = true;
  bool _mapReady = false;
  int _selectedTabIndex = 2; // Start tab is index 2

  late AnimationController _pulseController;
  late AnimationController _dotController;
  late Animation<double> _pulseAnimation;
  late Animation<double> _dotAnimation;

  int _dotCount = 0;

  @override
  void initState() {
    super.initState();

    _pulseController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _dotController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                _dotCount = (_dotCount + 1) % 4;
              });
              _dotController.reset();
              _dotController.forward();
            }
          });

    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _dotAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _dotController, curve: Curves.easeInOut));

    _dotController.forward();

    // Simulate route generation then show map
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isGeneratingRoute = false;
          _mapReady = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _dotController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: Stack(
          children: [
            _isGeneratingRoute ? _buildGeneratingRoutesView() : _buildMapView(),
            if (_mapReady) _buildBottomHealthSection(),
          ],
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  Widget _buildGeneratingRoutesView() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1A2F1A), Color(0xFF0D1F0D), Color(0xFF1A2A3A)],
        ),
      ),
      child: Stack(
        children: [
          // Animated grid lines
          CustomPaint(
            size: Size(double.infinity, double.infinity),
            painter: _GridPainter(),
          ),
          // Center content
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Pulsing location icon
                AnimatedBuilder(
                  animation: _pulseAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _pulseAnimation.value,
                      child: Container(
                        width: 80.h,
                        height: 80.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF2D6A4F).withAlpha(180),
                          border: Border.all(
                            color: Color(0xFF52B788),
                            width: 2.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF52B788).withAlpha(100),
                              blurRadius: 20,
                              spreadRadius: 8,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.route_rounded,
                          color: Colors.white,
                          size: 36.h,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 28.h),
                Text(
                  'Generating Routes',
                  style: TextStyle(
                    fontSize: 20.fSize,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter',
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Finding the best trail for you${'.' * (_dotCount + 1)}',
                  style: TextStyle(
                    fontSize: 13.fSize,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter',
                    color: Colors.white.withAlpha(160),
                  ),
                ),
                SizedBox(height: 32.h),
                // Progress indicators
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return AnimatedBuilder(
                      animation: _pulseController,
                      builder: (context, child) {
                        final delay = index * 0.3;
                        final value = (_pulseController.value - delay).clamp(
                          0.0,
                          1.0,
                        );
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.h),
                          width: 8.h,
                          height: 8.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(
                              0xFF52B788,
                            ).withAlpha((value * 255).toInt()),
                          ),
                        );
                      },
                    );
                  }),
                ),
                SizedBox(height: 40.h),
                // Status items
                _buildStatusItem(
                  Icons.satellite_alt_outlined,
                  'Acquiring GPS Signal',
                  true,
                ),
                SizedBox(height: 12.h),
                _buildStatusItem(
                  Icons.map_outlined,
                  'Loading Trail Data',
                  true,
                ),
                SizedBox(height: 12.h),
                _buildStatusItem(
                  Icons.route_outlined,
                  'Calculating Route',
                  false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusItem(IconData icon, String label, bool done) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          done ? Icons.check_circle_outline : Icons.radio_button_unchecked,
          color: done ? Color(0xFF52B788) : Colors.white.withAlpha(100),
          size: 16.h,
        ),
        SizedBox(width: 8.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.fSize,
            fontWeight: FontWeight.w400,
            fontFamily: 'Inter',
            color: done
                ? Colors.white.withAlpha(200)
                : Colors.white.withAlpha(100),
          ),
        ),
      ],
    );
  }

  Widget _buildMapView() {
    return Stack(
      children: [
        // OpenStreetMap via network image (static map)
        Positioned.fill(
          child: Image.network(
            'https://tile.openstreetmap.org/12/3270/2048.png',
            fit: BoxFit.cover,
            semanticLabel:
                'OpenStreetMap trail map showing mountain terrain and routes',
            errorBuilder: (context, error, stackTrace) => Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF2D6A4F),
                    Color(0xFF1B4332),
                    Color(0xFF081C15),
                  ],
                ),
              ),
              child: CustomPaint(painter: _MapFallbackPainter()),
            ),
          ),
        ),
        // Map overlay tint
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withAlpha(40),
                  Colors.black.withAlpha(120),
                ],
                stops: [0.0, 0.6, 1.0],
              ),
            ),
          ),
        ),
        // Top bar
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            child: Container(
              margin: EdgeInsets.all(12.h),
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(160),
                borderRadius: BorderRadius.circular(16.h),
                border: Border.all(color: Colors.white.withAlpha(40)),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 18.h,
                    ),
                  ),
                  SizedBox(width: 12.h),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mt. Buthak Trail',
                          style: TextStyle(
                            fontSize: 15.fSize,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Inter',
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '3726 Mdpl • 12.4 km',
                          style: TextStyle(
                            fontSize: 11.fSize,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter',
                            color: Colors.white.withAlpha(180),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.my_location, color: Color(0xFF52B788), size: 22.h),
                ],
              ),
            ),
          ),
        ),
        // Map markers
        Positioned(
          top: MediaQuery.of(context).size.height * 0.25,
          left: MediaQuery.of(context).size.width * 0.4,
          child: _buildMapPin('You', Color(0xFF52B788)),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.18,
          right: MediaQuery.of(context).size.width * 0.2,
          child: _buildMapPin('Summit', Colors.redAccent),
        ),
        // Route line indicator
        Positioned(
          bottom: 200.h,
          left: 16.h,
          right: 16.h,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 10.h),
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(160),
              borderRadius: BorderRadius.circular(12.h),
              border: Border.all(color: Color(0xFF52B788).withAlpha(100)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildRouteInfo(Icons.timer_outlined, '4h 30m', 'Est. Time'),
                _buildRouteInfo(Icons.straighten, '12.4 km', 'Distance'),
                _buildRouteInfo(Icons.trending_up, '1,200m', 'Elevation'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMapPin(String label, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.h),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8.h),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 10.fSize,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              color: Colors.white,
            ),
          ),
        ),
        Container(width: 2, height: 12.h, color: color),
        Container(
          width: 8.h,
          height: 8.h,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
      ],
    );
  }

  Widget _buildRouteInfo(IconData icon, String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Color(0xFF52B788), size: 16.h),
        SizedBox(height: 2.h),
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
            fontSize: 9.fSize,
            fontWeight: FontWeight.w400,
            fontFamily: 'Inter',
            color: Colors.white.withAlpha(160),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomHealthSection() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.only(
          top: 12.h,
          left: 16.h,
          right: 16.h,
          bottom: 8.h,
        ),
        decoration: BoxDecoration(
          color: Colors.black.withAlpha(180),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.h),
            topRight: Radius.circular(20.h),
          ),
          border: Border(
            top: BorderSide(color: Color(0xFF52B788).withAlpha(80), width: 1),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40.h,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(60),
                  borderRadius: BorderRadius.circular(2.h),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'My Health',
              style: TextStyle(
                fontSize: 15.fSize,
                fontWeight: FontWeight.w700,
                fontFamily: 'Inter',
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildHealthMetric('SpO2', '98%', Color(0xFF52B788)),
                _buildHealthMetric('BPM', '72', Colors.redAccent),
                _buildHealthMetric('HRV', '45', Color(0xFF4FC3F7)),
                _buildHealthMetric('Temp', '36.5°', Colors.orangeAccent),
              ],
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }

  Widget _buildHealthMetric(String label, String value, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      decoration: BoxDecoration(
        color: color.withAlpha(30),
        borderRadius: BorderRadius.circular(12.h),
        border: Border.all(color: color.withAlpha(100), width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 16.fSize,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              color: color,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 10.fSize,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
              color: Colors.white.withAlpha(180),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    final tabs = [
      _BottomTab(icon: Icons.home_rounded, label: 'Home'),
      _BottomTab(icon: Icons.backpack_outlined, label: 'Prep'),
      _BottomTab(icon: Icons.pause_circle_outline, label: 'Pause'),
      _BottomTab(icon: Icons.history_rounded, label: 'History'),
      _BottomTab(icon: Icons.group_outlined, label: 'Group'),
    ];

    return Container(
      height: 64.h,
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(220),
        border: Border(
          top: BorderSide(color: Color(0xFF52B788).withAlpha(80), width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(tabs.length, (index) {
          final isSelected = _selectedTabIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() => _selectedTabIndex = index);
              _handleTabTap(context, index);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    tabs[index].icon,
                    color: isSelected
                        ? Color(0xFF52B788)
                        : Colors.white.withAlpha(120),
                    size: 22.h,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    tabs[index].label,
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
        NavigatorService.pushNamed(AppRoutes.healthActivityDashboardScreen);
        break;
      case 2:
        // Pause - stay on map
        break;
      default:
        break;
    }
  }
}

class _BottomTab {
  final IconData icon;
  final String label;
  _BottomTab({required this.icon, required this.label});
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFF52B788).withAlpha(20)
      ..strokeWidth = 0.5;

    const spacing = 40.0;
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_GridPainter oldDelegate) => false;
}

class _MapFallbackPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFF52B788).withAlpha(30)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    // Draw simple trail lines
    final path = Path();
    path.moveTo(size.width * 0.2, size.height * 0.8);
    path.quadraticBezierTo(
      size.width * 0.4,
      size.height * 0.5,
      size.width * 0.6,
      size.height * 0.3,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.2,
      size.width * 0.85,
      size.height * 0.15,
    );
    canvas.drawPath(path, paint);

    // Contour lines
    for (int i = 1; i <= 5; i++) {
      final contourPaint = Paint()
        ..color = Color(0xFF52B788).withAlpha(15)
        ..strokeWidth = 0.8
        ..style = PaintingStyle.stroke;
      final oval = Rect.fromCenter(
        center: Offset(size.width * 0.6, size.height * 0.3),
        width: size.width * 0.15 * i,
        height: size.height * 0.1 * i,
      );
      canvas.drawOval(oval, contourPaint);
    }
  }

  @override
  bool shouldRepaint(_MapFallbackPainter oldDelegate) => false;
}
