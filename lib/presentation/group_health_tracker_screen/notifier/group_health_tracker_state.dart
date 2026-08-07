part of 'group_health_tracker_notifier.dart';

class GroupHealthTrackerState extends Equatable {
  final GroupHealthTrackerModel? groupHealthTrackerModel;
  final int? selectedBottomBarIndex;
  final bool? isTrackingActive;

  GroupHealthTrackerState({
    this.groupHealthTrackerModel,
    this.selectedBottomBarIndex,
    this.isTrackingActive,
  });

  @override
  List<Object?> get props => [
    groupHealthTrackerModel,
    selectedBottomBarIndex,
    isTrackingActive,
  ];

  GroupHealthTrackerState copyWith({
    GroupHealthTrackerModel? groupHealthTrackerModel,
    int? selectedBottomBarIndex,
    bool? isTrackingActive,
  }) {
    return GroupHealthTrackerState(
      groupHealthTrackerModel:
          groupHealthTrackerModel ?? this.groupHealthTrackerModel,
      selectedBottomBarIndex:
          selectedBottomBarIndex ?? this.selectedBottomBarIndex,
      isTrackingActive: isTrackingActive ?? this.isTrackingActive,
    );
  }
}
