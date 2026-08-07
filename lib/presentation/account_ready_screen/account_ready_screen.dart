import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import 'notifier/account_ready_notifier.dart';

class AccountReadyScreen extends ConsumerStatefulWidget {
  AccountReadyScreen({Key? key}) : super(key: key);

  @override
  AccountReadyScreenState createState() => AccountReadyScreenState();
}

class AccountReadyScreenState extends ConsumerState<AccountReadyScreen> {
  @override
  Widget build(BuildContext context) {
    ref.listen(accountReadyNotifier, (previous, current) {
      if (!(previous?.navigateToHome ?? false) &&
          (current.navigateToHome ?? false)) {
        NavigatorService.pushNamedAndRemoveUntil(
          AppRoutes.healthActivityDashboardScreen,
        );
      }
    });

    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(extendBodyBehindAppBar: true, body: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildBackgroundImage(),
          _buildGradientOverlay(),
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return CustomImageView(
      imagePath: ImageConstant.imgImage7874x402,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
      alignment: Alignment.center,
    );
  }

  Widget _buildGradientOverlay() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0x00000000),
            appTheme.color330000,
            appTheme.color880000,
          ],
          stops: [0.4, 0.7, 1.0],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(),
        _buildTitleText(),
        SizedBox(height: 12.h),
        _buildSubtitleText(),
        _buildGetStartedButton(context),
        SizedBox(height: 60.h),
      ],
    );
  }

  Widget _buildTitleText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Text(
        'Your Account is\nnow ready',
        textAlign: TextAlign.center,
        style: TextStyleHelper.instance.title20BoldInter.copyWith(height: 1.2),
      ),
    );
  }

  Widget _buildSubtitleText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Text(
        "You're ready to go. Have fun",
        textAlign: TextAlign.center,
        style: TextStyleHelper.instance.body14RegularInter.copyWith(
          height: 1.2,
        ),
      ),
    );
  }

  Widget _buildGetStartedButton(BuildContext context) {
    return CustomButton(
      text: 'Get Started',
      buttonWidth: double.infinity,
      buttonStyle: CustomButtonStyleType.primary,
      backgroundColor: appTheme.gray_400_d8,
      textColor: appTheme.white_A700,
      margin: EdgeInsets.only(top: 26.h, left: 46.h, right: 46.h),
      onPressed: () => _onGetStartedTapped(),
    );
  }

  void _onGetStartedTapped() {
    ref.read(accountReadyNotifier.notifier).onGetStartedPressed();
  }
}
