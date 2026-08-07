import '../../../core/app_export.dart';

// ignore_for_file: must_be_immutable
class GroupMemberModel extends Equatable {
  GroupMemberModel({
    this.id,
    this.name,
    this.imagePath,
    this.statusLabel,
    this.statusDetail,
    this.statusColor,
    this.borderColor,
    this.signalImagePath,
  }) {
    id = id ?? '';
    name = name ?? '';
    imagePath = imagePath ?? ImageConstant.imgAvatars3dAvatar11;
    statusLabel = statusLabel ?? 'Normal';
    statusDetail = statusDetail ?? '';
    statusColor = statusColor ?? 0xFF54E59D;
    borderColor = borderColor ?? 0xFF54E59D;
    signalImagePath = signalImagePath ?? ImageConstant.imgSignal4;
  }

  String? id;
  String? name;
  String? imagePath;
  String? statusLabel;
  String? statusDetail;
  int? statusColor;
  int? borderColor;
  String? signalImagePath;

  GroupMemberModel copyWith({
    String? id,
    String? name,
    String? imagePath,
    String? statusLabel,
    String? statusDetail,
    int? statusColor,
    int? borderColor,
    String? signalImagePath,
  }) {
    return GroupMemberModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      statusLabel: statusLabel ?? this.statusLabel,
      statusDetail: statusDetail ?? this.statusDetail,
      statusColor: statusColor ?? this.statusColor,
      borderColor: borderColor ?? this.borderColor,
      signalImagePath: signalImagePath ?? this.signalImagePath,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    imagePath,
    statusLabel,
    statusDetail,
    statusColor,
    borderColor,
    signalImagePath,
  ];
}
