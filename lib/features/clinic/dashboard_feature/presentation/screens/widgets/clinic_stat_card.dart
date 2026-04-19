import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';

class ClinicStatCard extends StatelessWidget {
  final String label;
  final String count;
  final IconData icon;
  final Color backgroundColor;
  final Color contentColor;

  const ClinicStatCard({
    super.key,
    required this.label,
    required this.count,
    required this.icon,
    required this.backgroundColor,
    required this.contentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: contentColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: contentColor, size: 20.sp),
              ),
              const SizedBox(),
            ],
          ),
          SizedBox(height: 24.h),
          Text(
            label,
            style: context.textTheme.labelMedium?.copyWith(
              color: contentColor.withValues(alpha: 0.7),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            count,
            style: context.textTheme.displayMedium?.copyWith(
              color: contentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
