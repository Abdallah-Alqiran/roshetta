import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:roshetta/core/localization/app_localizations.dart';
import 'package:roshetta/core/routing/app_routes.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/core/utils/get_responsive_size.dart';
import 'package:roshetta/features/auth/presentation/bloc/auth_bloc.dart';

class AuthToggleSwitch extends StatelessWidget {
  final bool isLogin;
  const AuthToggleSwitch({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.responsiveValue(
        mobile: 64.h,
        tablet: 70.h,
        desktop: 76.h,
      ),
      padding: EdgeInsets.all(
        context.responsiveValue(
          mobile: 4.w,
          tablet: 5.w,
          desktop: 6.w,
        ),
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceVariant.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(
          context.responsiveValue(
            mobile: 10.r,
            tablet: 12.r,
            desktop: 14.r,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildTab(
              context,
              context.tr('sign_in'),
              isActive: isLogin,
            ),
          ),
          SizedBox(width: context.responsiveValue(mobile: 8.w, tablet: 10.w, desktop: 12.w)),
          Expanded(
            child: _buildTab(
              context,
              context.tr('create_account'),
              isActive: !isLogin,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(
    BuildContext context,
    String label, {
    required bool isActive,
  }) {
    final fontSize = getResponsiveSize(
      context: context,
      mobileSize: 20,
      tabletSize: 25,
      webSize: 30,
    );
    
    return GestureDetector(
      onTap: () {
        if (!isActive) {
          final authBloc = BlocProvider.of<AuthBloc>(context);
          if (label == context.tr('sign_in')) {
            authBloc.clearRegisterControllers();
            context.go(AppRoutes.loginScreen);
          } else {
            authBloc.clearLoginControllers();
            context.go(AppRoutes.registerScreen);
          }
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: context.responsiveValue(mobile: 16.w, tablet: 20.w, desktop: 24.w),
          vertical: context.responsiveValue(mobile: 8.h, tablet: 10.h, desktop: 12.h),
        ),
        decoration: BoxDecoration(
          color: isActive ? context.colorScheme.surface : Colors.transparent,
          borderRadius: BorderRadius.circular(
            context.responsiveValue(
              mobile: 8.r,
              tablet: 10.r,
              desktop: 12.r,
            ),
          ),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: context.colorScheme.primary.withValues(alpha: 0.1),
                    blurRadius: context.responsiveValue(
                      mobile: 8,
                      tablet: 10,
                      desktop: 12,
                    ),
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            label,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
              fontSize: fontSize,
              color: isActive
                  ? context.colorScheme.primary
                  : context.colorScheme.onSurfaceVariant,
            ),
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}