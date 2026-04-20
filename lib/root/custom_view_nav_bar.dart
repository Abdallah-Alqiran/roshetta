import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:roshetta/features/auth/presentation/screens/login_screen/login_screen.dart';
import 'package:roshetta/root/models/nav_items.dart';
import 'package:roshetta/root/screens/root_screen.dart';

class CustomViewNavBar extends StatefulWidget {
  final String role;
  const CustomViewNavBar({super.key, required this.role});

  @override
  State<CustomViewNavBar> createState() => _CustomViewNavBarState();
}

class _CustomViewNavBarState extends State<CustomViewNavBar> {
  @override
  Widget build(BuildContext context) {
    log("Role is: ${widget.role}");
    
    if (widget.role == 'Patient') {
      return RootScreen(
        navItems: patientNavItems,
        useTopNavBar: true,
      );
    } else if (widget.role == 'Doctor') {
      return RootScreen(
        navItems: clinicNavItems,
      );
    } else {
      return LoginScreen();
    }
  }
}
