import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/features/widgets/search_bar.dart';

class SharedClinicAppBar extends StatelessWidget {
  final TextEditingController? searchController;
  final VoidCallback? onLogout;
  final VoidCallback? onSettings;
  final VoidCallback? onProfile;

  const SharedClinicAppBar({
    super.key,
    this.searchController,
    this.onLogout,
    this.onSettings,
    this.onProfile,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController effectiveController =
        searchController ?? TextEditingController();

    return Row(
      children: [
        // Clinic Title
        Text(
          "نظام إدارة العيادة",
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        // Action Icons and Search
        _buildIconAction(
          context,
          Icons.logout_outlined,
          onPressed: onLogout ?? () {},
        ),
        SizedBox(width: 8.w),
        _buildIconAction(
          context,
          Icons.settings_outlined,
          onPressed: onSettings ?? () {},
        ),

        SizedBox(width: 16.w),
        // Polished Search Bar
        CustomSearchBarr(
          hint: "البحث عن مريض...",
          controller: effectiveController,
          prefixIcon: Icons.search,
          w: 240.w,
          h: 40.h,
          r: 20.r,
          fillColor: Colors.grey[100],
          color: Colors.grey[300],
        ),
        SizedBox(width: 16.w),
        _buildIconAction(
          context,
          Icons.person_outline,
          onPressed: onProfile ?? () {},
          isActive: true,
        ),
      ],
    );
  }

  Widget _buildIconAction(
    BuildContext context,
    IconData icon, {
    required VoidCallback onPressed,
    bool isActive = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isActive
            ? context.colorScheme.primary.withValues(alpha: 0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: IconButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(minWidth: 36.w, minHeight: 36.w),
        icon: Icon(
          icon,
          color: context.colorScheme.scrim.withValues(alpha: 0.7),
          size: 22.sp,
        ),
      ),
    );
  }
}
