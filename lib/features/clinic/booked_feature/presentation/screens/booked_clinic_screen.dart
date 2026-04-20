import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/features/clinic/booked_feature/presentation/screens/widget/custom_app_bar.dart';
import 'package:roshetta/features/clinic/booked_feature/presentation/screens/widget/custom_bottom_filter.dart';
import 'package:roshetta/features/clinic/booked_feature/presentation/screens/widget/custom_request_widget.dart';
import 'package:roshetta/features/clinic/booked_feature/presentation/screens/widget/custom_today_summary.dart';

class BookedClinicScreen extends StatefulWidget {
  const BookedClinicScreen({super.key});

  @override
  State<BookedClinicScreen> createState() => _BookedClinicScreenState();
}

class _BookedClinicScreenState extends State<BookedClinicScreen> {
  int selectedFilterIndex = 0;
  final List<Map<String, String>> requests = const [
    {
      'name': 'محمد عبدالله محمود',
      'time': '10:30 صباحاً',
      'phone': '+966 50 123 4567',
    },
    {
      'name': 'سارة خالد العتيبي',
      'time': '11:15 صباحاً',
      'phone': '+966 55 987 6543',
    },
  ];

  void _onFilterTap(int index) {
    setState(() {
      selectedFilterIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.h,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: CustomAppBarWidget(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'طلبات الحجز',
              style: context.textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'مراجعة وتأكيد المواعيد الجديدة',
              style: context.textTheme.labelLarge!.copyWith(
                color: Colors.grey[600],
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 18.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 24.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 100.w,
                          child: CustomBottomFilter(
                            text: "الكل",
                            number: "12",
                            isSelected: selectedFilterIndex == 0,
                            onTap: () => _onFilterTap(0),
                          ),
                        ),
                        SizedBox(height: 18.h),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: requests.length,
                          itemBuilder: (context, index) {
                            final item = requests[index];
                            return CustomRequestWidget(
                              orderNumber: index + 1,
                              name: item['name']!,
                              time: item['time']!,
                              phone: item['phone']!,
                              onAccept: () {},
                              onReject: () {},
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(width: 24.w),
                // SizedBox(
                //   width: 200.w,
                //   child: CustomTodaySummary(
                //     newRequests: 3,
                //     confirmed: 8,
                //     available: 4,
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
