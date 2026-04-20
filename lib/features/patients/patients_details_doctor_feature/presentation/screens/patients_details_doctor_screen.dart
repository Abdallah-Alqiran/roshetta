import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/core/localization/app_localizations.dart';
import 'package:roshetta/features/patients/patients_details_doctor_feature/presentation/screens/widgets/patient_list_item.dart';
import 'package:roshetta/features/patients/patients_details_doctor_feature/presentation/screens/widgets/patient_record_app_bar_widget.dart';
import 'package:roshetta/features/patients/patients_details_doctor_feature/presentation/screens/widgets/patient_statistics_card.dart';
import 'package:roshetta/features/patients/patients_details_doctor_feature/presentation/screens/widgets/patient_table_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roshetta/core/di/service_locator.dart';
import 'package:roshetta/features/patients/patients_details_doctor_feature/presentation/bloc/patient_details_bloc.dart';
import 'package:roshetta/features/patients/patients_details_doctor_feature/presentation/bloc/patient_details_event.dart';
import 'package:roshetta/features/patients/patients_details_doctor_feature/presentation/bloc/patient_details_state.dart';
import 'package:roshetta/features/auth/presentation/bloc/auth_bloc.dart';
// import 'package:roshetta/features/auth/presentation/bloc/auth_event.dart';
import 'package:roshetta/root/bloc/root_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:roshetta/core/routing/app_routes.dart';

class PatientsDetailsDoctorScreen extends StatefulWidget {
  const PatientsDetailsDoctorScreen({super.key});

  @override
  State<PatientsDetailsDoctorScreen> createState() =>
      _PatientsDetailsDoctorScreenState();
}

class _PatientsDetailsDoctorScreenState
    extends State<PatientsDetailsDoctorScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<PatientDetailsBloc>()..add(GetPatientDetailsEvent()),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80.h,
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: PatientRecordAppBarWidget(
              searchController: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              onLogout: () {
                context.read<AuthBloc>().add(LogoutEvent());
                context.go(AppRoutes.loginScreen);
              },
              onProfile: () {
                context.read<RootBloc>().add(ChangeIndexRootEvent(index: 4));
              },
            ),
          ),
        ),
        body: BlocBuilder<PatientDetailsBloc, PatientDetailsState>(
          builder: (context, state) {
            if (state is PatientDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PatientDetailsError) {
              return Center(child: Text(state.message));
            } else if (state is PatientDetailsSuccess) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 32.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.tr('patients_record'),
                              style: context.textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.w800,
                                letterSpacing: -0.5,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              context.tr('patients_record_desc'),
                              style: context.textTheme.labelMedium!.copyWith(
                                color: context.colorScheme.scrim.withValues(
                                  alpha: 0.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 32.h),
                    Wrap(
                      spacing: 24.w,
                      runSpacing: 24.h,
                      children: [
                        SizedBox(
                          width: 320.w,
                          child: PatientStatisticsCard(
                            title: context.tr('total_patients'),
                            count: state.patients.length.toString(),
                            icon: Icons.people_outline,
                            iconColor: Colors.teal.shade700,
                            iconBackgroundColor: Colors.teal.shade50,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    Container(
                      decoration: BoxDecoration(
                        color: context.colorScheme.surface,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: context.colorScheme.scrim.withValues(
                            alpha: 0.05,
                          ),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: context.colorScheme.scrim.withValues(
                              alpha: 0.03,
                            ),
                            offset: const Offset(0, 10),
                            blurRadius: 30,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            width: 1000.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const PatientTableHeader(),
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: state.patients
                                      .where(
                                        (p) => p.name.toLowerCase().contains(
                                          _searchQuery.toLowerCase(),
                                        ),
                                      )
                                      .length,
                                  separatorBuilder: (context, index) => Divider(
                                    height: 1,
                                    color: context.colorScheme.scrim.withValues(
                                      alpha: 0.03,
                                    ),
                                  ),
                                  itemBuilder: (context, index) {
                                    final filteredList = state.patients
                                        .where(
                                          (p) => p.name.toLowerCase().contains(
                                            _searchQuery.toLowerCase(),
                                          ),
                                        )
                                        .toList();
                                    final item = filteredList[index];
                                    return PatientListItem(
                                      name: item.name,
                                      genderAndAge:
                                          '${item.gender == 0 ? "أنثى" : "ذكر"}، ${item.dateOfBirth}',
                                      lastVisit: item.date,
                                      phone: item.phoneNumber,
                                      email: item.email,
                                      onActionTap: () {},
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
