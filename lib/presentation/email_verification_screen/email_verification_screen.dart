import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import 'notifier/email_verification_notifier.dart';

class EmailVerificationScreen extends ConsumerStatefulWidget {
  EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  EmailVerificationScreenState createState() => EmailVerificationScreenState();
}

class EmailVerificationScreenState
    extends ConsumerState<EmailVerificationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ref.listen(emailVerificationNotifier, (previous, current) {
      if (!(previous?.isSuccess ?? false) && (current.isSuccess ?? false)) {
        NavigatorService.pushNamed(AppRoutes.accountReadyScreen);
      }
      if (!(previous?.hasError ?? false) && (current.hasError ?? false)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(current.errorMessage ?? 'Verification failed'),
            backgroundColor: appTheme.colorFFFC08,
          ),
        );
      }
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.green_800,
        body: Stack(children: [_buildBackgroundImage(), _buildContent()]),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Positioned.fill(
      child: Image.network(
        'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=1200&q=90&fit=crop',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        semanticLabel:
            'Aerial view of mountain peaks with snow and clouds at sunrise',
        errorBuilder: (context, error, stackTrace) => CustomImageView(
          imagePath: ImageConstant.imgImage15,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black.withAlpha(80), Colors.black.withAlpha(160)],
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.h),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 80.h),
                      _buildIcon(),
                      SizedBox(height: 24.h),
                      _buildTitle(),
                      SizedBox(height: 12.h),
                      _buildSubtitle(),
                      SizedBox(height: 48.h),
                      _buildOtpSection(),
                      SizedBox(height: 40.h),
                      _buildResendOtp(),
                      SizedBox(height: 20.h),
                      _buildVerifyButton(),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      width: 72.h,
      height: 72.h,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(30),
        borderRadius: BorderRadius.circular(36.h),
        border: Border.all(color: Colors.white.withAlpha(100), width: 2),
      ),
      child: Icon(
        Icons.mark_email_read_outlined,
        color: Colors.white,
        size: 36.h,
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Verify Your Email',
      style: TextStyle(
        fontSize: 22.fSize,
        fontWeight: FontWeight.w800,
        fontFamily: 'Inter',
        color: Colors.white,
        height: 1.2,
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

  Widget _buildSubtitle() {
    return Text(
      'Enter the 4-digit verification code\nwe sent to your email address',
      style: TextStyle(
        fontSize: 13.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
        color: Colors.white.withAlpha(200),
        height: 1.5,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildOtpSection() {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(emailVerificationNotifier);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Enter OTP Code',
              style: TextStyle(
                fontSize: 12.fSize,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
                color: Colors.white.withAlpha(180),
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(height: 16.h),
            PinCodeTextField(
              appContext: context,
              length: 4,
              controller: state.otpController,
              obscureText: false,
              animationType: AnimationType.scale,
              keyboardType: TextInputType.number,
              textStyle: TextStyle(
                fontSize: 22.fSize,
                fontWeight: FontWeight.w700,
                fontFamily: 'Inter',
                color: Colors.white,
              ),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(16.h),
                fieldHeight: 72.h,
                fieldWidth: 72.h,
                activeFillColor: Colors.white.withAlpha(50),
                inactiveFillColor: Colors.white.withAlpha(20),
                selectedFillColor: Colors.white.withAlpha(60),
                activeColor: Colors.white,
                inactiveColor: Colors.white.withAlpha(80),
                selectedColor: Colors.white,
                borderWidth: 2.5,
              ),
              enableActiveFill: true,
              cursorColor: Colors.white,
              cursorWidth: 2.h,
              autoFocus: false,
              enablePinAutofill: true,
              pastedTextStyle: TextStyleHelper.instance.bodyTextSemiBold,
              onChanged: (value) {
                ref
                    .read(emailVerificationNotifier.notifier)
                    .onOtpChanged(value);
              },
              onCompleted: (value) {
                ref
                    .read(emailVerificationNotifier.notifier)
                    .onOtpCompleted(value);
              },
              beforeTextPaste: (text) => true,
            ),
            if (state.showFieldError ?? false)
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Text(
                  'Please enter the complete 4-digit code',
                  style: TextStyle(
                    fontSize: 11.fSize,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                    color: Colors.redAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildResendOtp() {
    return GestureDetector(
      onTap: () {
        ref.read(emailVerificationNotifier.notifier).resendOtp();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('OTP has been resent to your email'),
            backgroundColor: appTheme.green_800,
            duration: Duration(seconds: 2),
          ),
        );
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Didn't receive the code? ",
              style: TextStyle(
                fontSize: 12.fSize,
                fontWeight: FontWeight.w400,
                fontFamily: 'Inter',
                color: Colors.white.withAlpha(180),
              ),
            ),
            TextSpan(
              text: 'Resend OTP',
              style: TextStyle(
                fontSize: 12.fSize,
                fontWeight: FontWeight.w700,
                fontFamily: 'Inter',
                color: Colors.white,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVerifyButton() {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(emailVerificationNotifier);
        return CustomButton(
          text: state.isLoading ?? false ? 'Verifying...' : 'Verify Email',
          buttonWidth: double.infinity,
          backgroundColor: appTheme.colorB5B6B8,
          textColor: appTheme.colorD6FFFF,
          margin: EdgeInsets.symmetric(horizontal: 40.h),
          onPressed: state.isLoading ?? false
              ? null
              : () {
                  _onVerifyPressed();
                },
        );
      },
    );
  }

  void _onVerifyPressed() {
    final state = ref.read(emailVerificationNotifier);
    final otpValue = state.otpController?.text ?? '';

    if (otpValue.isEmpty || otpValue.length < 4) {
      ref.read(emailVerificationNotifier.notifier).setFieldError(true);
      return;
    }

    ref.read(emailVerificationNotifier.notifier).setFieldError(false);
    ref.read(emailVerificationNotifier.notifier).verifyOtp(otpValue);
  }
}
