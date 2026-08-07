import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_image_view.dart';
import 'notifier/onboarding_notifier.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    ref.listen(onboardingNotifier, (previous, current) {
      if (current.navigateToRegistration ?? false) {
        NavigatorService.pushNamed(AppRoutes.registrationScreen);
      }
    });

    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(body: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: appTheme.green_50,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildBackgroundImage(),
          _buildDarkOverlay(),
          _buildContentOverlay(context),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Image.network(
      'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=1200&q=90&fit=crop',
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      semanticLabel:
          'Majestic mountain peak with dramatic rocky cliffs and clear blue sky',
      errorBuilder: (context, error, stackTrace) => CustomImageView(
        imagePath: ImageConstant.imgImage5,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildDarkOverlay() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withAlpha(30),
            Colors.black.withAlpha(80),
            Colors.black.withAlpha(180),
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
    );
  }

  Widget _buildContentOverlay(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Spacer(), _buildBottomContent(context)],
    );
  }

  Widget _buildBottomContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 56.h,
        bottom: 60.h,
        left: 24.h,
        right: 24.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildHeadlineText(),
          SizedBox(height: 10.h),
          _buildSubtitleText(),
          SizedBox(height: 32.h),
          _buildForwardButton(context),
        ],
      ),
    );
  }

  Widget _buildHeadlineText() {
    return Text(
      'Conquer Every Trail',
      style: TextStyle(
        fontSize: 26.fSize,
        fontWeight: FontWeight.w800,
        fontFamily: 'Inter',
        color: Colors.white,
        height: 1.25,
        shadows: [
          Shadow(
            color: Colors.black.withAlpha(180),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSubtitleText() {
    return Text(
      'AERYS is your ultimate personal guide for every mountain adventure.',
      style: TextStyle(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
        color: Colors.white.withAlpha(220),
        height: 1.5,
        shadows: [
          Shadow(
            color: Colors.black.withAlpha(150),
            blurRadius: 6,
            offset: Offset(0, 1),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildForwardButton(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          ref.read(onboardingNotifier.notifier).onForwardButtonTapped();
        },
        child: Container(
          width: 64.h,
          height: 64.h,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(40),
            borderRadius: BorderRadius.circular(32.h),
            border: Border.all(color: Colors.white.withAlpha(180), width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(60),
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            Icons.arrow_forward_rounded,
            color: Colors.white,
            size: 28.h,
          ),
        ),
      ),
    );
  }
}
