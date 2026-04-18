import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roshetta/core/routing/app_routes.dart';
import 'package:roshetta/features/auth/presentation/screens/auth_layout.dart';
import 'package:roshetta/features/auth/presentation/screens/login_screen/login_screen.dart';
import 'package:roshetta/features/clinic/booked_feature/presentation/screens/booked_clinic_screen.dart';

class RouterGenerator {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.bookedClinicScreen,
    routes: [
      GoRoute(
        path: AppRoutes.loginScreen,
        name: AppRoutes.loginScreen,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const AuthLayout(child: LoginScreen()),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: AppRoutes.bookedClinicScreen,
        name: AppRoutes.bookedClinicScreen,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const BookedClinicScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
    ],
  );
}
