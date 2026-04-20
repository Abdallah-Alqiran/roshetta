import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/core/localization/app_localizations.dart';
import 'package:roshetta/features/patients/profile_patients_feature/presentation/screens/widgets/profile_info_field.dart';

class ProfileDetailsSection extends StatelessWidget {
  final String fullName;
  final String phone;
  final String birthDate;
  final String gender;

  const ProfileDetailsSection({
    super.key,
    required this.fullName,
    required this.phone,
    required this.birthDate,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    final isMale = gender == 'ذكر';

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(32.w),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.onSurface.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr('personal_information'),
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 8.h),
          Divider(
            color: context.colorScheme.outlineVariant.withValues(alpha: 0.2),
            thickness: 1,
          ),
          SizedBox(height: 30.h),
          ProfileInfoField(
            label: context.tr('full_name'),
            value: fullName,
            isBold: true,
          ),
          Divider(
            color: context.colorScheme.outlineVariant.withValues(alpha: 0.1),
          ),
          
          ProfileInfoField(label: context.tr('phone_number'), value: phone),
          Divider(
            color: context.colorScheme.outlineVariant.withValues(alpha: 0.1),
          ),
          ProfileInfoField(label: context.tr('birth_date'), value: birthDate),
          Divider(
            color: context.colorScheme.outlineVariant.withValues(alpha: 0.1),
          ),
          ProfileInfoField(
            label: context.tr('gender'),
            value: isMale ? context.tr('male') : context.tr('female'),
          ),
        ],
      ),
    );
  }
}
