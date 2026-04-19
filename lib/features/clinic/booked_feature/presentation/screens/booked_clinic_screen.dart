import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/features/clinic/booked_feature/presentation/screens/widget/custom_app_bar.dart';
import 'package:roshetta/features/clinic/booked_feature/presentation/screens/widget/custom_bottom_filter.dart';
import 'package:roshetta/features/clinic/booked_feature/presentation/screens/widget/custom_request_widget.dart';

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
    {
      'name': 'فهد عبدالرحمن السالم',
      'time': '01:00 ظهراً',
      'phone': '+966 53 456 7890',
    },
    {
      'name': 'فهد عبدالرحمن السالم',
      'time': '01:00 ظهراً',
      'phone': '+966 53 456 7890',
    },
    {
      'name': 'فهد عبدالرحمن السالم',
      'time': '01:00 ظهراً',
      'phone': '+966 53 456 7890',
    },
    {
      'name': 'فهد عبدالرحمن السالم',
      'time': '01:00 ظهراً',
      'phone': '+966 53 456 7890',
    },
    {
      'name': 'فهد عبدالرحمن السالم',
      'time': '01:00 ظهراً',
      'phone': '+966 53 456 7890',
    },
    {
      'name': 'فهد عبدالرحمن السالم',
      'time': '01:00 ظهراً',
      'phone': '+966 53 456 7890',
    },
    {
      'name': 'فهد عبدالرحمن السالم',
      'time': '01:00 ظهراً',
      'phone': '+966 53 456 7890',
    },
    {
      'name': 'فهد عبدالرحمن السالم',
      'time': '01:00 ظهراً',
      'phone': '+966 53 456 7890',
    },
    {
      'name': 'فهد عبدالرحمن السالم',
      'time': '01:00 ظهراً',
      'phone': '+966 53 456 7890',
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
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 32.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'طلبات الحجز',
              style: context.textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "مراجعه وتأكيد طلبات الحجز ",
                  style: context.textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.scrim.withValues(alpha: 0.5),
                  ),
                ),
                const Spacer(),
                CustomBottomFilter(
                  text: "الكل",
                  // number: "12",
                  isSelected: selectedFilterIndex == 0,
                  onTap: () => _onFilterTap(0),
                ),
                SizedBox(width: 8.w),
                CustomBottomFilter(
                  text: "اليوم",
                  // number: "5",
                  isSelected: selectedFilterIndex == 1,
                  onTap: () => _onFilterTap(1),
                ),
                SizedBox(width: 8.w),
                CustomBottomFilter(
                  text: "الكل",
                  number: "8",
                  isSelected: selectedFilterIndex == 2,
                  onTap: () => _onFilterTap(2),
                ),
                SizedBox(width: 8.w),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  width: 622.w,
                  child: ListView.builder(
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
