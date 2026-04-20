import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/core/localization/app_localizations.dart';

class DoctorSearchFilterWidget extends StatelessWidget {
  const DoctorSearchFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 3,
            child: _buildInputColumn(
              context: context,
              label: context.tr('doctor_name'),
              hint: context.tr('search_by_name'),
              icon: Icons.search,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            flex: 2,
            child: _buildInputColumn(
              context: context,
              label: context.tr('region'),
              hint: context.tr('choose_region'),
              icon: Icons.location_on_outlined,
              isDropdown: true,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            flex: 2,
            child: _buildInputColumn(
              context: context,
              label: context.tr('specialization'),
              hint: context.tr('choose_specialization'),
              icon: Icons.medical_services_outlined,
              isDropdown: true,
            ),
          ),
          SizedBox(width: 16.w),
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colorScheme.primary,
              foregroundColor: context.colorScheme.onPrimary,
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 32.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              elevation: 0,
            ),
            icon: Icon(Icons.search, size: 20.sp),
            label: Text(
              context.tr('search'),
              style: context.textTheme.titleMedium?.copyWith(
                color: context.colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputColumn({
    required BuildContext context,
    required String label,
    required String hint,
    required IconData icon,
    bool isDropdown = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: context.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colorScheme.scrim.withValues(alpha: 0.6),
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: context.colorScheme.scrim.withValues(alpha: 0.1),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                hint,
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.scrim.withValues(alpha: 0.4),
                ),
              ),
              Icon(
                icon,
                color: context.colorScheme.scrim.withValues(alpha: 0.4),
                size: 20.sp,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
