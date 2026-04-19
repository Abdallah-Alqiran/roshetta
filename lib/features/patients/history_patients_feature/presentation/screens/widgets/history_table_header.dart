import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';

class HistoryTableHeader extends StatelessWidget {
  const HistoryTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      decoration: BoxDecoration(
        color: const Color(0xFFEBEBEB),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              'اسم الطبيب والتخصص',
              style: context.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.scrim.withValues(alpha: 0.6),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'التاريخ',
              textAlign: TextAlign.center,
              style: context.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.scrim.withValues(alpha: 0.6),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'الوقت',
              textAlign: TextAlign.center,
              style: context.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.scrim.withValues(alpha: 0.6),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'الحالة',
              textAlign: TextAlign.center,
              style: context.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.scrim.withValues(alpha: 0.6),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'الإجراءات',
              textAlign: TextAlign.center,
              style: context.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.scrim.withValues(alpha: 0.6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
