import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/features/patients/presentation/screens/widgets/patient_status_pill.dart';
import 'package:roshetta/features/widgets/custom_img.dart';

class PatientListItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String genderAndAge;
  final String fileNumber;
  final String lastVisit;
  final String phone;
  final String email;
  final String status;
  final VoidCallback onActionTap;

  const PatientListItem({
    super.key,
    required this.imagePath,
    required this.name,
    required this.genderAndAge,
    required this.fileNumber,
    required this.lastVisit,
    required this.phone,
    required this.email,
    required this.status,
    required this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.scrim.withValues(alpha: 0.05),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                ClipOval(
                  child: CustomImage(
                    imagePath: imagePath,
                    width: 50,
                    height: 50,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        genderAndAge,
                        style: context.textTheme.labelMedium?.copyWith(
                          color: context.colorScheme.scrim.withValues(
                            alpha: 0.6,
                          ),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              fileNumber,
              style: context.textTheme.labelMedium?.copyWith(
                color: context.colorScheme.scrim.withValues(alpha: 0.8),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: 16.sp,
                  color: context.colorScheme.scrim.withValues(alpha: 0.6),
                ),
                SizedBox(width: 8.w),
                Text(
                  lastVisit,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colorScheme.scrim.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  phone,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colorScheme.scrim.withValues(alpha: 0.8),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  email,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.scrim.withValues(alpha: 0.6),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: PatientStatusPill(status: status),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: IconButton(
                onPressed: onActionTap,
                icon: Icon(
                  Icons.folder_outlined,
                  color: context.colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
