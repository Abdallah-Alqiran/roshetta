import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/features/clinic/booked_feature/presentation/screens/widget/custom_app_bar.dart';
import 'package:roshetta/features/clinic/booked_feature/presentation/screens/widget/custom_bottom_filter.dart';
import 'package:roshetta/features/clinic/booked_feature/presentation/screens/widget/custom_request_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roshetta/core/di/service_locator.dart';
import 'package:roshetta/features/clinic/booked_feature/presentation/bloc/booked_clinic_bloc.dart';
import 'package:roshetta/features/clinic/booked_feature/presentation/bloc/booked_clinic_event.dart';
import 'package:roshetta/features/clinic/booked_feature/presentation/bloc/booked_clinic_state.dart';

class BookedClinicScreen extends StatefulWidget {
  const BookedClinicScreen({super.key});

  @override
  State<BookedClinicScreen> createState() => _BookedClinicScreenState();
}

class _BookedClinicScreenState extends State<BookedClinicScreen> {
  int selectedFilterIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<BookedClinicBloc>().add(GetBookedClinicEvent());
  }

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
            Expanded(
              child: Row(
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
                            child:
                                BlocBuilder<
                                  BookedClinicBloc,
                                  BookedClinicState
                                >(
                                  builder: (context, state) {
                                    final count = state is BookedClinicLoaded
                                        ? state.bookedAppointments.length
                                              .toString()
                                        : "0";
                                    return CustomBottomFilter(
                                      text: "الكل",
                                      number: count,
                                      isSelected: selectedFilterIndex == 0,
                                      onTap: () => _onFilterTap(0),
                                    );
                                  },
                                ),
                          ),
                          SizedBox(height: 18.h),
                          Expanded(
                            child:
                                BlocBuilder<
                                  BookedClinicBloc,
                                  BookedClinicState
                                >(
                                  builder: (context, state) {
                                    if (state is BookedClinicLoading) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else if (state is BookedClinicError) {
                                      return Center(child: Text(state.message));
                                    } else if (state is BookedClinicLoaded) {
                                      if (state.bookedAppointments.isEmpty) {
                                        return const Center(
                                          child: Text(
                                            'لا يوجد طلبات حجز حالياً',
                                          ),
                                        );
                                      }
                                      return ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            state.bookedAppointments.length,
                                        itemBuilder: (context, index) {
                                          final item =
                                              state.bookedAppointments[index];
                                          return CustomRequestWidget(
                                            orderNumber: item.id,
                                            name: item.name,
                                            time: item.date,
                                            phone: item.phoneNumber,
                                            onAccept: () {},
                                            onReject: () {},
                                          );
                                        },
                                      );
                                    }
                                    return const SizedBox.shrink();
                                  },
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(width: 24.w),
                  // SizedBox(
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
