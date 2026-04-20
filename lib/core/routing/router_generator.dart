import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:roshetta/core/di/service_locator.dart';
import 'package:roshetta/core/routing/app_routes.dart';
import 'package:roshetta/core/services/local/cache_helper.dart';
import 'package:roshetta/core/services/remote/endpoints.dart';
import 'package:roshetta/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:roshetta/features/auth/presentation/screens/register_screen/register_screen.dart';
import 'package:roshetta/features/auth/presentation/screens/widgets/auth_layout.dart';
import 'package:roshetta/features/patients/home_patients_feature/data/models/home_doctor_model.dart';
import 'package:roshetta/features/auth/presentation/screens/login_screen/login_screen.dart';
import 'package:roshetta/features/clinic/availability_feature/presentation/bloc/availability_clinic_bloc.dart';
import 'package:roshetta/features/clinic/booked_feature/presentation/bloc/booked_clinic_bloc.dart';
import 'package:roshetta/features/patients/doctor_details_patient_feature/presentation/bloc/doctor_details_patient_bloc.dart';
import 'package:roshetta/features/clinic/profile_feature/presentation/bloc/profile_clinic_bloc.dart';
import 'package:roshetta/features/patients/doctor_details_patient_feature/presentation/screens/doctor_details_patient_screen.dart';
import 'package:roshetta/features/patients/home_patients_feature/presentation/screens/home_patients_screen.dart';
import 'package:roshetta/features/patients/history_patients_feature/presentation/screens/history_patients_screen.dart';
import 'package:roshetta/features/patients/home_patients_feature/presentation/bloc/home_patients_bloc.dart';
import 'package:roshetta/features/patients/profile_patients_feature/presentation/screens/profile_patients_screen.dart';
import 'package:roshetta/features/patients/profile_patients_feature/presentation/bloc/profile_patient_bloc.dart';
import 'package:roshetta/root/bloc/root_bloc.dart';
import 'package:roshetta/root/custom_view_nav_bar.dart';

class RouterGenerator {
  static GoRouter goRouter = GoRouter(
    initialLocation: _getInitialRoute(),
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(
            value: sl<AuthBloc>(),
            child: AuthLayout(child: child),
          );
        },

        routes: [
          GoRoute(
            path: AppRoutes.loginScreen,
            name: AppRoutes.loginScreen,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const LoginScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
            ),
          ),
          GoRoute(
            path: AppRoutes.registerScreen,
            name: AppRoutes.registerScreen,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const RegisterScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
            ),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.navBar,
        name: AppRoutes.navBar,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final role =
              extra?['role'] as String? ??
              sl<CacheHelper>().getDataString(key: ApiKey.role) ??
              '';
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(value: sl<AuthBloc>()),
              BlocProvider.value(value: sl<RootBloc>()),
              BlocProvider.value(value: sl<AvailabilityClinicBloc>()),
              BlocProvider.value(value: sl<ProfileClinicBloc>()),
              BlocProvider.value(value: sl<BookedClinicBloc>()),
              BlocProvider.value(value: sl<ProfilePatientBloc>()),
              BlocProvider.value(value: sl<HomePatientsBloc>()),
            ],
            child: CustomViewNavBar(role: role),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.patientsScreen,
        name: AppRoutes.patientsScreen,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: sl<AuthBloc>()),
            BlocProvider.value(value: sl<RootBloc>()),
            BlocProvider.value(value: sl<HomePatientsBloc>()),
          ],
          child: CustomViewNavBar(role: 'Patient'),
        ),
      ),
      GoRoute(
        path: AppRoutes.historyPatientsScreen,
        name: AppRoutes.historyPatientsScreen,
        builder: (context, state) => HistoryPatientsScreen(),
      ),
      GoRoute(
        path: AppRoutes.homePatientsScreen,
        name: AppRoutes.homePatientsScreen,
        builder: (context, state) => HomePatientsScreen(),
      ),
      GoRoute(
        path: AppRoutes.profilePatientsScreen,
        name: AppRoutes.profilePatientsScreen,
        builder: (context, state) => ProfilePatientsScreen(),
      ),
      GoRoute(
        path: AppRoutes.doctorDetailsPatientScreen,
        name: AppRoutes.doctorDetailsPatientScreen,
        builder: (context, state) {
          final HomeDoctorModel doctorData = state.extra as HomeDoctorModel;
          return BlocProvider(
            create: (_) => sl<DoctorDetailsPatientBloc>(),
            child: DoctorDetailsPatientScreen(doctorData: doctorData),
          );
        },
      ),
    ],
  );

  static String _getInitialRoute() {
    final role = sl<CacheHelper>().getDataString(key: ApiKey.role);
    return (role == null || role.isEmpty)
        ? AppRoutes.loginScreen
        : AppRoutes.navBar;
  }
}
