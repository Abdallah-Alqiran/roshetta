import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';

class RecentVisitsWidget extends StatelessWidget {
  const RecentVisitsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "الزيارات الأخيرة",
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "عرض الكل",
              style: context.textTheme.labelMedium?.copyWith(
                color: context.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 24.h),
        _buildVisitItem(
          context,
          name: "خالد عبدالله",
          id: "ID-4829",
          type: "فحص دوري",
          time: "09:00 ص",
          status: "مكتمل",
          statusColor: const Color(0xFF6C757D),
          avatarLabel: "خ",
          avatarColor: Colors.blue.withValues(alpha: 0.1),
          avatarTextColor: Colors.blue,
        ),
        SizedBox(height: 12.h),
        _buildVisitItem(
          context,
          name: "منى طارق",
          id: "ID-5102",
          type: "فحص دوري",
          time: "10:00 ص",
          status: "في الانتظار",
          statusColor: const Color(0xFF28A745),
          avatarLabel: "م",
          avatarColor: Colors.teal.withValues(alpha: 0.1),
          avatarTextColor: Colors.teal,
        ),
        SizedBox(height: 12.h),
        _buildVisitItem(
          context,
          name: "يوسف جمال",
          id: "ID-3391",
          type: "فحص دوري",
          time: "11:30 ص",
          status: "ملغى",
          statusColor: const Color(0xFFDC3545),
          avatarLabel: "ي",
          avatarColor: Colors.red.withValues(alpha: 0.1),
          avatarTextColor: Colors.red,
        ),
      ],
    );
  }

  Widget _buildVisitItem(
    BuildContext context, {
    required String name,
    required String id,
    required String type,
    required String time,
    required String status,
    required Color statusColor,
    required String avatarLabel,
    required Color avatarColor,
    required Color avatarTextColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              color: avatarColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                avatarLabel,
                style: TextStyle(
                  color: avatarTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: context.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
              Text(
                "#$id",
                style: context.textTheme.labelSmall?.copyWith(
                  color: Colors.grey,
                  fontSize: 11.sp,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            "$time $type",
            style: context.textTheme.labelMedium?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          const Spacer(),
          _buildStatusTag(status, statusColor),
        ],
      ),
    );
  }

  Widget _buildStatusTag(String status, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: color,
          fontSize: 11.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
