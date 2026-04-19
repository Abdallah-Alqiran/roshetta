import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';

class DoctorListItem extends StatelessWidget {
  final String name;
  final String specialization;
  final String location;
  final String price;
  final String description;
  final VoidCallback onBookTap;

  const DoctorListItem({
    super.key,
    required this.name,
    required this.specialization,
    required this.location,
    required this.price,
    required this.description,
    required this.onBookTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  specialization,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.primary,
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 18.sp,
                      color: context.colorScheme.scrim.withValues(alpha: 0.6),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      location,
                      style: context.textTheme.labelLarge?.copyWith(
                        color: context.colorScheme.scrim.withValues(alpha: 0.6),
                      ),
                    ),
                    SizedBox(width: 24.w),
                    Icon(
                      Icons.payments_outlined,
                      size: 18.sp,
                      color: context.colorScheme.scrim.withValues(alpha: 0.6),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      price,
                      style: context.textTheme.labelLarge?.copyWith(
                        color: context.colorScheme.scrim.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Text(
                  description,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.scrim.withValues(alpha: 0.5),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 24.w),
          ElevatedButton(
            onPressed: onBookTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colorScheme.primary,
              foregroundColor: context.colorScheme.onPrimary,
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              elevation: 0,
            ),
            child: Text(
              'احجز\nالآن',
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
