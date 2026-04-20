import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/core/localization/app_localizations.dart';
import 'package:roshetta/core/routing/app_routes.dart';
import 'package:roshetta/features/patients/home_patients_feature/presentation/screens/widgets/doctor_search_filter_widget.dart';
import 'package:roshetta/features/patients/home_patients_feature/presentation/screens/widgets/doctor_list_item.dart';

class HomePatientsScreen extends StatefulWidget {
  const HomePatientsScreen({super.key});

  @override
  State<HomePatientsScreen> createState() => _HomePatientsScreenState();
}

class _HomePatientsScreenState extends State<HomePatientsScreen> {
  final List<Map<String, dynamic>> _dummyDoctors = [
    {
      'name': 'دكتور باسم خليل',
      'specialization': 'استشاري أمراض القلب والأوعية الدموية',
      'location': 'القاهرة، المعادي',
      'price': 'سعر الكشف: 400 ج.م',
      'description':
          'متخصص في جراحات القلب المفتوح والقسطرة التداخلية، حاصل على البورد الأمريكي.',
    },
    {
      'name': 'دكتورة سارة محمود',
      'specialization': 'أخصائية طب وتجميل الأسنان',
      'location': 'الجيزة، الدقي',
      'price': 'سعر الكشف: 250 ج.م',
      'description':
          'متخصصة في فينير الأسنان وتبييض الأسنان بالليزر، خبرة أكثر من 10 سنوات.',
    },
    {
      'name': 'دكتور علي حسن',
      'specialization': 'استشاري الأمراض الجلدية والتناسلية',
      'location': 'القاهرة، التجمع الخامس',
      'price': 'سعر الكشف: 600 ج.م',
      'description':
          'متخصص في علاج الأمراض الجلدية المزمنة والعلاج بالليزر، أستاذ بجامعة عين شمس.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: context.textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.scrim,
                      height: 1.2,
                    ),
                    children: [
                      TextSpan(text: context.tr('find_trusted_doctor')),
                      TextSpan(
                        text: context.tr('book_appointment_now'),
                        style: TextStyle(color: context.colorScheme.primary),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  context.tr('roshetta_platform_desc'),
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.scrim.withValues(alpha: 0.5),
                    height: 1.5,
                  ),
                ),
              ],
            ),
            SizedBox(height: 48.h),
            const DoctorSearchFilterWidget(),
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.tr('available_doctors'),
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      context.tr('sort_by'),
                      style: context.textTheme.titleSmall?.copyWith(
                        color: context.colorScheme.scrim.withValues(alpha: 0.5),
                      ),
                    ),
                    Text(
                      context.tr('highest_rated'),
                      style: context.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: context.colorScheme.scrim.withValues(alpha: 0.5),
                      size: 20.sp,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24.h),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _dummyDoctors.length,
              itemBuilder: (context, index) {
                final doc = _dummyDoctors[index];
                return DoctorListItem(
                  name: doc['name'],
                  specialization: doc['specialization'],
                  location: doc['location'],
                  price: doc['price'],
                  description: doc['description'],
                  onBookTap: () {
                    context.go(AppRoutes.doctorDetailsPatientScreen);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}