import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/core/localization/app_localizations.dart';

class DoctorDetailsBackRow extends StatelessWidget {
  const DoctorDetailsBackRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 28.h),
      child: InkWell(
        onTap: () => context.pop(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.tr('back_to_search'),
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colorScheme.onSurface.withValues(alpha: 0.4),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 8.w),
            Icon(
              Icons.arrow_forward,
              color: context.colorScheme.onSurface.withValues(alpha: 0.4),
              size: 20.r,
            ),
          ],
        ),
      ),
    );
  }
}
