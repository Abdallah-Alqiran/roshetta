import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/core/localization/app_localizations.dart';
import 'package:roshetta/core/routing/app_routes.dart';
import 'package:roshetta/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:roshetta/root/models/nav_items.dart';

class AdminSidebar extends StatelessWidget {
  final List<NavItemModel> navItems;
  final int selectedIndex;
  final Function(int) onItemTap;

  const AdminSidebar({
    super.key,
    required this.navItems,
    required this.selectedIndex,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.w,
      color: const Color(0xFFE5E5E5),
      child: Column(
        children: [
          SizedBox(height: 32.h),
          InkWell(
            onTap: () {
              context.read<AuthBloc>().add(LogoutEvent());
              context.go(AppRoutes.loginScreen);
            },
            child: CircleAvatar(
              radius: 36.r,
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 48.sp, color: Colors.teal),
            ),
          ),
          SizedBox(height: 12.h),

          Text(
            'عيادة الشفاء',
            style: context.textTheme.titleMedium?.copyWith(
              color: Colors.teal[800],
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.h),
          Text(
            'د. أحمد علي',
            style: context.textTheme.bodySmall?.copyWith(
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: navItems.map((item) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
                  child: ResponsiveNavItem(
                    icon: item.icon,
                    label: item.label,
                    index: item.index,
                    isSelected: selectedIndex == item.index,
                    onTap: () => onItemTap(item.index),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}

class ResponsiveNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const ResponsiveNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        color: isSelected
            ? context.colorScheme.primary.withValues(alpha: 0.1)
            : Colors.transparent,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14.r),
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: isSelected
                      ? context.colorScheme.primary
                      : context.colorScheme.onSurface.withValues(alpha: 0.5),
                  size: 22.sp,
                ),
                SizedBox(width: 12.w),
                Flexible(
                  child: Text(
                    context.tr(label),
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: isSelected
                          ? context.colorScheme.primary
                          : context.colorScheme.onSurface.withValues(
                              alpha: 0.7,
                            ),
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AdminProfileWidget extends StatelessWidget {
  const AdminProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceVariant.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundColor: context.colorScheme.primary,
            child: Icon(
              Icons.person,
              color: context.colorScheme.onPrimary,
              size: 22.sp,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: InkWell(
              onTap: () => context.push(AppRoutes.loginScreen),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Admin User',
                    style: context.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'admin@lms.com',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onSurface.withValues(
                        alpha: 0.5,
                      ),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
