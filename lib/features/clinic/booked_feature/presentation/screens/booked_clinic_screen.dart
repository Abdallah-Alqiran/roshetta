import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/features/clinic/booked_feature/presentation/screens/widget/custom_app_bar.dart';
import 'package:roshetta/features/clinic/booked_feature/presentation/screens/widget/custom_bottom_filter.dart';
import 'package:roshetta/features/clinic/booked_feature/presentation/screens/widget/custom_request_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:roshetta/core/routing/app_routes.dart';
import 'package:roshetta/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:roshetta/root/bloc/root_bloc.dart';
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
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    context.read<BookedClinicBloc>().add(GetBookedClinicEvent());
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: CustomAppBarWidget(
            searchController: _searchController,
            onProfile: () {
              context.read<RootBloc>().add(ChangeIndexRootEvent(index: 4));
            },
            onSettings: () {
              context.read<RootBloc>().add(ChangeIndexRootEvent(index: 4));
            },
            onLogout: () {
              context.read<AuthBloc>().add(LogoutEvent());
              context.go(AppRoutes.loginScreen);
            },
          ),
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
                        boxShadow: const [
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
                                        ? state.bookedAppointments
                                              .where(
                                                (e) => e.name
                                                    .toLowerCase()
                                                    .contains(_searchQuery),
                                              )
                                              .length
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
                            child: BlocBuilder<BookedClinicBloc, BookedClinicState>(
                              builder: (context, state) {
                                if (state is BookedClinicLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state is BookedClinicError) {
                                  return Center(child: Text(state.message));
                                } else if (state is BookedClinicLoaded) {
                                  final filteredList = state.bookedAppointments
                                      .where(
                                        (item) => item.name
                                            .toLowerCase()
                                            .contains(_searchQuery),
                                      )
                                      .toList();

                                  if (filteredList.isEmpty) {
                                    return const Center(
                                      child: Text('لا يوجد طلبات حجز حالياً'),
                                    );
                                  }
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: filteredList.length,
                                    itemBuilder: (context, index) {
                                      final item = filteredList[index];
                                      return CustomRequestWidget(
                                        orderNumber: item.id,
                                        name: item.name,
                                        time: item.date,
                                        phone: item.phoneNumber,
                                        onAccept: () {
                                          context.read<BookedClinicBloc>().add(
                                            UpdateBookedClinicStatusEvent(
                                              id: item.id,
                                              status: "Approved",
                                            ),
                                          );
                                        },
                                        onReject: () {
                                          context.read<BookedClinicBloc>().add(
                                            UpdateBookedClinicStatusEvent(
                                              id: item.id,
                                              status: "Rejected",
                                            ),
                                          );
                                        },
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
