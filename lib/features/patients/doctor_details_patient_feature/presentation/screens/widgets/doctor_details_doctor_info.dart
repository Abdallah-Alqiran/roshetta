import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/core/localization/app_localizations.dart';
import 'package:roshetta/features/patients/doctor_details_patient_feature/presentation/screens/widgets/doctor_details_date_picker.dart';
import 'package:roshetta/features/patients/home_patients_feature/data/models/home_doctor_model.dart';

class DoctorDetailsDoctorInfo extends StatelessWidget {
  final HomeDoctorModel doctorData;
  final int selectedDateIndex;
  final List<Map<String, String>> dates;
  final ValueChanged<int> onDateSelected;

  const DoctorDetailsDoctorInfo({
    super.key,
    required this.doctorData,
    required this.selectedDateIndex,
    required this.dates,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          doctorData.name,
          style: context.textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          doctorData.department,
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colorScheme.primary,
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: context.colorScheme.onSurface.withValues(alpha: 0.6),
              size: 20.r,
            ),
            SizedBox(width: 4.w),
            Text(
              doctorData.location,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
        SizedBox(height: 30.h),
        Text(
          doctorData.info,
          style: context.textTheme.bodyLarge?.copyWith(
            height: 1.8,
            color: context.colorScheme.onSurface.withValues(alpha: 0.8),
          ),
        ),
        SizedBox(height: 90.h),
        Text(
          context.tr('choose_visit_date'),
          style: context.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 24.h),
        DoctorDetailsDatePicker(
          dates: dates,
          selectedIndex: selectedDateIndex,
          onDateSelected: onDateSelected,
        ),
      ],
    );
  }
}
