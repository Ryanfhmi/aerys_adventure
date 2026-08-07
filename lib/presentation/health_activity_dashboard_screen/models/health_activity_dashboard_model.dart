import '../../../core/app_export.dart';

/// This class is used in the [health_activity_dashboard_screen] screen.

// ignore_for_file: must_be_immutable
class HealthActivityDashboardModel extends Equatable {
  HealthActivityDashboardModel({
    this.userName,
    this.dayLabel,
    this.dateText,
    this.dateRange,
    this.locationName,
    this.elevation,
    this.temperature,
    this.windSpeed,
    this.trailStatus,
    this.spo2Value,
    this.bpmValue,
    this.hrvValue,
    this.activityLevel,
    this.avatarImagePath,
  }) {
    userName = userName ?? 'Hello Juned';
    dayLabel = dayLabel ?? 'Today';
    dateText = dateText ?? 'Sunday, 23 Sep 2045';
    dateRange = dateRange ?? 'Sep 2045 - Sep 2055';
    locationName = locationName ?? 'Mt. Buthak';
    elevation = elevation ?? '3726 Mdpl';
    temperature = temperature ?? '23 C';
    windSpeed = windSpeed ?? '10 Km/h';
    trailStatus = trailStatus ?? 'Status: Open';
    spo2Value = spo2Value ?? '89';
    bpmValue = bpmValue ?? '89';
    hrvValue = hrvValue ?? '89';
    activityLevel = activityLevel ?? 'Moderate';
    avatarImagePath = avatarImagePath ?? ImageConstant.imgAvatars3dAvatar11;
  }

  String? userName;
  String? dayLabel;
  String? dateText;
  String? dateRange;
  String? locationName;
  String? elevation;
  String? temperature;
  String? windSpeed;
  String? trailStatus;
  String? spo2Value;
  String? bpmValue;
  String? hrvValue;
  String? activityLevel;
  String? avatarImagePath;

  HealthActivityDashboardModel copyWith({
    String? userName,
    String? dayLabel,
    String? dateText,
    String? dateRange,
    String? locationName,
    String? elevation,
    String? temperature,
    String? windSpeed,
    String? trailStatus,
    String? spo2Value,
    String? bpmValue,
    String? hrvValue,
    String? activityLevel,
    String? avatarImagePath,
  }) {
    return HealthActivityDashboardModel(
      userName: userName ?? this.userName,
      dayLabel: dayLabel ?? this.dayLabel,
      dateText: dateText ?? this.dateText,
      dateRange: dateRange ?? this.dateRange,
      locationName: locationName ?? this.locationName,
      elevation: elevation ?? this.elevation,
      temperature: temperature ?? this.temperature,
      windSpeed: windSpeed ?? this.windSpeed,
      trailStatus: trailStatus ?? this.trailStatus,
      spo2Value: spo2Value ?? this.spo2Value,
      bpmValue: bpmValue ?? this.bpmValue,
      hrvValue: hrvValue ?? this.hrvValue,
      activityLevel: activityLevel ?? this.activityLevel,
      avatarImagePath: avatarImagePath ?? this.avatarImagePath,
    );
  }

  @override
  List<Object?> get props => [
    userName,
    dayLabel,
    dateText,
    dateRange,
    locationName,
    elevation,
    temperature,
    windSpeed,
    trailStatus,
    spo2Value,
    bpmValue,
    hrvValue,
    activityLevel,
    avatarImagePath,
  ];
}
