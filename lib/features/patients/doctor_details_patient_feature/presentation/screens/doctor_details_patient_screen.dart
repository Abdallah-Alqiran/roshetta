import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/utils/get_responsive_size.dart';
import 'package:roshetta/features/patients/doctor_details_patient_feature/presentation/bloc/doctor_details_patient_bloc.dart';
import 'package:roshetta/features/patients/doctor_details_patient_feature/presentation/screens/widgets/doctor_details_back_row.dart';
import 'package:roshetta/features/patients/doctor_details_patient_feature/presentation/screens/widgets/doctor_details_booking_summary.dart';
import 'package:roshetta/features/patients/doctor_details_patient_feature/presentation/screens/widgets/doctor_details_doctor_info.dart';
import 'package:roshetta/features/patients/home_patients_feature/data/models/home_doctor_model.dart';

const Map<int, String> arabicDays = {
  1: 'الاثنين',
  2: 'الثلاثاء',
  3: 'الأربعاء',
  4: 'الخميس',
  5: 'الجمعة',
  6: 'السبت',
  7: 'الأحد',
};

const Map<int, String> arabicMonths = {
  1: 'يناير',
  2: 'فبراير',
  3: 'مارس',
  4: 'أبريل',
  5: 'مايو',
  6: 'يونيو',
  7: 'يوليو',
  8: 'أغسطس',
  9: 'سبتمبر',
  10: 'أكتوبر',
  11: 'نوفمبر',
  12: 'ديسمبر',
};

class DoctorDetailsPatientScreen extends StatefulWidget {
  final HomeDoctorModel doctorData;

  const DoctorDetailsPatientScreen({super.key, required this.doctorData});

  @override
  State<DoctorDetailsPatientScreen> createState() =>
      _DoctorDetailsPatientScreenState();
}

class _DoctorDetailsPatientScreenState
    extends State<DoctorDetailsPatientScreen> {
  int _selectedDateIndex = 0;
  late List<Map<String, String>> _dates;
  bool _isBookingSuccess = false;

  @override
  void initState() {
    super.initState();
    _generateDates();
  }

  void _generateDates() {
    _dates = [];
    DateTime startDate = DateTime.now(); 
    for (int i = 0; i < 7; i++) {
      DateTime date = startDate.add(Duration(days: i));
      _dates.add({
        'dayName': arabicDays[date.weekday]!,
        'dayNumber': date.day.toString(),
        'month': arabicMonths[date.month]!,
        'value': '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}',
      });
    }
  }

  String get _selectedBookingDate =>
      _dates[_selectedDateIndex]['value'] ?? '';

  String _formatDate(String dateStr) {
    DateTime date = DateTime.parse(dateStr);
    return '${date.day} ${arabicMonths[date.month]} ${date.year}';
  }

  void _onConfirmBooking() {
    context.read<DoctorDetailsPatientBloc>().add(
          BookDoctorEvent(
            date: _selectedBookingDate,
            doctorId: widget.doctorData.userId,
          ),
        );
  }

  void _showToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorDetailsPatientBloc, DoctorDetailsPatientState>(
      listener: (context, state) {
        if (state is DoctorDetailsPatientSuccess) {
          setState(() {
            _isBookingSuccess = true;
          });
          _showToast('تم الحجز بنجاح');
        }

        if (state is DoctorDetailsPatientFailure) {
          _showToast(state.message);
        }
      },
      builder: (context, state) {
        final isLoading = state is DoctorDetailsPatientLoading;

        return Scaffold(
          body: Stack(
            children: [
              SafeArea(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const DoctorDetailsBackRow(),
                          SizedBox(height: 24.h),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 48.h),
                                child: context.isMobile
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          DoctorDetailsDoctorInfo(
                                            doctorData: widget.doctorData,
                                            dates: _dates,
                                            selectedDateIndex:
                                                _selectedDateIndex,
                                            onDateSelected: (index) {
                                              setState(() {
                                                _selectedDateIndex = index;
                                              });
                                            },
                                          ),
                                          SizedBox(height: 48.h),
                                            DoctorDetailsBookingSummary(
                                              bookingDate:
                                                  _formatDate(_selectedBookingDate),
                                              price: widget.doctorData.price
                                                      ?.toString() ??
                                                  '0',
                                              serviceType:
                                                  widget.doctorData.department,
                                              isLoading: isLoading,
                                              isSuccess: _isBookingSuccess,
                                              onConfirm: _onConfirmBooking,
                                            ),
                                        ],
                                      )
                                    : Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: DoctorDetailsDoctorInfo(
                                              doctorData: widget.doctorData,
                                              dates: _dates,
                                              selectedDateIndex:
                                                  _selectedDateIndex,
                                              onDateSelected: (index) {
                                                setState(() {
                                                  _selectedDateIndex = index;
                                                });
                                              },
                                            ),
                                          ),
                                          SizedBox(width: 100.w),
                                          Expanded(
                                            flex: 2,
                                            child: DoctorDetailsBookingSummary(
                                              bookingDate:
                                                  _formatDate(_selectedBookingDate),
                                              price: widget.doctorData.price
                                                      ?.toString() ??
                                                  '0',
                                              serviceType:
                                                  widget.doctorData.department,
                                              isLoading: isLoading,
                                              isSuccess: _isBookingSuccess,
                                              onConfirm: _onConfirmBooking,
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (isLoading)
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.2),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
