import 'package:flutter/material.dart';
import 'package:roshetta/features/widgets/clinic_app_bar.dart';

class PatientRecordAppBarWidget extends StatelessWidget {
  final TextEditingController searchController;

  const PatientRecordAppBarWidget({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return SharedClinicAppBar(searchController: searchController);
  }
}
