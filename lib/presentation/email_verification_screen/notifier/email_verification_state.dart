part of 'email_verification_notifier.dart';

class EmailVerificationState extends Equatable {
  final TextEditingController? otpController;
  final bool? isLoading;
  final bool? isSuccess;
  final bool? hasError;
  final bool? showFieldError;
  final String? errorMessage;
  final EmailVerificationModel? emailVerificationModel;

  EmailVerificationState({
    this.otpController,
    this.isLoading = false,
    this.isSuccess = false,
    this.hasError = false,
    this.showFieldError = false,
    this.errorMessage,
    this.emailVerificationModel,
  });

  @override
  List<Object?> get props => [
    otpController,
    isLoading,
    isSuccess,
    hasError,
    showFieldError,
    errorMessage,
    emailVerificationModel,
  ];

  EmailVerificationState copyWith({
    TextEditingController? otpController,
    bool? isLoading,
    bool? isSuccess,
    bool? hasError,
    bool? showFieldError,
    String? errorMessage,
    EmailVerificationModel? emailVerificationModel,
  }) {
    return EmailVerificationState(
      otpController: otpController ?? this.otpController,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      hasError: hasError ?? this.hasError,
      showFieldError: showFieldError ?? this.showFieldError,
      errorMessage: errorMessage ?? this.errorMessage,
      emailVerificationModel:
          emailVerificationModel ?? this.emailVerificationModel,
    );
  }
}
