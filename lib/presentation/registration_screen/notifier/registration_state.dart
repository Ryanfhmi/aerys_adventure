part of 'registration_notifier.dart';

class RegistrationState extends Equatable {
  final TextEditingController? fullNameController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final bool? isLoading;
  final bool? isSuccess;
  final bool? isError;
  final String? errorMessage;
  final RegistrationModel? registrationModel;

  RegistrationState({
    this.fullNameController,
    this.emailController,
    this.passwordController,
    this.isLoading = false,
    this.isSuccess = false,
    this.isError = false,
    this.errorMessage,
    this.registrationModel,
  });

  @override
  List<Object?> get props => [
    fullNameController,
    emailController,
    passwordController,
    isLoading,
    isSuccess,
    isError,
    errorMessage,
    registrationModel,
  ];

  RegistrationState copyWith({
    TextEditingController? fullNameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    bool? isLoading,
    bool? isSuccess,
    bool? isError,
    String? errorMessage,
    RegistrationModel? registrationModel,
  }) {
    return RegistrationState(
      fullNameController: fullNameController ?? this.fullNameController,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      registrationModel: registrationModel ?? this.registrationModel,
    );
  }
}
