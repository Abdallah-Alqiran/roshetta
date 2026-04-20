import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/core/localization/app_localizations.dart';
import 'package:roshetta/core/services/remote/endpoints.dart';
import 'package:roshetta/features/clinic/profile_feature/data/model/profile_clinic_model.dart';
import 'package:roshetta/features/clinic/profile_feature/presentation/bloc/profile_clinic_bloc.dart';
import 'package:roshetta/features/clinic/profile_feature/presentation/bloc/profile_clinic_event.dart';
import 'package:roshetta/features/clinic/profile_feature/presentation/bloc/profile_clinic_state.dart';
import 'package:roshetta/features/widgets/custom_primary_button.dart';
import 'package:roshetta/features/widgets/custom_text_form_field.dart';

class ProfileClinicScreen extends StatefulWidget {
  const ProfileClinicScreen({super.key});

  @override
  State<ProfileClinicScreen> createState() => _ProfileClinicScreenState();
}

class _ProfileClinicScreenState extends State<ProfileClinicScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _infoController;
  late final TextEditingController _locationController;
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _priceController;
  late final TextEditingController _dateOfBirthController;
  late final GlobalKey<FormState> _formKey;
  
  String? _selectedDepartment;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _infoController = TextEditingController();
    _locationController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _priceController = TextEditingController();
    _dateOfBirthController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _selectedDepartment = null;

    
    context.read<ProfileClinicBloc>().add(GetProfileClinicEvent());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _infoController.dispose();
    _locationController.dispose();
    _phoneNumberController.dispose();
    _priceController.dispose();
    _dateOfBirthController.dispose();
    super.dispose();
  }

  void _populateForm(ProfileClinicModel profile) {
    _nameController.text = profile.name;
    _infoController.text = profile.info;
    _selectedDepartment = Constants.allDepartments.contains(profile.department)
        ? profile.department
        : null;
    _locationController.text = profile.location;
    _phoneNumberController.text = profile.phoneNumber;
    _priceController.text = profile.price.toString();
    _dateOfBirthController.text = profile.dateOfBirth;
  }

  void _saveProfile() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState?.validate() ?? false) {
      final updatedProfile = ProfileClinicModel(
        doctorId: '',
        name: _nameController.text.trim(),
        info: _infoController.text.trim(),
        department: _selectedDepartment ?? '',
        location: _locationController.text.trim(),
        phoneNumber: _phoneNumberController.text.trim(),
        price: double.parse(_priceController.text.trim()),
        dateOfBirth: _dateOfBirthController.text.trim(),
      );

      context.read<ProfileClinicBloc>().add(
            UpdateProfileClinicEvent(profile: updatedProfile),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: BlocListener<ProfileClinicBloc, ProfileClinicState>(
        listener: (context, state) {
          if (state is ProfileClinicLoaded) {
            _populateForm(state.profile);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(context.tr('profile_updated_successfully')),
                backgroundColor: context.colorScheme.primary,
                duration: const Duration(seconds: 2),
              ),
            );
          } else if (state is ProfileClinicError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: context.colorScheme.error,
                duration: const Duration(seconds: 3),
              ),
            );
          }
        },
        child: SafeArea(
          child: BlocBuilder<ProfileClinicBloc, ProfileClinicState>(
            builder: (context, state) {
              if (state is ProfileClinicLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: context.colorScheme.primary,
                  ),
                );
              }

              if (state is ProfileClinicError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: context.colorScheme.error,
                        size: 48.sp,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        state.message,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: context.colorScheme.error,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      CustomPrimaryButton(
                        text: context.tr('retry'),
                        onTap: () {
                          context
                              .read<ProfileClinicBloc>()
                              .add(GetProfileClinicEvent());
                        },
                        width: 150.w,
                      ),
                    ],
                  ),
                );
              }

              return SingleChildScrollView(
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
                            border: Border.all(
                              color: context.colorScheme.outlineVariant,
                              width: 1.w,
                            ),
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
                              
                              CustomTextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _nameController,
                                txt: context.tr('clinic_name'),
                                hint: context.tr('enter_clinic_name'),
                                prefixIcon: Icons.person_outline,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return context.tr('please_enter_clinic_name');
                                  }
                                  return null;
                                },
                                w: double.infinity,
                              ),
                              SizedBox(height: 16.h),
                              
                              CustomTextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _phoneNumberController,
                                txt: context.tr('phone_number'),
                                hint: context.tr('enter_phone_number'),
                                prefixIcon: Icons.phone_outlined,
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return context
                                        .tr('please_enter_phone_number');
                                  }
                                  return null;
                                },
                                w: double.infinity,
                              ),
                              SizedBox(height: 16.h),
                              
                              CustomTextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _dateOfBirthController,
                                txt: context.tr('date_of_birth'),
                                hint: context.tr('yyyy_mm_dd'),
                                prefixIcon: Icons.calendar_today_outlined,
                                readOnly: true,
                                onTap: () async {
                                  final DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime.now(),
                                  );
                                  if (picked != null) {
                                    _dateOfBirthController.text =
                                        "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
                                  }
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return context.tr('please_enter_date_of_birth');
                                  }
                                  return null;
                                },
                                w: double.infinity,
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
                            border: Border.all(
                              color: context.colorScheme.outlineVariant,
                              width: 1.w,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.tr('professional_information'),
                                style: context.textTheme.titleLarge!.copyWith(
                                  color: context.colorScheme.onSurface,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 24.h),
                              DropdownButtonFormField<String>(
                                value: _selectedDepartment,
                                isExpanded: true,
                                decoration: InputDecoration(
                                  labelText: context.tr('department'),
                                  hintText: context.tr('enter_department'),
                                  prefixIcon: Icon(Icons.business_center_outlined),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                    borderSide: BorderSide(
                                      color: context.colorScheme.outlineVariant,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                    borderSide: BorderSide(
                                      color: context.colorScheme.primary,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                                ),
                                items: Constants.allDepartments
                                    .map((department) => DropdownMenuItem<String>(
                                          value: department,
                                          child: Text(department),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedDepartment = value;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return context.tr('please_enter_department');
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16.h),
                              
                              CustomTextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
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
                              SizedBox(height: 16.h),
                              
                              CustomTextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _priceController,
                                txt: context.tr('consultation_price'),
                                hint: context.tr('enter_price'),
                                prefixIcon: Icons.attach_money_outlined,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return context.tr('please_enter_price');
                                  }
                                  if (double.tryParse(value) == null) {
                                    return context.tr('please_enter_valid_price');
                                  }
                                  return null;
                                },
                                w: double.infinity,
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
                            border: Border.all(
                              color: context.colorScheme.outlineVariant,
                              width: 1.w,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.tr('bio_and_description'),
                                style: context.textTheme.titleLarge!.copyWith(
                                  color: context.colorScheme.onSurface,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 24.h),
                              
                              CustomTextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _infoController,
                                txt: context.tr('bio'),
                                hint: context.tr('enter_bio'),
                                prefixIcon: Icons.description_outlined,
                                maxLines: 5,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return context.tr('please_enter_bio');
                                  }
                                  return null;
                                },
                                w: double.infinity,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 32.h),
                        
                        BlocBuilder<ProfileClinicBloc, ProfileClinicState>(
                          builder: (context, state) {
                            final isLoading = state is ProfileClinicLoading;
                            return CustomPrimaryButton(
                              text: isLoading
                                  ? context.tr('saving')
                                  : context.tr('save_profile'),
                              onTap: isLoading ? null : _saveProfile,
                              width: double.infinity,
                            );
                          },
                        ),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}