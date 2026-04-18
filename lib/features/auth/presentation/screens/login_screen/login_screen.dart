import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/localization/app_localizations.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/features/auth/utils/auth_validator.dart';
import 'package:roshetta/features/widgets/custom_primary_button.dart';
import 'package:roshetta/features/widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400.w),
            child: Form(
              key: _formKey,
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

                  CustomTextFormField(
                    controller: emailController,
                    txt: context.tr('email_address'),
                    hint: context.tr('email_hint'),
                    prefixIcon: Icons.alternate_email_rounded,
                    validator: validateEmail,
                    w: 400.w,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextFormField(
                    controller: passwordController,
                    txt: context.tr('password'),
                    hint: context.tr('password_hint'),
                    prefixIcon: Icons.lock_outline_rounded,
                    isPassword: true,
                    validator: validatePassword,
                    w: 400.w,
                  ),
                  SizedBox(height: 32.h),
                  CustomPrimaryButton(
                    text: context.tr('sign_in'),
                    onTap: () {
                      if (_formKey.currentState?.validate() ?? false) {}
                    },
                    width: 400.w,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
