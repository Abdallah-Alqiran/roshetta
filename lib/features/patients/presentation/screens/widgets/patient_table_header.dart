import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';

class PatientTableHeader extends StatelessWidget {
  const PatientTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      decoration: BoxDecoration(
        color: context.colorScheme.scrim.withValues(alpha: 0.05),
        borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              "المريض",
              style: context.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.scrim.withValues(alpha: 0.7),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "آخر زيارة",
              style: context.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.scrim.withValues(alpha: 0.7),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "معلومات الاتصال",
              style: context.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.scrim.withValues(alpha: 0.7),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "الإجراءات",
                style: context.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.scrim.withValues(alpha: 0.7),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
