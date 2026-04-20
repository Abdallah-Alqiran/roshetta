import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/core/localization/app_localizations.dart';
import 'package:roshetta/core/routing/app_routes.dart';
import 'package:roshetta/features/patients/home_patients_feature/presentation/screens/widgets/doctor_search_filter_widget.dart';
import 'package:roshetta/features/patients/home_patients_feature/presentation/screens/widgets/doctor_list_item.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roshetta/features/patients/home_patients_feature/presentation/bloc/home_patients_bloc.dart';
import 'package:roshetta/features/patients/home_patients_feature/presentation/bloc/home_patients_event.dart';
import 'package:roshetta/features/patients/home_patients_feature/presentation/bloc/home_patients_state.dart';

class HomePatientsScreen extends StatefulWidget {
  const HomePatientsScreen({super.key});

  @override
  State<HomePatientsScreen> createState() => _HomePatientsScreenState();
}

class _HomePatientsScreenState extends State<HomePatientsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomePatientsBloc>().add(GetDoctorsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      body: BlocBuilder<HomePatientsBloc, HomePatientsState>(
        builder: (context, state) {
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(50.w, 60.h, 50.w, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: context.textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.colorScheme.scrim,
                            height: 1.2,
                          ),
                          children: [
                            TextSpan(text: context.tr('find_trusted_doctor')),
                            TextSpan(
                              text: context.tr('book_appointment_now'),
                              style: TextStyle(
                                color: context.colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        context.tr('roshetta_platform_desc'),
                        style: context.textTheme.titleMedium?.copyWith(
                          color: context.colorScheme.scrim.withValues(
                            alpha: 0.5,
                          ),
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 60.h),
                  child: Center(
                    child: FractionallySizedBox(
                      widthFactor: 0.65,
                      child: const DoctorSearchFilterWidget(),
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 24.h),
                  child: Center(
                    child: Text(
                      context.tr('available_doctors'),
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              if (state is HomePatientsLoading)
                const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                ),

              if (state is HomePatientsLoaded)
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 150.w),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final doc = state.doctors[index];
                      return DoctorListItem(
                        name: doc.name,
                        specialization: doc.department.isNotEmpty
                            ? doc.department
                            : 'تخصص غير محدد',
                        location: doc.location.isNotEmpty
                            ? doc.location
                            : 'غير محدد',
                        price: doc.price != null
                            ? 'سعر الكشف: ${doc.price} ج.م'
                            : 'غير محدد',
                        phone: doc.phoneNumber,
                        description: doc.info,
                        onBookTap: () => context.push(
                          AppRoutes.doctorDetailsPatientScreen,
                          extra: doc.userId,
                        ),
                      );
                    }, childCount: state.doctors.length),
                  ),
                ),

              if (state is HomePatientsError)
                SliverFillRemaining(
                  child: Center(
                    child: Text(
                      state.message,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: context.colorScheme.error,
                      ),
                    ),
                  ),
                ),

              SliverToBoxAdapter(child: SizedBox(height: 100.h)),
            ],
          );
        },
      ),
    );
  }
}
