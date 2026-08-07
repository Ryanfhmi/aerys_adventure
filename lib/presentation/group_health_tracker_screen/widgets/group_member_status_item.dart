import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/group_member_model.dart';

class GroupMemberStatusItem extends StatelessWidget {
  final GroupMemberModel? model;
  final VoidCallback? onTap;

  GroupMemberStatusItem({Key? key, this.model, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderColor = Color(model?.borderColor ?? 0xFF54E59D);
    final statusColor = Color(model?.statusColor ?? 0xFF54E59D);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 2.h),
        decoration: BoxDecoration(
          color: appTheme.black_900_66,
          borderRadius: BorderRadius.circular(24.h),
          border: Border.all(color: borderColor, width: 2.h),
        ),
        child: Row(
          spacing: 10.h,
          children: [
            ClipOval(
              child: CustomImageView(
                imagePath:
                    model?.imagePath ?? ImageConstant.imgAvatars3dAvatar11,
                width: 40.h,
                height: 40.h,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2.h,
                children: [
                  Text(
                    model?.name ?? '',
                    style: TextStyleHelper.instance.body13SemiBoldInter
                        .copyWith(height: 1.23),
                  ),
                  Text(
                    '${model?.statusLabel ?? ''} - ${model?.statusDetail ?? ''}',
                    style: TextStyleHelper.instance.body12SemiBoldInter
                        .copyWith(height: 1.25),
                  ),
                ],
              ),
            ),
            CustomImageView(
              imagePath: model?.signalImagePath ?? ImageConstant.imgSignal4,
              width: 30.h,
              height: 30.h,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
