import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/core/localization/app_localizations.dart';
import 'package:roshetta/features/patients/patients_details_doctor_feature/presentation/screens/widgets/patient_list_item.dart';
import 'package:roshetta/features/patients/patients_details_doctor_feature/presentation/screens/widgets/patient_record_app_bar_widget.dart';
import 'package:roshetta/features/patients/patients_details_doctor_feature/presentation/screens/widgets/patient_statistics_card.dart';
import 'package:roshetta/features/patients/patients_details_doctor_feature/presentation/screens/widgets/patient_table_header.dart';

class PatientsDetailsDoctorScreen extends StatefulWidget {
  const PatientsDetailsDoctorScreen({super.key});

  @override
  State<PatientsDetailsDoctorScreen> createState() =>
      _PatientsDetailsDoctorScreenState();
}

class _PatientsDetailsDoctorScreenState
    extends State<PatientsDetailsDoctorScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedFilterIndex = 0;

  final List<Map<String, dynamic>> _dummyPatients = [
    {
      'image': 'https://picsum.photos/200',
      'name': 'فاطمة الزهراء',
      'genderAndAge': 'أنثى، 32 سنة',
      'fileNumber': 'PT - 2023 - 0451',
      'lastVisit': '12 أكتوبر 2023',
      'phone': '050 123 4567',
      'email': 'fatima.z@example.com',
      'status': 'مستقر',
    },
    {
      'image': 'https://picsum.photos/200?random=2',
      'name': 'محمد عبد الله',
      'genderAndAge': 'ذكر، 54 سنة',
      'fileNumber': 'PT - 2022 - 1102',
      'lastVisit': '05 أكتوبر 2023',
      'phone': '055 987 6543',
      'email': 'm.abdullah@email.com',
      'status': 'متابعة ضرورية',
    },
    {
      'image': 'https://picsum.photos/200?random=3',
      'name': 'يوسف منصور',
      'genderAndAge': 'ذكر، 41 سنة',
      'fileNumber': 'PT - 2023 - 0899',
      'lastVisit': '28 سبتمبر 2023',
      'phone': '052 345 8765',
      'email': 'y.mansour@email.com',
      'status': 'قيد العلاج',
    },
    {
      'image': 'https://picsum.photos/200?random=3',
      'name': 'يوسف منصور',
      'genderAndAge': 'ذكر، 41 سنة',
      'fileNumber': 'PT - 2023 - 0899',
      'lastVisit': '28 سبتمبر 2023',
      'phone': '052 345 8765',
      'email': 'y.mansour@email.com',
      'status': 'قيد العلاج',
    },
    {
      'image': 'https://picsum.photos/200?random=3',
      'name': 'يوسف منصور',
      'genderAndAge': 'ذكر، 41 سنة',
      'fileNumber': 'PT - 2023 - 0899',
      'lastVisit': '28 سبتمبر 2023',
      'phone': '052 345 8765',
      'email': 'y.mansour@email.com',
      'status': 'قيد العلاج',
    },
    {
      'image': 'https://picsum.photos/200?random=3',
      'name': 'يوسف منصور',
      'genderAndAge': 'ذكر، 41 سنة',
      'fileNumber': 'PT - 2023 - 0899',
      'lastVisit': '28 سبتمبر 2023',
      'phone': '052 345 8765',
      'email': 'y.mansour@email.com',
      'status': 'قيد العلاج',
    },
    {
      'image': 'https://picsum.photos/200?random=3',
      'name': 'يوسف منصور',
      'genderAndAge': 'ذكر، 41 سنة',
      'fileNumber': 'PT - 2023 - 0899',
      'lastVisit': '28 سبتمبر 2023',
      'phone': '052 345 8765',
      'email': 'y.mansour@email.com',
      'status': 'قيد العلاج',
    },
    {
      'image': 'https://picsum.photos/200?random=3',
      'name': 'يوسف منصور',
      'genderAndAge': 'ذكر، 41 سنة',
      'fileNumber': 'PT - 2023 - 0899',
      'lastVisit': '28 سبتمبر 2023',
      'phone': '052 345 8765',
      'email': 'y.mansour@email.com',
      'status': 'قيد العلاج',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onFilterTap(int index) {
    setState(() {
      _selectedFilterIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.h,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: PatientRecordAppBarWidget(searchController: _searchController),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 32.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr('patients_record'),
                      style: context.textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.5,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      context.tr('patients_record_desc'),
                      style: context.textTheme.labelMedium!.copyWith(
                        color: context.colorScheme.scrim.withValues(alpha: 0.4),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32.h),
            Wrap(
              spacing: 24.w,
              runSpacing: 24.h,
              children: [
                SizedBox(
                  width: 320.w,
                  child: PatientStatisticsCard(
                    title: context.tr('total_patients'),
                    count: '1,248',
                    icon: Icons.people_outline,
                    iconColor: Colors.teal.shade700,
                    iconBackgroundColor: Colors.teal.shade50,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
            Container(
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: context.colorScheme.scrim.withValues(alpha: 0.05),
                ),
                boxShadow: [
                  BoxShadow(
                    color: context.colorScheme.scrim.withValues(alpha: 0.03),
                    offset: const Offset(0, 10),
                    blurRadius: 30,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: 1000
                        .w, // Fixed width for horizontal scrolling on small screens
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const PatientTableHeader(),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _dummyPatients.length,
                          separatorBuilder: (context, index) => Divider(
                            height: 1,
                            color: context.colorScheme.scrim.withValues(
                              alpha: 0.03,
                            ),
                          ),
                          itemBuilder: (context, index) {
                            final item = _dummyPatients[index];
                            return PatientListItem(
                              name: item['name'],
                              genderAndAge: item['genderAndAge'],
                              lastVisit: item['lastVisit'],
                              phone: item['phone'],
                              email: item['email'],
                              onActionTap: () {},
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
