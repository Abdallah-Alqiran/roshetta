import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/localization/app_localizations.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/core/utils/get_responsive_size.dart';
import 'package:roshetta/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:roshetta/features/auth/presentation/screens/widgets/auth_toggle_switch.dart';
import 'package:roshetta/features/auth/utils/auth_validator.dart';
import 'package:roshetta/features/widgets/custom_primary_button.dart';
import 'package:roshetta/features/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();

    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: context.isDesktop ? 80.w : context.isTablet ? 48.w : 24.w,
          vertical: context.isDesktop ? 80.h : context.isTablet ? 48.h : 32.h,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: context.isDesktop
                ? 500.w
                : context.isTablet
                    ? 450.w
                    : 400.w,
          ),
          child: Form(
            key: authBloc.loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  context.tr('welcome_back'),
                  style: context.textTheme.headlineMedium!.copyWith(
                    color: context.colorScheme.onSurface,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  context.tr('good_to_see_you_again'),
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
                SizedBox(height: 48.h),
                const AuthToggleSwitch(isLogin: true),
                SizedBox(height: 32.h),
                CustomTextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: authBloc.emailController,
                  txt: context.tr('email_address'),
                  hint: context.tr('email_hint'),
                  prefixIcon: Icons.alternate_email_rounded,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.tr('please_enter_email');
                    }
                    return validateEmail(value);
                  },
                  w: double.infinity,
                ),
                SizedBox(height: 16.h),
                CustomTextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: authBloc.passwordController,
                  txt: context.tr('password'),
                  hint: context.tr('password_hint'),
                  prefixIcon: Icons.lock_outline_rounded,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.tr('please_enter_password');
                    }
                    return validatePassword(value);
                  },
                  w: double.infinity,
                ),
                SizedBox(height: 32.h),
                CustomPrimaryButton(
                  text: context.tr('sign_in'),
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    if (authBloc.loginFormKey.currentState?.validate() ?? false) {
                      // Proceed with login
                    }
                  },
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
