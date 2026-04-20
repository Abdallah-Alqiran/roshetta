import 'package:flutter/material.dart';
import 'package:roshetta/features/widgets/clinic_app_bar.dart';

class CustomAppBarWidget extends StatelessWidget {
  final TextEditingController? searchController;
  final VoidCallback? onLogout;
  final VoidCallback? onSettings;
  final VoidCallback? onProfile;

  const CustomAppBarWidget({
    super.key,
    this.searchController,
    this.onLogout,
    this.onSettings,
    this.onProfile,
  });

  @override
  Widget build(BuildContext context) {
    return SharedClinicAppBar(
      searchController: searchController,
      onLogout: onLogout,
      onSettings: onSettings,
      onProfile: onProfile,
    );
  }
}
