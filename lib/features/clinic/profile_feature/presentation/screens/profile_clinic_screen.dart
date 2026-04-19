import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/core/localization/app_localizations.dart';
import 'package:roshetta/features/widgets/custom_primary_button.dart';
import 'package:roshetta/features/widgets/custom_text_form_field.dart';

class ProfileClinicScreen extends StatefulWidget {
  const ProfileClinicScreen({super.key});

  @override
  State<ProfileClinicScreen> createState() => _ProfileClinicScreenState();
}

class _ProfileClinicScreenState extends State<ProfileClinicScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _bioController = TextEditingController();
  final _locationController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _bioController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.tr('profile_updated_successfully')),
          backgroundColor: context.colorScheme.primary,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.tr('clinic_profile'),
                    style: context.textTheme.displaySmall!.copyWith(
                      color: context.colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    context.tr('manage_clinic_info'),
                    style: context.textTheme.bodyLarge!.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Container(
                    padding: EdgeInsets.all(24.w),
                    decoration: BoxDecoration(
                      color: context.colorScheme.surface,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.tr('basic_information'),
                          style: context.textTheme.titleLarge!.copyWith(
                            color: context.colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          children: [
                            Icon(Icons.business_rounded,
                                color: context.colorScheme.primary),
                            SizedBox(width: 12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context.tr('clinic_name'),
                                  style: context.textTheme.labelSmall!.copyWith(
                                    color: context.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  _nameController.text.isNotEmpty
                                      ? _nameController.text
                                      : context.tr('not_provided'),
                                  style: context.textTheme.bodyMedium!.copyWith(
                                    color: context.colorScheme.onSurface,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Icon(Icons.email_outlined,
                                color: context.colorScheme.primary),
                            SizedBox(width: 12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context.tr('email_address'),
                                  style: context.textTheme.labelSmall!.copyWith(
                                    color: context.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  _emailController.text.isNotEmpty
                                      ? _emailController.text
                                      : context.tr('not_provided'),
                                  style: context.textTheme.bodyMedium!.copyWith(
                                    color: context.colorScheme.onSurface,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Container(
                    padding: EdgeInsets.all(24.w),
                    decoration: BoxDecoration(
                      color: context.colorScheme.surface,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.tr('bio_and_location'),
                          style: context.textTheme.titleLarge!.copyWith(
                            color: context.colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        CustomTextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _bioController,
                          txt: context.tr('bio'),
                          hint: context.tr('enter_bio'),
                          prefixIcon: Icons.description_outlined,
                          maxLines: 4,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return context.tr('please_enter_bio');
                            }
                            return null;
                          },
                          w: double.infinity,
                        ),
                        SizedBox(height: 16.h),
                        CustomTextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _locationController,
                          txt: context.tr('location'),
                          hint: context.tr('enter_location'),
                          prefixIcon: Icons.location_on_outlined,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return context.tr('please_enter_location');
                            }
                            return null;
                          },
                          w: double.infinity,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.h),
                  CustomPrimaryButton(
                    text: context.tr('save_profile'),
                    onTap: _saveProfile,
                    width: double.infinity,
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