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
    {
      'name': 'دكتور علي حسن',
      'specialization': 'استشاري الأمراض الجلدية والتناسلية',
      'location': 'القاهرة، التجمع الخامس',
      'price': 'سعر الكشف: 600 ج.م',
      'description':
          'متخصص في علاج الأمراض الجلدية المزمنة والعلاج بالليزر، أستاذ بجامعة عين شمس.',
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
      backgroundColor: context.colorScheme.background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(50.w, 60.h, 50.w, 0),
              child: Column(
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
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 60.h),
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: 0.65,
                  child: const DoctorSearchFilterWidget(),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 24.h),
              child: Center(
                child: Text(
                  context.tr('available_doctors'),
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 150.w),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final doc = _dummyDoctors[index];
                  return DoctorListItem(
                    name: doc['name'],
                    specialization: doc['specialization'],
                    location: doc['location'],
                    price: doc['price'],
                    description: doc['description'],
                    onBookTap: () => context.push(
                      AppRoutes.doctorDetailsPatientScreen,
                    ),
                  );
                },
                childCount: _dummyDoctors.length,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(height: 100.h),
          ),
        ],
      ),
    );
  }
}
