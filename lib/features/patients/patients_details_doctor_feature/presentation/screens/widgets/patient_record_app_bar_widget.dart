import 'package:flutter/material.dart';
import 'package:roshetta/features/widgets/clinic_app_bar.dart';

class PatientRecordAppBarWidget extends StatelessWidget {
  final TextEditingController searchController;
  final VoidCallback? onLogout;
  final VoidCallback? onProfile;
  final ValueChanged<String>? onChanged;

  const PatientRecordAppBarWidget({
    super.key,
    required this.searchController,
    this.onLogout,
    this.onProfile,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SharedClinicAppBar(
      searchController: searchController,
      onLogout: onLogout,
      onProfile: onProfile,
      onChanged: onChanged,
    );
  }
}
