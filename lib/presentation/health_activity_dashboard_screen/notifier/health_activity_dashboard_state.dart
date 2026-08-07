part of 'health_activity_dashboard_notifier.dart';

class HealthActivityDashboardState extends Equatable {
  final HealthActivityDashboardModel? dashboardModel;
  final int? selectedTabIndex;
  final bool? isLoading;

  HealthActivityDashboardState({
    this.dashboardModel,
    this.selectedTabIndex = 0,
    this.isLoading = false,
  });

  @override
  List<Object?> get props => [dashboardModel, selectedTabIndex, isLoading];

  HealthActivityDashboardState copyWith({
    HealthActivityDashboardModel? dashboardModel,
    int? selectedTabIndex,
    bool? isLoading,
  }) {
    return HealthActivityDashboardState(
      dashboardModel: dashboardModel ?? this.dashboardModel,
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
