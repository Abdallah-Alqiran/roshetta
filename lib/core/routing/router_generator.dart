import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:roshetta/core/di/service_locator.dart';
import 'package:roshetta/core/routing/app_routes.dart';
import 'package:roshetta/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:roshetta/features/auth/presentation/screens/register_screen/register_screen.dart';
import 'package:roshetta/features/auth/presentation/screens/widgets/auth_layout.dart';
import 'package:roshetta/features/auth/presentation/screens/login_screen/login_screen.dart';

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
    ],
  );
}
