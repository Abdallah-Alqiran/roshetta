import 'dart:developer';

import 'package:flutter/widgets.dart';
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
    return RootScreen(
      navItems: widget.role == 'clinic' ? clinicNavItems : [],
    );
  }
}
