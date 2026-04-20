import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/core/utils/get_responsive_size.dart';
import 'package:roshetta/features/patients/profile_patients_feature/presentation/screens/widgets/profile_card.dart';
import 'package:roshetta/features/patients/profile_patients_feature/presentation/screens/widgets/profile_details_section.dart';

class ProfilePatientsScreen extends StatelessWidget {
  const ProfilePatientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final patientData = {
      'fullName': 'أحمد محمود السعدني',
      'birthDate': '05/14/1992',
      'phone': '01000000000',
      'gender': 'ذكر',
      'id': '98214',    
      };

    return Scaffold(
      backgroundColor: context.colorScheme.background,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: context.isDesktop ? 80.w : 24.w,
          vertical: 50.h,
        ),
        child: context.isDesktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: ProfileCard(
                      fullName: patientData['fullName']!,
                    ),
                  ),
                  SizedBox(width: 60.w),
                  Expanded(
                    flex: 2,
                    child: ProfileDetailsSection(
                      fullName: patientData['fullName']!,
                      phone: patientData['phone']!,
                      birthDate: patientData['birthDate']!,
                      gender: patientData['gender']!,
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ProfileCard(
                      fullName: patientData['fullName']!,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  ProfileDetailsSection(
                    fullName: patientData['fullName']!,
                    phone: patientData['phone']!,
                    birthDate: patientData['birthDate']!,
                    gender: patientData['gender']!,
                  ),
                ],
              ),
      ),
    );
  }
}
