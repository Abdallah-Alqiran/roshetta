import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/core/localization/app_localizations.dart';
import 'package:roshetta/features/clinic/booked_feature/presentation/screens/widget/custom_bottom_filter.dart';
import 'package:roshetta/features/patients/history_patients_feature/presentation/screens/widgets/history_list_item.dart';
import 'package:roshetta/features/patients/history_patients_feature/presentation/screens/widgets/history_statistics_card.dart';
import 'package:roshetta/features/patients/history_patients_feature/presentation/screens/widgets/history_table_header.dart';

class HistoryPatientsScreen extends StatefulWidget {
  const HistoryPatientsScreen({super.key});

  @override
  State<HistoryPatientsScreen> createState() => _HistoryPatientsScreenState();
}

class _HistoryPatientsScreenState extends State<HistoryPatientsScreen> {
  int _selectedFilterIndex = 0;

  late final List<String> _filters = [context.tr('all')];

  final List<Map<String, dynamic>> _dummyHistory = [
    {
      'doctorName': 'د. أحمد كمال',
      'specialization': 'أخصائي القلب والأوعية',
      'date': '15 أكتوبر 2023',
      'time': '10:30 صباحاً',
      'status': 'Pending',
      'actions': <IconData>[Icons.info_outline, Icons.edit_calendar_outlined],
    },
    {
      'doctorName': 'د. سارة محمود',
      'specialization': 'استشاري طب العيون',
      'date': '02 أكتوبر 2023',
      'time': '01:00 مساءً',
      'status': 'Canceled',
      'actions': <IconData>[Icons.info_outline, Icons.edit_calendar_outlined],
    },
  ];

  void _onFilterTap(int index) {
    setState(() {
      _selectedFilterIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.tr('medical_appointments_history'),
              style: context.textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              context.tr('medical_appointments_history_desc'),
              style: context.textTheme.labelLarge!.copyWith(
                color: context.colorScheme.scrim.withValues(alpha: 0.5),
              ),
            ),
            SizedBox(height: 32.h),
            SizedBox(
              width: 200.w,
              child: Row(
                children: [
                  Expanded(
                    child: HistoryStatisticsCard(
                      title: 'إجمالي المواعيد',
                      count: '24',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            Row(
              children: List.generate(
                _filters.length,
                (index) => Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: CustomBottomFilter(
                    text: _filters[index],
                    isSelected: _selectedFilterIndex == index,
                    onTap: () => _onFilterTap(index),
                  ),
                ),
              ),
            ),
            SizedBox(height: 32.h),
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
                  HistoryTableHeader(),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _dummyHistory.length,
                    itemBuilder: (context, index) {
                      final item = _dummyHistory[index];

                      return HistoryListItem(
                        doctorName: item['doctorName'],
                        specialization: item['specialization'],
                        date: item['date'],
                        status: item['status'],
                      );
                    },
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
