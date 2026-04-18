import 'package:flutter/material.dart';
import 'package:roshetta/features/clinic/booked_feature/presentation/screens/booked_clinic_screen.dart';
import 'package:roshetta/features/patients/presentation/screens/patients_screen.dart';

class NavItemModel {
  final IconData icon;
  final String label;
  final Widget screen;
  final int index;

  const NavItemModel({
    required this.icon,
    required this.label,
    required this.screen,
    required this.index,
  });
}

final List<NavItemModel> clinicNavItems = [
  const NavItemModel(
    icon: Icons.dashboard_outlined,
    label: 'dashboard',
    screen: BookedClinicScreen(),
    index: 0,
  ),
  const NavItemModel(
    icon: Icons.calendar_month_outlined,
    label: 'booked',
    screen: BookedClinicScreen(),
    index: 1,
  ),
  NavItemModel(
    icon: Icons.medical_information_outlined,
    label: 'patient_data',
    screen: PatientsScreen(),
    index: 2,
  ),
  const NavItemModel(
    icon: Icons.person_outline,
    label: 'profile',
    screen: BookedClinicScreen(),
    index: 3,
  ),
];
