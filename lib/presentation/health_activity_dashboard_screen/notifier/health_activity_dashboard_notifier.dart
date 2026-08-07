import '../../../core/app_export.dart';
import '../models/health_activity_dashboard_model.dart';

part 'health_activity_dashboard_state.dart';

final healthActivityDashboardNotifier =
    StateNotifierProvider.autoDispose<
      HealthActivityDashboardNotifier,
      HealthActivityDashboardState
    >(
      (ref) => HealthActivityDashboardNotifier(
        HealthActivityDashboardState(
          dashboardModel: HealthActivityDashboardModel(),
          selectedTabIndex: 0,
          isLoading: false,
        ),
      ),
    );

class HealthActivityDashboardNotifier
    extends StateNotifier<HealthActivityDashboardState> {
  HealthActivityDashboardNotifier(HealthActivityDashboardState state)
    : super(state) {
    initialize();
  }

  void initialize() {
    state = state.copyWith(
      dashboardModel: HealthActivityDashboardModel(
        userName: 'Hello Juned',
        dayLabel: 'Today',
        dateText: 'Sunday, 23 Sep 2045',
        dateRange: 'Sep 2045 - Sep 2055',
        locationName: 'Mt. Buthak',
        elevation: '3726 Mdpl',
        temperature: '23 C',
        windSpeed: '10 Km/h',
        trailStatus: 'Status: Open',
        spo2Value: '89',
        bpmValue: '89',
        hrvValue: '89',
        activityLevel: 'Moderate',
        avatarImagePath: ImageConstant.imgAvatars3dAvatar11,
      ),
      selectedTabIndex: 0,
      isLoading: false,
    );
  }

  void onTabChanged(int index) {
    state = state.copyWith(selectedTabIndex: index);
  }

  void onFabTapped() {
    // Start or record an activity session
  }

  void onSpO2Tapped() {
    // Navigate to SpO2 detail
  }

  void onBpmTapped() {
    // Navigate to BPM detail
  }

  void onHrvTapped() {
    // Navigate to HRV detail
  }

  void onActivityTapped() {
    // Navigate to activity details
  }

  void onLocationTapped() {
    // Navigate to location details
  }
}
