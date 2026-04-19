import 'package:flutter/material.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/core/theme/app_assets.dart';
import 'package:roshetta/core/utils/get_responsive_size.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: Row(
        children: [
          if (context.isDesktop)
             Expanded(flex: 1, child: Image.asset(AppAssets.auth,fit: BoxFit.cover,) ),

          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Positioned(
                  top: -100,
                  left: -100,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.colorScheme.primary.withValues(
                        alpha: 0.12,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: context.colorScheme.primary.withValues(
                            alpha: 0.12,
                          ),
                          blurRadius: 100,
                          spreadRadius: 50,
                        ),
                      ],
                    ),
                  ),
                ),
               

                Center(child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
