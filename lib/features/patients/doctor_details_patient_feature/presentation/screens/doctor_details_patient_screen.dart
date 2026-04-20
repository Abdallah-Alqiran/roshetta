import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/core/localization/app_localizations.dart';
import 'package:roshetta/core/utils/get_responsive_size.dart';
import 'package:roshetta/features/patients/doctor_details_patient_feature/presentation/screens/widgets/doctor_details_back_row.dart';
import 'package:roshetta/features/patients/doctor_details_patient_feature/presentation/screens/widgets/doctor_details_booking_summary.dart';
import 'package:roshetta/features/patients/doctor_details_patient_feature/presentation/screens/widgets/doctor_details_doctor_info.dart';

class DoctorDetailsPatientScreen extends StatefulWidget {
  const DoctorDetailsPatientScreen({super.key});

  @override
  State<DoctorDetailsPatientScreen> createState() =>
      _DoctorDetailsPatientScreenState();
}

class _DoctorDetailsPatientScreenState
    extends State<DoctorDetailsPatientScreen> {
  int _selectedDateIndex = 4;

  final List<Map<String, String>> _dates = [
    {'dayName': 'الخميس', 'dayNumber': '16', 'month': 'أكتوبر'},
    {'dayName': 'الأربعاء', 'dayNumber': '15', 'month': 'أكتوبر'},
    {'dayName': 'الثلاثاء', 'dayNumber': '14', 'month': 'أكتوبر'},
    {'dayName': 'الاثنين', 'dayNumber': '13', 'month': 'أكتوبر'},
    {'dayName': 'الأحد', 'dayNumber': '12', 'month': 'أكتوبر'},
    {'dayName': 'السبت', 'dayNumber': '11', 'month': 'أكتوبر'},
    {'dayName': 'الجمعة', 'dayNumber': '10', 'month': 'أكتوبر'},
  ];

  void _showBookingConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: context.colorScheme.onSecondary.withValues(
            alpha: 0.95,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 60.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  context.tr('people_before_you'),
                  style: context.textTheme.headlineMedium?.copyWith(
                    color: context.colorScheme.surface,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                Text(
                  context.tr('expected_time_for_checkup'),
                  style: context.textTheme.headlineMedium?.copyWith(
                    color: context.colorScheme.surface,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DoctorDetailsBackRow(),
                  SizedBox(height: 24.h),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 48.h),
                        child: context.isMobile
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  DoctorDetailsDoctorInfo(
                                    dates: _dates,
                                    selectedDateIndex: _selectedDateIndex,
                                    onDateSelected: (index) {
                                      setState(() {
                                        _selectedDateIndex = index;
                                      });
                                    },
                                  ),
                                  SizedBox(height: 48.h),
                                  DoctorDetailsBookingSummary(
                                    onConfirm: _showBookingConfirmationDialog,
                                  ),
                                ],
                              )
                            : Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: DoctorDetailsDoctorInfo(
                                      dates: _dates,
                                      selectedDateIndex: _selectedDateIndex,
                                      onDateSelected: (index) {
                                        setState(() {
                                          _selectedDateIndex = index;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 100.w),
                                  Expanded(
                                    flex: 2,
                                    child: DoctorDetailsBookingSummary(
                                      onConfirm: _showBookingConfirmationDialog,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
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
