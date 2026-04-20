import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/features/clinic/booked_feature/presentation/screens/widget/custom_app_bar.dart';
import 'package:roshetta/features/clinic/dashboard_feature/presentation/screens/widgets/clinic_stat_card.dart';
// import 'package:roshetta/features/clinic/dashboard_feature/presentation/screens/widgets/quick_actions_widget.dart';
import 'package:roshetta/features/clinic/dashboard_feature/presentation/screens/widgets/recent_visits_widget.dart';

class DashboardClinicScreen extends StatelessWidget {
  const DashboardClinicScreen({super.key});

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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 32.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "مرحباً د. أحمد",
                  style: context.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "إليك ملخص العيادة لهذا اليوم.",
                  style: context.textTheme.labelLarge?.copyWith(
                    color: Colors.grey[600],
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClinicStatCard(
                            label: "المرضى اليوم",
                            count: "24",
                            icon: Icons.people_outline,
                            backgroundColor: Colors.white,
                            contentColor: context.colorScheme.primary,
                          ),
                          SizedBox(width: 24.w),
                          ClinicStatCard(
                            label: "المواعيد القادمة",
                            count: "12",
                            icon: Icons.calendar_today_outlined,
                            backgroundColor: const Color(0xFF00A78E),
                            contentColor: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(height: 40.h),
                      SizedBox(width: 800.w, child: const RecentVisitsWidget()),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
