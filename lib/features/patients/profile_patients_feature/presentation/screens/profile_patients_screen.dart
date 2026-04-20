import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/core/utils/get_responsive_size.dart';
import 'package:roshetta/features/patients/profile_patients_feature/presentation/screens/widgets/profile_card.dart';
import 'package:roshetta/features/patients/profile_patients_feature/presentation/screens/widgets/profile_details_section.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roshetta/features/patients/profile_patients_feature/presentation/bloc/profile_patient_bloc.dart';
import 'package:roshetta/features/patients/profile_patients_feature/presentation/bloc/profile_patient_event.dart';
import 'package:roshetta/features/patients/profile_patients_feature/presentation/bloc/profile_patient_state.dart';

class ProfilePatientsScreen extends StatefulWidget {
  const ProfilePatientsScreen({super.key});

  @override
  State<ProfilePatientsScreen> createState() => _ProfilePatientsScreenState();
}

class _ProfilePatientsScreenState extends State<ProfilePatientsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfilePatientBloc>().add(GetProfilePatientEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      body: BlocBuilder<ProfilePatientBloc, ProfilePatientState>(
        builder: (context, state) {
          if (state is ProfilePatientLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfilePatientLoaded) {
            final patientData = state.profile;
            return SingleChildScrollView(
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
                          child: ProfileCard(fullName: patientData.name),
                        ),
                        SizedBox(width: 60.w),
                        Expanded(
                          flex: 2,
                          child: ProfileDetailsSection(
                            fullName: patientData.name,
                            phone: patientData.phoneNumber,
                            birthDate: patientData.dateOfBirth,
                            gender: patientData.gender,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: ProfileCard(fullName: patientData.name)),
                        SizedBox(height: 40.h),
                        ProfileDetailsSection(
                          fullName: patientData.name,
                          phone: patientData.phoneNumber,
                          birthDate: patientData.dateOfBirth,
                          gender: patientData.gender,
                        ),
                      ],
                    ),
            );
          } else if (state is ProfilePatientError) {
            return Center(
              child: Text(
                state.message,
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.colorScheme.error,
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
