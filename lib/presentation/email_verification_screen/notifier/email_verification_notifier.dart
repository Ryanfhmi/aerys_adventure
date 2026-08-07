import 'package:flutter/material.dart';
import '../models/email_verification_model.dart';
import '../../../core/app_export.dart';

part 'email_verification_state.dart';

final emailVerificationNotifier =
    StateNotifierProvider.autoDispose<
      EmailVerificationNotifier,
      EmailVerificationState
    >(
      (ref) => EmailVerificationNotifier(
        EmailVerificationState(
          emailVerificationModel: EmailVerificationModel(),
        ),
      ),
    );

class EmailVerificationNotifier extends StateNotifier<EmailVerificationState> {
  EmailVerificationNotifier(EmailVerificationState state) : super(state) {
    initialize();
  }

  void initialize() {
    state = state.copyWith(
      otpController: TextEditingController(),
      isLoading: false,
      isSuccess: false,
      hasError: false,
      showFieldError: false,
      errorMessage: '',
    );
  }

  void onOtpChanged(String value) {
    if (state.showFieldError ?? false) {
      state = state.copyWith(showFieldError: false);
    }
    state = state.copyWith(
      emailVerificationModel: state.emailVerificationModel?.copyWith(
        otpValue: value,
      ),
    );
  }

  void onOtpCompleted(String value) {
    state = state.copyWith(
      showFieldError: false,
      emailVerificationModel: state.emailVerificationModel?.copyWith(
        otpValue: value,
      ),
    );
  }

  void setFieldError(bool show) {
    state = state.copyWith(showFieldError: show);
  }

  Future<void> verifyOtp(String otp) async {
    state = state.copyWith(isLoading: true, hasError: false);

    try {
      await Future.delayed(Duration(seconds: 2));

      if (otp.length == 4) {
        state = state.copyWith(
          isLoading: false,
          isSuccess: true,
          hasError: false,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          isSuccess: false,
          hasError: true,
          errorMessage: 'Invalid OTP. Please try again.',
          showFieldError: true,
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        hasError: true,
        errorMessage: 'Verification failed. Please try again.',
      );
    }
  }

  Future<void> resendOtp() async {
    state = state.copyWith(
      emailVerificationModel: state.emailVerificationModel?.copyWith(
        otpValue: '',
      ),
      showFieldError: false,
      hasError: false,
      isSuccess: false,
    );

    state.otpController?.clear();

    await Future.delayed(Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    state.otpController?.dispose();
    super.dispose();
  }
}
