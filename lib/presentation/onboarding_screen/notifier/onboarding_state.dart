part of 'onboarding_notifier.dart';

class OnboardingState extends Equatable {
  final bool? navigateToRegistration;
  final OnboardingModel? onboardingModel;

  OnboardingState({this.navigateToRegistration = false, this.onboardingModel});

  @override
  List<Object?> get props => [navigateToRegistration, onboardingModel];

  OnboardingState copyWith({
    bool? navigateToRegistration,
    OnboardingModel? onboardingModel,
  }) {
    return OnboardingState(
      navigateToRegistration:
          navigateToRegistration ?? this.navigateToRegistration,
      onboardingModel: onboardingModel ?? this.onboardingModel,
    );
  }
}
