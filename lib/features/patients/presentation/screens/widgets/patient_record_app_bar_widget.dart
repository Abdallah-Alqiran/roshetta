import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/features/widgets/search_bar.dart';

class PatientRecordAppBarWidget extends StatelessWidget {
  final TextEditingController searchController;

  const PatientRecordAppBarWidget({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "نظام إدارة العيادة",
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        CustomSearchBarr(
          hint: "بحث عن مريض...",
          controller: searchController,
          prefixIcon: Icons.search,
          w: 300.w,
          h: 45.h,
          r: 30.r,
          color: context.colorScheme.scrim.withValues(alpha: 0.1),
        ),
        SizedBox(width: 24.w),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_none_outlined,
            color: context.colorScheme.scrim,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings_outlined, color: context.colorScheme.scrim),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.logout_outlined,
            color: context.colorScheme.scrim,
            textDirection: TextDirection.ltr, // Assuming arrow points out
          ),
        ),
        SizedBox(width: 16.w),
        Container(
          width: 50.w,
          height: 50.h,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Text(
              "SML",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
