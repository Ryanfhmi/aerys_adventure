import 'package:flutter/material.dart';
import '../models/registration_model.dart';
import '../../../core/app_export.dart';

part 'registration_state.dart';

final registrationNotifier =
    StateNotifierProvider.autoDispose<RegistrationNotifier, RegistrationState>(
      (ref) => RegistrationNotifier(
        RegistrationState(
          registrationModel: RegistrationModel(),
          fullNameController: TextEditingController(),
          emailController: TextEditingController(),
          passwordController: TextEditingController(),
        ),
      ),
    );

class RegistrationNotifier extends StateNotifier<RegistrationState> {
  RegistrationNotifier(RegistrationState state) : super(state);

  void onFullNameChanged(String value) {
    state = state.copyWith(
      registrationModel: state.registrationModel?.copyWith(fullName: value),
    );
  }

  void onEmailChanged(String value) {
    state = state.copyWith(
      registrationModel: state.registrationModel?.copyWith(email: value),
    );
  }

  void onPasswordChanged(String value) {
    state = state.copyWith(
      registrationModel: state.registrationModel?.copyWith(password: value),
    );
  }

  Future<void> submitRegistration() async {
    state = state.copyWith(isLoading: true, isError: false, isSuccess: false);

    try {
      // Simulate registration logic — replace with real API call
      await Future.delayed(Duration(milliseconds: 800));

      final fullName = state.registrationModel?.fullName ?? '';
      final email = state.registrationModel?.email ?? '';
      final password = state.registrationModel?.password ?? '';

      if (fullName.isEmpty || email.isEmpty || password.isEmpty) {
        state = state.copyWith(
          isLoading: false,
          isError: true,
          errorMessage: 'Please fill in all required fields.',
        );
        return;
      }

      // Clear controllers
      state.fullNameController?.clear();
      state.emailController?.clear();
      state.passwordController?.clear();

      state = state.copyWith(
        isLoading: false,
        isSuccess: true,
        registrationModel: RegistrationModel(),
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isError: true,
        errorMessage: 'An unexpected error occurred. Please try again.',
      );
    }
  }

  void resetSuccess() {
    state = state.copyWith(isSuccess: false);
  }

  void resetError() {
    state = state.copyWith(isError: false, errorMessage: null);
  }

  @override
  void dispose() {
    state.fullNameController?.dispose();
    state.emailController?.dispose();
    state.passwordController?.dispose();
    super.dispose();
  }
}
