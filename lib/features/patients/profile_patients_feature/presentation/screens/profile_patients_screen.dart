import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';

class ProfilePatientsScreen extends StatelessWidget {
  const ProfilePatientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final patientData = {
      'fullName': 'أحمد محمد السعدني',
      'email': 'ahmed.alsadani@email.com',
      'birthDate': '14/05/1992',
      'phone': '+966 50 123 4567',
      'gender': 'ذكر',
    };

    return Scaffold(
      backgroundColor: context.colorScheme.background,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ملف الشخصي',
              style: context.textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              'Roshetta',
              style: context.textTheme.titleLarge?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
           
            SizedBox(height: 32.h),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'تعديل المعلومات الشخصية',
                      style: context.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'تحكم في خصوصياتك وبياناتك الطبية بسهولة',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    SizedBox(height: 24.h),

                    _buildInfoRow(
                      context,
                      label: 'الاسم الكامل',
                      value: patientData['fullName']!,
                    ),
                    _buildInfoRow(
                      context,
                      label: 'البريد الإلكتروني',
                      value: patientData['email']!,
                    ),
                    SizedBox(height: 16.h),
                    _buildInfoRow(
                      context,
                      label: 'تاريخ الميلاد',
                      value: patientData['birthDate']!,
                    ),
                    _buildInfoRow(
                      context,
                      label: 'رقم الهاتف',
                      value: patientData['phone']!,
                    ),

                    SizedBox(height: 16.h),

                    Text(
                      'الجنس',
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        _buildGenderChip(
                          context,
                          label: 'ذكر',
                          isSelected: patientData['gender'] == 'ذكر',
                        ),
                        SizedBox(width: 16.w),
                        _buildGenderChip(
                          context,
                          label: 'أنثى',
                          isSelected: patientData['gender'] == 'أنثى',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context,
      {required String label, required String value}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          SizedBox(height: 6.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceVariant.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: context.colorScheme.outline.withOpacity(0.2),
              ),
            ),
            child: Text(
              value,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenderChip(BuildContext context,
      {required String label, required bool isSelected}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: isSelected
            ? context.colorScheme.primary.withOpacity(0.1)
            : context.colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(
          color: isSelected
              ? context.colorScheme.primary
              : context.colorScheme.outline.withOpacity(0.3),
        ),
      ),
      child: Text(
        label,
        style: context.textTheme.bodyLarge?.copyWith(
          color: isSelected
              ? context.colorScheme.primary
              : context.colorScheme.onSurfaceVariant,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}