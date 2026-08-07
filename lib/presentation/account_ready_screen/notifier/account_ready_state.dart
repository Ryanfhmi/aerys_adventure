part of 'account_ready_notifier.dart';

class AccountReadyState extends Equatable {
  final AccountReadyModel? accountReadyModel;
  final bool? navigateToHome;
  final bool? isLoading;

  AccountReadyState({
    this.accountReadyModel,
    this.navigateToHome = false,
    this.isLoading = false,
  });

  @override
  List<Object?> get props => [accountReadyModel, navigateToHome, isLoading];

  AccountReadyState copyWith({
    AccountReadyModel? accountReadyModel,
    bool? navigateToHome,
    bool? isLoading,
  }) {
    return AccountReadyState(
      accountReadyModel: accountReadyModel ?? this.accountReadyModel,
      navigateToHome: navigateToHome ?? this.navigateToHome,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
