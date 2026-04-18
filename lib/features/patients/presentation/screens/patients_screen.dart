import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/features/clinic/booked_feature/presentation/screens/widget/custom_bottom_filter.dart';
import 'package:roshetta/features/patients/presentation/screens/widgets/patient_list_item.dart';
import 'package:roshetta/features/patients/presentation/screens/widgets/patient_record_app_bar_widget.dart';
import 'package:roshetta/features/patients/presentation/screens/widgets/patient_statistics_card.dart';
import 'package:roshetta/features/patients/presentation/screens/widgets/patient_table_header.dart';

class PatientsScreen extends StatefulWidget {
  PatientsScreen({super.key});

  @override
  State<PatientsScreen> createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedFilterIndex = 0;

  final List<Map<String, dynamic>> _dummyPatients = [
    {
      'image':
          'https://i.pinimg.com/1200x/7d/cb/a1/7dcba1185f62ae8e7ee801a1de182c77.jpg',
      'name': 'فاطمة الزهراء',
      'genderAndAge': 'أنثى، 32 سنة',
      'fileNumber': 'PT - 2023 - 0451',
      'lastVisit': '12 أكتوبر 2023',
      'phone': '050 123 4567',
      'email': 'fatima.z@example.com',
      'status': 'مستقر',
    },
    {
      'image':
          'https://i.pinimg.com/1200x/7d/cb/a1/7dcba1185f62ae8e7ee801a1de182c77.jpg',
      'name': 'محمد عبد الله',
      'genderAndAge': 'ذكر، 54 سنة',
      'fileNumber': 'PT - 2022 - 1102',
      'lastVisit': '05 أكتوبر 2023',
      'phone': '055 987 6543',
      'email': 'm.abdullah@email.com',
      'status': 'متابعة ضرورية',
    },
    {
      'image':
          'https://i.pinimg.com/1200x/7d/cb/a1/7dcba1185f62ae8e7ee801a1de182c77.jpg',
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
            Text(
              'سجل المرضى',
              style: context.textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "إدارة وتصفح بيانات المرضى المسجلين في العيادة.",
              style: context.textTheme.labelLarge!.copyWith(
                color: context.colorScheme.scrim.withValues(alpha: 0.5),
              ),
            ),
            SizedBox(height: 32.h),
            Row(
              children: [
                Expanded(
                  child: PatientStatisticsCard(
                    title: 'إجمالي المرضى',
                    count: '1,248',
                    icon: Icons.people_outline,
                    iconColor: Colors.teal.shade700,
                    iconBackgroundColor: Colors.teal.shade50,
                  ),
                ),
                SizedBox(width: 24.w),
                Expanded(
                  child: PatientStatisticsCard(
                    title: 'مرضى اليوم',
                    count: '24',
                    icon: Icons.person_add_alt_1_outlined,
                    iconColor: Colors.blue.shade700,
                    iconBackgroundColor: Colors.blue.shade50,
                  ),
                ),
                SizedBox(width: 24.w),
                Expanded(
                  child: PatientStatisticsCard(
                    title: '',
                    count: null,
                    icon: Icons.warning_amber_rounded,
                    iconColor: Colors.red.shade700,
                    iconBackgroundColor: Colors.red.shade50,
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.h),
            Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CustomBottomFilter(
                          text: "الكل",
                          isSelected: _selectedFilterIndex == 0,
                          onTap: () => _onFilterTap(0),
                        ),
                        SizedBox(width: 12.w),
                        CustomBottomFilter(
                          text: "مراجعات حديثة",
                          isSelected: _selectedFilterIndex == 1,
                          onTap: () => _onFilterTap(1),
                        ),
                        SizedBox(width: 12.w),
                        CustomBottomFilter(
                          text: "أمراض مزمنة",
                          isSelected: _selectedFilterIndex == 2,
                          onTap: () => _onFilterTap(2),
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.filter_list,
                    color: context.colorScheme.primary,
                    size: 20.sp,
                  ),
                  label: Text(
                    "تصفية متقدمة",
                    style: context.textTheme.labelMedium?.copyWith(
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            Container(
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: context.colorScheme.scrim.withValues(alpha: 0.05),
                    offset: const Offset(0, 4),
                    blurRadius: 16,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const PatientTableHeader(),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _dummyPatients.length,
                    itemBuilder: (context, index) {
                      final item = _dummyPatients[index];
                      return PatientListItem(
                        imagePath: item['image'],
                        name: item['name'],
                        genderAndAge: item['genderAndAge'],
                        fileNumber: item['fileNumber'],
                        lastVisit: item['lastVisit'],
                        phone: item['phone'],
                        email: item['email'],
                        status: item['status'],
                        onActionTap: () {},
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.h,
                      horizontal: 24.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "عرض 1 إلى 3 من أصل 1248 مريض",
                          style: context.textTheme.labelMedium?.copyWith(
                            color: context.colorScheme.scrim.withValues(
                              alpha: 0.6,
                            ),
                          ),
                        ),
                        SizedBox(width: 24.w),
                        Row(
                          children: [
                            Icon(
                              Icons.chevron_left,
                              color: context.colorScheme.scrim.withValues(
                                alpha: 0.4,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 8.h,
                              ),
                              decoration: BoxDecoration(
                                color: context.colorScheme.primary,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Text(
                                "1",
                                style: TextStyle(
                                  color: context.colorScheme.onPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text("2"),
                            SizedBox(width: 16.w),
                            Text("3"),
                            SizedBox(width: 16.w),
                            Text("..."),
                            SizedBox(width: 16.w),
                            Icon(
                              Icons.chevron_right,
                              color: context.colorScheme.scrim.withValues(
                                alpha: 0.8,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
