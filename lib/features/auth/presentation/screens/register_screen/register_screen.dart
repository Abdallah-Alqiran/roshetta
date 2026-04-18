import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/core/routing/app_routes.dart';
import 'package:roshetta/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:roshetta/features/auth/presentation/screens/widgets/auth_toggle_switch.dart';
import 'package:roshetta/features/auth/utils/auth_validator.dart';
import 'package:roshetta/features/widgets/custom_primary_button.dart';
import 'package:roshetta/features/widgets/custom_text_form_field.dart';
import 'package:roshetta/features/widgets/custom_radio_button.dart';
import 'package:roshetta/core/localization/app_localizations.dart';
import 'package:roshetta/core/utils/get_responsive_size.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}


class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          
          
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: context.colorScheme.error,
            ),
          );
        }
      },
      child: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: context.isDesktop ? 80.w : context.isTablet ? 48.w : 36.w,
            vertical: context.isDesktop ? 80.h : context.isTablet ? 48.h : 56.h,
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
              key: authBloc.registerFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    context.tr('join_medical_platform'),
                    style: context.textTheme.displaySmall!.copyWith(
                      color: context.colorScheme.onSurface,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    context.tr('access_healthcare_services'),
                    style: context.textTheme.bodyLarge!.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(height: 48.h),

                  const AuthToggleSwitch(isLogin: false),

                  SizedBox(height: 32.h),
                  CustomTextFormField(
                    controller: authBloc.firstNameController,
                    txt: context.tr('name'),
                    hint: context.tr('name'),
                    prefixIcon: Icons.person_outline_rounded,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.tr('please_enter_name');
                      }
                      return validateName(value);
                    },
                    w: double.infinity,
                  ),

                  SizedBox(height: 16.h),
                  CustomTextFormField(
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
                    keyboardType: TextInputType.emailAddress,
                    w: double.infinity,
                  ),

                  SizedBox(height: 16.h),
                  CustomTextFormField(
                    controller: authBloc.passwordController,
                    txt: context.tr('password'),
                    hint: context.tr('password_hint'),
                    isPassword: true,
                    prefixIcon: Icons.lock_outline_rounded,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.tr('please_enter_password');
                      }
                      return validatePassword(value);
                    },
                    w: double.infinity,
                  ),

                  SizedBox(height: 16.h),
                  CustomTextFormField(
                    controller: authBloc.confirmPasswordController,
                    txt: context.tr('confirm_password'),
                    hint: context.tr('confirm_password'),
                    isPassword: true,
                    prefixIcon: Icons.lock_outline_rounded,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.tr('please_confirm_password');
                      }
                      if (value != authBloc.passwordController.text) {
                        return context.tr('passwords_do_not_match');
                      }
                      return null;
                    },
                    w: double.infinity,
                  ),
                  
                  SizedBox(height: 16.h),
                  CustomTextFormField(
                    controller: authBloc.phoneController,
                    txt: context.tr('phone_number'),
                    hint: context.tr('phone_number'),
                    prefixIcon: Icons.phone_android_outlined,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.tr('please_enter_phone');
                      }
                      return null;
                    },
                    w: double.infinity,
                  ),

                  SizedBox(height: 16.h),
                  CustomTextFormField(
                    controller: _dateController,
                    txt: context.tr('birth_date'),
                    hint: context.tr('birth_date'),
                    prefixIcon: Icons.calendar_today,
                    readOnly: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.tr('please_enter_birth_date');
                      }
                      return null;
                    },
                    onTap: () async {
                      FocusScope.of(context).unfocus();
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        _dateController.text = "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
                      }
                    },
                    w: double.infinity,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    context.tr('gender'),
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  CustomRadioButton<String>(
                    initialValue: authBloc.selectedGender,
                    onChanged: (value) {
                      context.read<AuthBloc>().add(GenderSelectedEvent(value!));
                    },
                    items: [
                      CustomRadioItem(value: 'male', label: context.tr('male')),
                      CustomRadioItem(value: 'female', label: context.tr('female')),
                    ],
                  ),

                  SizedBox(height: 24.h),
                  Text(
                    context.tr('account_type'),
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  CustomRadioButton<String>(
                    initialValue: authBloc.selectedRole,
                    onChanged: (value) {
                      context.read<AuthBloc>().add(RoleSelectedEvent(value!));
                    },
                    items: [
                      CustomRadioItem(value: 'patient', label: context.tr('patient')),
                      CustomRadioItem(value: 'clinic', label: context.tr('clinic')),
                    ],
                  ),
       
                  SizedBox(height: 32.h),

                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      final isLoading = state is AuthLoading;

                      return CustomPrimaryButton(
                        text: isLoading
                            ? context.tr('creating_account')
                            : context.tr('create_account'),
                        onTap: isLoading
                            ? null
                            : () {
                                FocusScope.of(context).unfocus();
                                if (authBloc.registerFormKey.currentState?.validate() ?? false) {
                                  context.read<AuthBloc>().add(RegisterEvent());
                                }
                              },
                        width: double.infinity,
                      );
                    },
                  ),

                  SizedBox(height: 24.h),

                  Center(
                    child: GestureDetector(
                      onTap: () {
                        context.go(AppRoutes.loginScreen);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: context.tr('already_have_account'),
                          style: context.textTheme.bodyMedium,
                          children: [
                            TextSpan(
                              text: context.tr('sign_in'),
                              style: TextStyle(
                                color: context.colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}