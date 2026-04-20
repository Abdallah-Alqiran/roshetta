import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/core/localization/app_localizations.dart';
import 'package:roshetta/features/widgets/custom_primary_button.dart';

class DoctorDetailsBookingSummary extends StatelessWidget {
  final VoidCallback onConfirm;
  final String bookingDate;
  final String price;
  final String serviceType;
  final bool isLoading;
  final bool isSuccess;

  const DoctorDetailsBookingSummary({
    super.key,
    required this.onConfirm,
    required this.bookingDate,
    required this.price,
    required this.serviceType,
    this.isLoading = false,
    this.isSuccess = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.r),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              context.tr('booking_summary'),
              style: context.textTheme.titleLarge?.copyWith(
                color: context.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 32.h),
          _SummaryRow(
            title: context.tr('service_type'),
            value: serviceType,
            isBold: true,
          ),
          SizedBox(height: 24.h),
          _SummaryRow(title: context.tr('date'), value: bookingDate),
          SizedBox(height: 24.h),
          _SummaryRow(
            title: context.tr('checkup_fee'),
            value: '$price جم',
            valueColor: context.colorScheme.primary,
            isBold: true,
          ),
          SizedBox(height: 70.h),
          if (!isSuccess)
            CustomPrimaryButton(
              width: double.infinity,
              height: 54.h,
              onTap: isLoading ? null : onConfirm,
              text: isLoading ? 'Loading...' : context.tr('confirm_booking_now'),
              textStyle: context.textTheme.titleMedium?.copyWith(
                color: context.colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                elevation: 0,
              ),
            )
          else
            Container(
              width: double.infinity,
              height: 54.h,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check_circle, color: Colors.white),
                  SizedBox(width: 12.w),
                  Text(
                    'تم تأكيد الحجز',
                    style: context.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          SizedBox(height: 16.h),
          Text(
            context.tr('booking_terms_agree'),
            style: context.textTheme.bodySmall?.copyWith(
              fontSize: 10.sp,
              color: context.colorScheme.onSurface.withValues(alpha: 0.6),
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String title;
  final String value;
  final bool isBold;
  final Color? valueColor;

  const _SummaryRow({
    required this.title,
    required this.value,
    this.isBold = false,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
        Text(
          value,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            color: valueColor ?? context.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
