import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';

class QuickActionsWidget extends StatelessWidget {
  const QuickActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "إجراءات سريعة",
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24.h),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 16.h,
            crossAxisSpacing: 16.w,
            children: [
              _buildActionCard(
                context,
                icon: Icons.assignment_outlined,
                label: "وصفة طبية",
                iconColor: Colors.teal,
                backgroundColor: Colors.teal.withValues(alpha: 0.1),
              ),
              _buildActionCard(
                context,
                icon: Icons.science_outlined,
                label: "طلب تحاليل",
                iconColor: Colors.blue,
                backgroundColor: Colors.blue.withValues(alpha: 0.1),
              ),
              _buildActionCard(
                context,
                icon: Icons.contact_page_outlined,
                label: "ملف مريض",
                iconColor: Colors.red,
                backgroundColor: Colors.red.withValues(alpha: 0.1),
              ),
              _buildActionCard(
                context,
                icon: Icons.bar_chart_outlined,
                label: "تقارير",
                iconColor: Colors.grey,
                backgroundColor: Colors.grey.withValues(alpha: 0.1),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color iconColor,
    required Color backgroundColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 24.sp),
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            style: context.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
