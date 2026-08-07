import '../models/onboarding_model.dart';
import '../../../core/app_export.dart';

part 'onboarding_state.dart';

final onboardingNotifier =
    StateNotifierProvider.autoDispose<OnboardingNotifier, OnboardingState>(
      (ref) => OnboardingNotifier(
        OnboardingState(onboardingModel: OnboardingModel()),
      ),
    );

class OnboardingNotifier extends StateNotifier<OnboardingState> {
  OnboardingNotifier(OnboardingState state) : super(state) {
    initialize();
  }

  void initialize() {
    state = state.copyWith(navigateToRegistration: false);
  }

  void onForwardButtonTapped() {
    state = state.copyWith(navigateToRegistration: true);
  }

  void resetNavigation() {
    state = state.copyWith(navigateToRegistration: false);
  }
}
