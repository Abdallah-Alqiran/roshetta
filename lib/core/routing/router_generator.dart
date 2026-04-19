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
import 'package:roshetta/features/auth/presentation/screens/login_screen/login_screen.dart';
import 'package:roshetta/features/patients/home_patients_feature/presentation/screens/home_patients_screen.dart';
import 'package:roshetta/features/patients/patients_details_doctor_feature/presentation/screens/patients_details_doctor_screen.dart';
import 'package:roshetta/features/patients/history_patients_feature/presentation/screens/history_patients_screen.dart';
import 'package:roshetta/root/bloc/root_bloc.dart';
import 'package:roshetta/root/custom_view_nav_bar.dart';

class RouterGenerator {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.loginScreen,
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
            providers: [BlocProvider.value(value: sl<RootBloc>())],
            child: CustomViewNavBar(role: role),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.patientsScreen,
        name: AppRoutes.patientsScreen,
        builder: (context, state) => PatientsDetailsDoctorScreen(),
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
    ],
  );
}
