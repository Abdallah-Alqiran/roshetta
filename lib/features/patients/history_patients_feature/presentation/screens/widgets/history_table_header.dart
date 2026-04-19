import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/core/localization/app_localizations.dart';

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
              context.tr('doctor_and_specialization'),
              style: context.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.scrim.withValues(alpha: 0.6),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              context.tr('date'),
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
              context.tr('time'),
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
              context.tr('status'),
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
              context.tr('actions'),
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
