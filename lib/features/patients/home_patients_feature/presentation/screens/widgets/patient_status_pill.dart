import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';

class PatientStatusPill extends StatelessWidget {
  final String status;

  const PatientStatusPill({super.key, required this.status});

  Color _getBackgroundColor(BuildContext context) {
    switch (status) {
      case 'مستقر':
        return Colors.teal.shade50;
      case 'متابعة ضرورية':
        return Colors.red.shade50;
      case 'قيد العلاج':
        return Colors.blue.shade50;
      default:
        return Colors.grey.shade100;
    }
  }

  Color _getTextColor(BuildContext context) {
    switch (status) {
      case 'مستقر':
        return Colors.teal.shade800;
      case 'متابعة ضرورية':
        return Colors.red.shade800;
      case 'قيد العلاج':
        return Colors.blue.shade800;
      default:
        return Colors.black87;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: _getBackgroundColor(context),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          status,
          style: context.textTheme.labelMedium?.copyWith(
            color: _getTextColor(context),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
