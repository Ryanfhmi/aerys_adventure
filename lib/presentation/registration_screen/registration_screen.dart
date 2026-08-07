import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_edit_text.dart';
import '../../widgets/custom_image_view.dart';
import 'notifier/registration_notifier.dart';

class RegistrationScreen extends ConsumerStatefulWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  @override
  RegistrationScreenState createState() => RegistrationScreenState();
}

class RegistrationScreenState extends ConsumerState<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ref.listen(registrationNotifier, (previous, current) {
      if (!(previous?.isSuccess ?? false) && (current.isSuccess ?? false)) {
        _formKey.currentState?.reset();
        ref.read(registrationNotifier.notifier).resetSuccess();
        NavigatorService.pushNamed(AppRoutes.emailVerificationScreen);
      }
      if (!(previous?.isError ?? false) && (current.isError ?? false)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              current.errorMessage ?? 'Registration failed. Please try again.',
              style: TextStyleHelper.instance.body13,
            ),
            backgroundColor: appTheme.colorFFB000,
          ),
        );
        ref.read(registrationNotifier.notifier).resetError();
      }
    });

    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.network(
            'https://images.pexels.com/photos/1624496/pexels-photo-1624496.jpeg?w=1200&q=90',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            semanticLabel:
                'Misty mountain forest trail with green trees and foggy atmosphere',
            errorBuilder: (context, error, stackTrace) => CustomImageView(
              imagePath: ImageConstant.imgImage14,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
        // Dark overlay for readability
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withAlpha(100),
                  Colors.black.withAlpha(160),
                  Colors.black.withAlpha(200),
                ],
              ),
            ),
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight:
                    MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 54.h,
                    right: 32.h,
                    bottom: 54.h,
                    left: 32.h,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        _buildTitle(context),
                        SizedBox(height: 8.h),
                        _buildSubtitle(context),
                        Spacer(),
                        _buildInputFields(context),
                        Spacer(),
                        _buildLoginPrompt(context),
                        SizedBox(height: 18.h),
                        _buildRegisterButton(context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      'Create an Account',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 24.fSize,
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
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return Text(
      'Join AERYS and start your mountain adventure',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 13.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
        color: Colors.white.withAlpha(200),
        height: 1.4,
      ),
    );
  }

  Widget _buildInputFields(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(registrationNotifier);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFieldLabel('Full Name', Icons.person_outline),
            SizedBox(height: 6.h),
            CustomEditText(
              placeholder: 'Full Name',
              inputType: TextInputType.text,
              leftImagePath: ImageConstant.imgImage4,
              leftImageWidth: 40,
              leftImageHeight: 34,
              controller: state.fullNameController,
              validator: _validateFullName,
              onChanged: (value) => ref
                  .read(registrationNotifier.notifier)
                  .onFullNameChanged(value),
            ),
            SizedBox(height: 16.h),
            _buildFieldLabel('Email', Icons.email_outlined),
            SizedBox(height: 6.h),
            CustomEditText(
              placeholder: 'Email',
              inputType: TextInputType.emailAddress,
              leftImagePath: ImageConstant.imgImage4,
              leftImageWidth: 40,
              leftImageHeight: 34,
              controller: state.emailController,
              validator: _validateEmail,
              onChanged: (value) =>
                  ref.read(registrationNotifier.notifier).onEmailChanged(value),
            ),
            SizedBox(height: 16.h),
            _buildFieldLabel('Password', Icons.lock_outline),
            SizedBox(height: 6.h),
            CustomEditText(
              placeholder: 'Password',
              inputType: TextInputType.visiblePassword,
              leftImagePath: ImageConstant.imgImage4,
              leftImageWidth: 40,
              leftImageHeight: 34,
              controller: state.passwordController,
              isPassword: true,
              validator: _validatePassword,
              onChanged: (value) => ref
                  .read(registrationNotifier.notifier)
                  .onPasswordChanged(value),
            ),
          ],
        );
      },
    );
  }

  Widget _buildFieldLabel(String label, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.white.withAlpha(200), size: 14.h),
        SizedBox(width: 6.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.fSize,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
            color: Colors.white.withAlpha(220),
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginPrompt(BuildContext context) {
    return GestureDetector(
      onTap: () => _onLoginTapped(context),
      child: Align(
        alignment: Alignment.center,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Already have an account? ',
                style: TextStyle(
                  fontSize: 12.fSize,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Inter',
                  color: Colors.white.withAlpha(200),
                ),
              ),
              TextSpan(
                text: 'Login',
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
      ),
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final isLoading = ref.watch(
          registrationNotifier.select((state) => state.isLoading ?? false),
        );
        return CustomButton(
          text: isLoading ? 'Registering...' : 'Register',
          buttonWidth: double.infinity,
          buttonStyle: CustomButtonStyleType.secondary,
          backgroundColor: appTheme.gray_400_01,
          textColor: appTheme.colorD6FFFF,
          margin: EdgeInsets.symmetric(horizontal: 46.h),
          onPressed: isLoading ? null : () => _onRegisterTapped(context),
        );
      },
    );
  }

  String? _validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Full name is required';
    }
    if (value.trim().length < 2) {
      return 'Full name must be at least 2 characters';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  void _onRegisterTapped(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState?.validate() ?? false) {
      ref.read(registrationNotifier.notifier).submitRegistration();
    }
  }

  void _onLoginTapped(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.onboardingScreen);
  }
}
