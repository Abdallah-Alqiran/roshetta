import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';

class CustomTodaySummary extends StatelessWidget {
  final int newRequests;
  final int confirmed;
  final int available;

  const CustomTodaySummary({
    super.key,
    required this.newRequests,
    required this.confirmed,
    required this.available,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'ملخص اليوم',
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12.h),
          _row('طلبات جديدة', newRequests, Colors.teal),
          SizedBox(height: 8.h),
          _row('تم تأكيدها', confirmed, Colors.blue),
          SizedBox(height: 8.h),
          _row('المواعيد المتاحة', available, Colors.black87),
        ],
      ),
    );
  }

  Widget _row(String label, int value, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 14.sp)),
        Text(
          value.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
            color: color,
          ),
        ),
      ],
    );
  }
}
