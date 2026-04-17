import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/localization/app_localizations.dart';
import 'package:roshetta/core/routing/router_generator.dart';
import 'package:roshetta/core/di/service_locator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:roshetta/core/constants/app_breakpoints.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      left: false,
      right: false,
      child: ScreenUtilInit(
        designSize: (MediaQuery.of(context).size.width >= AppBreakpoints.tablet)
            ? const Size(1440, 1024)
            : const Size(390, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            supportedLocales: const [Locale('en'), Locale('ar')],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: const Locale('ar'),
            debugShowCheckedModeBanner: false,
            title: 'Roshetta',
            // theme: AppTheme.lightTheme,
            routerConfig: RouterGenerator.goRouter,
          );
        },
      ),
    );
  }
}
