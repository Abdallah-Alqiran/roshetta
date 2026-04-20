import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';

class DoctorDetailsDatePicker extends StatelessWidget {
  final List<Map<String, String>> dates;
  final int selectedIndex;
  final ValueChanged<int> onDateSelected;

  const DoctorDetailsDatePicker({
    super.key,
    required this.dates,
    required this.selectedIndex,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(dates.length, (index) {
                final date = dates[index];
                final isSelected = selectedIndex == index;
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => onDateSelected(index),
                      borderRadius: BorderRadius.circular(12.r),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.symmetric(
                          vertical: 20.h,
                          horizontal: 24.w,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? context.colorScheme.primary
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: context.colorScheme.primary
                                        .withValues(alpha: 0.3),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ]
                              : null,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              date['dayName']!,
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: isSelected
                                    ? context.colorScheme.onSecondary
                                    : context.colorScheme.onSurface.withValues(
                                        alpha: 0.6,
                                      ),
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              date['dayNumber']!,
                              style: context.textTheme.displaySmall?.copyWith(
                                color: isSelected
                                    ? context.colorScheme.onSecondary
                                    : context.colorScheme.onSurface,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              date['month']!,
                              style: context.textTheme.bodySmall?.copyWith(
                                color: isSelected
                                    ? context.colorScheme.onSecondary
                                    : context.colorScheme.onSurface.withValues(
                                        alpha: 0.6,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Positioned(
            left: 0,
            child: IgnorePointer(
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 18.sp,
                color: context.colorScheme.onSurface.withValues(alpha: 0.2),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: IgnorePointer(
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18.sp,
                color: context.colorScheme.onSurface.withValues(alpha: 0.2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
