import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/features/widgets/custom_primary_button.dart';

class CustomRequestWidget extends StatelessWidget {
  final int orderNumber;
  final String name;
  final String time;
  final String phone;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  CustomRequestWidget({
    Key? key,
    required this.orderNumber,
    required this.name,
    required this.time,
    required this.phone,
    required this.onAccept,
    required this.onReject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 622.w,
      // height: 100.h,
      padding: EdgeInsets.all(16.r),
      margin: EdgeInsets.symmetric(vertical: 8.w),
      decoration: BoxDecoration(
        color: context.colorScheme.scrim.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.grey.shade300,
            child: Text(
              '$orderNumber',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),

                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 16,
                      color: context.colorScheme.scrim,
                    ),
                    SizedBox(width: 4),
                    Text(
                      time,
                      style: context.textTheme.labelMedium!.copyWith(
                        color: context.colorScheme.scrim,
                      ),
                    ),

                    SizedBox(width: 16),

                    Icon(
                      Icons.phone,
                      size: 16,
                      color: context.colorScheme.scrim,
                    ),
                    SizedBox(width: 4),
                    Text(
                      phone,
                      style: TextStyle(color: context.colorScheme.scrim),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(width: 12),

          Row(
            children: [
              CustomPrimaryButton(
                text: 'قبول',
                onTap: onAccept,
                width: 130,
                height: 40,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                suffixIcon: Icon(Icons.check, size: 16),
              ),
              SizedBox(width: 8),
              CustomPrimaryButton(
                text: 'رفض',
                onTap: onReject,
                width: 130,
                height: 40,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  foregroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                suffixIcon: Icon(Icons.close, size: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
