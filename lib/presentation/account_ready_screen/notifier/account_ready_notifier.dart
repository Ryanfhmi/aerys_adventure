import '../models/account_ready_model.dart';
import '../../../core/app_export.dart';

part 'account_ready_state.dart';

final accountReadyNotifier =
    StateNotifierProvider.autoDispose<AccountReadyNotifier, AccountReadyState>(
      (ref) => AccountReadyNotifier(
        AccountReadyState(accountReadyModel: AccountReadyModel()),
      ),
    );

class AccountReadyNotifier extends StateNotifier<AccountReadyState> {
  AccountReadyNotifier(AccountReadyState state) : super(state) {
    initialize();
  }

  void initialize() {
    state = state.copyWith(navigateToHome: false, isLoading: false);
  }

  void onGetStartedPressed() {
    state = state.copyWith(isLoading: true);

    state = state.copyWith(isLoading: false, navigateToHome: true);
  }
}
