import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';

class RecentVisitsWidget extends StatelessWidget {
  const RecentVisitsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
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
              Text(
                "عرض الكل",
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "الزيارات الأخيرة",
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          _buildVisitItem(
            context,
            name: "خالد عبدالله",
            id: "#ID-4829",
            type: "فحص دوري",
            time: "09:00 ص",
            status: "مكتمل",
            statusColor: Colors.grey,
            avatarLabel: "خ",
            avatarColor: Colors.blue.withValues(alpha: 0.1),
            avatarTextColor: Colors.blue,
          ),
          SizedBox(height: 16.h),
          _buildVisitItem(
            context,
            name: "منى طارق",
            id: "#ID-5102",
            type: "استشارة باطنية",
            time: "10:00 ص",
            status: "في الانتظار",
            statusColor: Colors.teal,
            avatarLabel: "م",
            avatarColor: Colors.teal.withValues(alpha: 0.1),
            avatarTextColor: Colors.teal,
          ),
          SizedBox(height: 16.h),
          _buildVisitItem(
            context,
            name: "يوسف جمال",
            id: "#ID-3391",
            type: "متابعة تحاليل",
            time: "11:30 ص",
            status: "ملغى",
            statusColor: Colors.red,
            avatarLabel: "ي",
            avatarColor: Colors.red.withValues(alpha: 0.1),
            avatarTextColor: Colors.red,
          ),
        ],
      ),
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
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          _buildStatusTag(status, statusColor),
          const Spacer(),
          Text(
            time,
            style: context.textTheme.labelMedium?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          SizedBox(width: 24.w),
          Text(
            type,
            style: context.textTheme.labelMedium?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                name,
                style: context.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                id,
                style: context.textTheme.labelSmall?.copyWith(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(width: 16.w),
          Container(
            width: 40.w,
            height: 40.w,
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusTag(String status, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: color,
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
