import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/core/theme/app_theme.dart';
import 'package:roshetta/features/widgets/search_bar.dart';

class SharedClinicAppBar extends StatelessWidget {
  final TextEditingController? searchController;
  final String? searchHint;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onSettingsTap;
  final VoidCallback? onLogoutTap;

  const SharedClinicAppBar({
    super.key,
    this.searchController,
    this.searchHint,
    this.onNotificationTap,
    this.onSettingsTap,
    this.onLogoutTap,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    final controller = searchController ?? TextEditingController();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Title
          Text(
            "نظام إدارة العيادة",
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const Spacer(),
          // Search Bar
          CustomSearchBarr(
            hint: searchHint ?? "البحث عن مريض...",
            controller: controller,
            prefixIcon: Icons.search_rounded,
            w: 350.w,
            h: 48.h,
            r: 12.r,
            color: Colors.transparent, // We'll handle coloring in search_bar.dart or via hint
          ),
          SizedBox(width: 32.w),
          // Action Icons
          _buildActionButton(
            context,
            icon: Icons.notifications_none_rounded,
            onTap: onNotificationTap,
            backgroundColor: customColors?.iconTransparent,
          ),
          SizedBox(width: 12.w),
          _buildActionButton(
            context,
            icon: Icons.settings_outlined,
            onTap: onSettingsTap,
            backgroundColor: customColors?.iconTransparent,
          ),
          SizedBox(width: 12.w),
          _buildActionButton(
            context,
            icon: Icons.logout_rounded,
            onTap: onLogoutTap,
            backgroundColor: Colors.red.withValues(alpha: 0.05),
            iconColor: Colors.redAccent,
            isLogout: true,
          ),
          SizedBox(width: 24.w),
          // Profile Section
          _buildProfileSection(context),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    VoidCallback? onTap,
    Color? backgroundColor,
    Color? iconColor,
    bool isLogout = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.grey[100],
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Icon(
          icon,
          color: iconColor ?? context.colorScheme.primary,
          size: 22.sp,
          textDirection: isLogout ? TextDirection.ltr : null,
        ),
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "د/ أحمد محمد",
              style: context.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Text(
              "مسؤول العيادة",
              style: context.textTheme.labelSmall?.copyWith(
                color: Colors.grey,
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
        SizedBox(width: 12.w),
        Container(
          width: 44.w,
          height: 44.w,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: context.colorScheme.primary.withValues(alpha: 0.2),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              "أ",
              style: TextStyle(
                color: context.colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
