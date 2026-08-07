import 'package:equatable/equatable.dart';

import '../../../core/app_export.dart';
import './group_member_model.dart';

// ignore_for_file: must_be_immutable
class GroupHealthTrackerModel extends Equatable {
  GroupHealthTrackerModel({
    this.avgSpO2,
    this.avgBPM,
    this.avgHRV,
    this.members,
  }) {
    avgSpO2 = avgSpO2 ?? '89';
    avgBPM = avgBPM ?? '89';
    avgHRV = avgHRV ?? '89';
    members = members ?? [];
  }

  String? avgSpO2;
  String? avgBPM;
  String? avgHRV;
  List<GroupMemberModel>? members;

  GroupHealthTrackerModel copyWith({
    String? avgSpO2,
    String? avgBPM,
    String? avgHRV,
    List<GroupMemberModel>? members,
  }) {
    return GroupHealthTrackerModel(
      avgSpO2: avgSpO2 ?? this.avgSpO2,
      avgBPM: avgBPM ?? this.avgBPM,
      avgHRV: avgHRV ?? this.avgHRV,
      members: members ?? this.members,
    );
  }

  @override
  List<Object?> get props => [avgSpO2, avgBPM, avgHRV, members];
}
