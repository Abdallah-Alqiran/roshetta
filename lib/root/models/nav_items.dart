import 'package:flutter/material.dart';
import 'package:roshetta/features/clinic/availability_feature/presentation/screens/availability_clinic_screen.dart';
import 'package:roshetta/features/clinic/booked_feature/presentation/screens/booked_clinic_screen.dart';
import 'package:roshetta/features/clinic/dashboard_feature/presentation/screens/dashboard_clinic_screen.dart';
import 'package:roshetta/features/clinic/profile_feature/presentation/screens/profile_clinic_screen.dart';
import 'package:roshetta/features/patients/history_patients_feature/presentation/screens/history_patients_screen.dart';
import 'package:roshetta/features/patients/home_patients_feature/presentation/screens/home_patients_screen.dart';
import 'package:roshetta/features/patients/profile_patients_feature/presentation/screens/profile_patients_screen.dart';

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
    screen: DashboardClinicScreen(),
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
    screen: HomePatientsScreen(),
    index: 2,
  ),
  const NavItemModel(
    icon: Icons.event_available,
    label: 'availability',
    screen: AvailabilityClinicScreen(),
    index: 3,
  ),
  const NavItemModel(
    icon: Icons.person_outline,
    label: 'profile',
    screen: ProfileClinicScreen(),
    index: 4,
  ),
];

final List<NavItemModel> patientNavItems = [
  const NavItemModel(
    icon: Icons.home_outlined,
    label: 'الرئيسية',
    screen: HomePatientsScreen(),
    index: 0,
  ),
  const NavItemModel(
    icon: Icons.history_outlined,
    label: 'السجل',
    screen: HistoryPatientsScreen(),
    index: 1,
  ),
  const NavItemModel(
    icon: Icons.person_outline,
    label: 'الملف الشخصي',
    screen: ProfilePatientsScreen(),
    index: 2,
  ),
];
