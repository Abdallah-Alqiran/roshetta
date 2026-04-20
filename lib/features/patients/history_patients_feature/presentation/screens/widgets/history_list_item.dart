import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';

class HistoryListItem extends StatelessWidget {
  final String doctorName;
  final String specialization;
  final String date;
  final String status;

  const HistoryListItem({
    super.key,
    required this.doctorName,
    required this.specialization,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.scrim.withValues(alpha: 0.05),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorName,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  specialization,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colorScheme.scrim.withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: 16.sp,
                  color: context.colorScheme.primary,
                ),
                SizedBox(width: 8.w),
                Text(
                  date,
                  style: context.textTheme.titleSmall?.copyWith(
                    color: context.colorScheme.scrim.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              status,
              textAlign: TextAlign.center,
              style: context.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(flex: 2, child: Icon(Icons.info_outline)),
        ],
      ),
    );
  }
}
