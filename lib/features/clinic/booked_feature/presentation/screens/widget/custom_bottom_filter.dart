// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';

class CustomBottomFilter extends StatelessWidget {
  final String text;
  final String? number;
  final VoidCallback onTap;
  final bool isSelected;

  const CustomBottomFilter({
    Key? key,
    required this.text,
    this.number,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: isSelected ? 102.w : 66.w,
        height: isSelected ? 48.h : 38.h,
        decoration: BoxDecoration(
          color: isSelected
              ? context.colorScheme.primary
              : context.colorScheme.scrim.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20.r),
          border: isSelected
              ? Border.all(color: context.colorScheme.onPrimary, width: 1.5.w)
              : null,
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (number != null && number!.isNotEmpty) ...[
                Text(
                  number!,
                  style: context.textTheme.labelSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isSelected
                        ? context.colorScheme.onPrimary
                        : context.colorScheme.scrim,
                  ),
                ),
                SizedBox(width: 6.w),
              ],
              Text(
                text,
                style: context.textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isSelected
                      ? context.colorScheme.onPrimary
                      : context.colorScheme.scrim,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
