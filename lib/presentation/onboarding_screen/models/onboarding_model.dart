import '../../../core/app_export.dart';

/// This class is used in the [onboarding_screen] screen.

// ignore_for_file: must_be_immutable
class OnboardingModel extends Equatable {
  OnboardingModel({
    this.headline,
    this.subtitle,
    this.backgroundImagePath,
    this.forwardIconPath,
  }) {
    headline = headline ?? 'Conquer Every Trail';
    subtitle =
        subtitle ??
        'AERYS is your ultimate personal guide for every mountain adventure.';
    backgroundImagePath = backgroundImagePath ?? ImageConstant.imgImage5;
    forwardIconPath = forwardIconPath ?? ImageConstant.imgGroup2;
  }

  String? headline;
  String? subtitle;
  String? backgroundImagePath;
  String? forwardIconPath;

  OnboardingModel copyWith({
    String? headline,
    String? subtitle,
    String? backgroundImagePath,
    String? forwardIconPath,
  }) {
    return OnboardingModel(
      headline: headline ?? this.headline,
      subtitle: subtitle ?? this.subtitle,
      backgroundImagePath: backgroundImagePath ?? this.backgroundImagePath,
      forwardIconPath: forwardIconPath ?? this.forwardIconPath,
    );
  }

  @override
  List<Object?> get props => [
    headline,
    subtitle,
    backgroundImagePath,
    forwardIconPath,
  ];
}
