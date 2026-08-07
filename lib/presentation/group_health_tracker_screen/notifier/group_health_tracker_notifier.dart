import '../../../core/app_export.dart';
import '../models/group_health_tracker_model.dart';
import '../models/group_member_model.dart';

part 'group_health_tracker_state.dart';

final groupHealthTrackerNotifier =
    StateNotifierProvider.autoDispose<
      GroupHealthTrackerNotifier,
      GroupHealthTrackerState
    >(
      (ref) => GroupHealthTrackerNotifier(
        GroupHealthTrackerState(
          groupHealthTrackerModel: GroupHealthTrackerModel(),
        ),
      ),
    );

class GroupHealthTrackerNotifier
    extends StateNotifier<GroupHealthTrackerState> {
  GroupHealthTrackerNotifier(GroupHealthTrackerState state) : super(state) {
    initialize();
  }

  void initialize() {
    final members = [
      GroupMemberModel(
        id: '1',
        name: 'Juned',
        imagePath: ImageConstant.imgAvatars3dAvatar11,
        statusLabel: 'Normal',
        statusDetail: 'SpO2 96',
        statusColor: 0xFF54E59D,
        borderColor: 0xFF54E59D,
        signalImagePath: ImageConstant.imgSignal4,
      ),
      GroupMemberModel(
        id: '2',
        name: 'Mamud',
        imagePath: ImageConstant.imgAvatars3dAvatar11,
        statusLabel: 'Moderate',
        statusDetail: 'SpO2 80',
        statusColor: 0xFFDFF632,
        borderColor: 0xFFDFF632,
        signalImagePath: ImageConstant.imgSignal4,
      ),
      GroupMemberModel(
        id: '3',
        name: 'Kayla',
        imagePath: ImageConstant.imgAvatars3dAvatar11,
        statusLabel: 'Critical',
        statusDetail: 'SpO2 60',
        statusColor: 0xCCFC0808,
        borderColor: 0xFFE01E1D,
        signalImagePath: ImageConstant.imgSignal4,
      ),
    ];

    state = state.copyWith(
      groupHealthTrackerModel: GroupHealthTrackerModel(
        avgSpO2: '89',
        avgBPM: '89',
        avgHRV: '89',
        members: members,
      ),
      selectedBottomBarIndex: 4,
      isTrackingActive: false,
    );
  }

  void onBottomBarChanged(int index) {
    state = state.copyWith(selectedBottomBarIndex: index);
  }

  void onFabTap() {
    state = state.copyWith(
      isTrackingActive: !(state.isTrackingActive ?? false),
    );
  }

  void onMemberTap(String memberId) {
    // Handle member detail navigation
  }

  void onEmergencyCall() {
    // Emergency call handled in UI layer
  }
}
