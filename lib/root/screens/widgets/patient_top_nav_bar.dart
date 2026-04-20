import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/core/localization/app_localizations.dart';
import 'package:roshetta/core/utils/get_responsive_size.dart';
import 'package:roshetta/root/models/nav_items.dart';

class PatientTopNavBar extends StatelessWidget {
  final List<NavItemModel> navItems;
  final int currentIndex;
  final ValueChanged<int> onItemSelected;

  const PatientTopNavBar({
    super.key,
    required this.navItems,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = context.isDesktop;

    final double horizontalPadding = getResponsiveSize(
      context: context,
      mobileSize: 16,
      tabletSize: 40,
      webSize: 80,
    );

    final double navBarHeight = getResponsiveSize(
      context: context,
      mobileSize: 60,
      tabletSize: 70,
      webSize: 80,
    );

    return Container(
      height: navBarHeight.h,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
      decoration: BoxDecoration(
        color: context.colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.onSurface.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            context.tr('roshetta'),
            style: TextStyle(
              fontSize: getResponsiveSize(
                context: context,
                mobileSize: 18,
                webSize: 24,
              ),
              color: context.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),

          if (isDesktop) const Spacer(),

          Expanded(
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: navItems.map((item) {
                    final bool isActive = currentIndex == item.index;
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getResponsiveSize(
                          context: context,
                          mobileSize: 8,
                          tabletSize: 12,
                          webSize: 20,
                        ).w,
                      ),
                      child: InkWell(
                        onTap: () => onItemSelected(item.index),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item.label,
                              style: context.textTheme.titleMedium?.copyWith(
                                fontSize: getResponsiveSize(
                                  context: context,
                                  mobileSize: 12,
                                  webSize: 16,
                                ),
                                color: isActive
                                    ? context.colorScheme.primary
                                    : context.colorScheme.onSurface.withValues(
                                        alpha: 0.6,
                                      ),
                                fontWeight: isActive
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                            if (isActive)
                              Container(
                                margin: EdgeInsets.only(top: 4.h),
                                height: 2.h,
                                width: getResponsiveSize(
                                  context: context,
                                  mobileSize: 15,
                                  webSize: 30,
                                ).w,
                                color: context.colorScheme.primary,
                              ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),

          if (isDesktop) const Spacer(),

          CircleAvatar(
            radius: getResponsiveSize(
              context: context,
              mobileSize: 14,
              webSize: 20,
            ).r,
            backgroundColor: context.colorScheme.primary.withValues(alpha: 0.1),
            child: Icon(
              Icons.person_outline,
              size: getResponsiveSize(
                context: context,
                mobileSize: 16,
                webSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
