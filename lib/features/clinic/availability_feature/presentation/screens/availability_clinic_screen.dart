import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/core/localization/app_localizations.dart';
import 'package:roshetta/features/clinic/availability_feature/data/model/availability_schedule_clinic_model.dart';
import 'package:roshetta/features/clinic/availability_feature/presentation/bloc/availability_clinic_bloc.dart';
import 'package:roshetta/features/clinic/availability_feature/presentation/bloc/availability_clinic_event.dart';
import 'package:roshetta/features/clinic/availability_feature/presentation/bloc/availability_clinic_state.dart';
import 'package:roshetta/features/clinic/availability_feature/presentation/widgets/availability_day_card.dart';
import 'package:roshetta/features/widgets/custom_primary_button.dart';

class AvailabilityClinicScreen extends StatefulWidget {
  const AvailabilityClinicScreen({super.key});

  @override
  State<AvailabilityClinicScreen> createState() =>
      _AvailabilityClinicScreenState();
}

class _AvailabilityClinicScreenState extends State<AvailabilityClinicScreen> {
  late List<AvailabilityScheduleClinicModel> days;
  late List<TextEditingController> _avgTimeControllers;
  late List<TextEditingController> _maxPatientsControllers;

  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    days = [];
    _avgTimeControllers = [];
    _maxPatientsControllers = [];

    context
        .read<AvailabilityClinicBloc>()
        .add(GetAvailabilityClinicScheduleEvent());
  }

  @override
  void dispose() {
    for (var c in _avgTimeControllers) {
      c.dispose();
    }
    for (var c in _maxPatientsControllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _initializeControllers(List<AvailabilityScheduleClinicModel> schedules) {
    if (_avgTimeControllers.isNotEmpty) {
      for (var c in _avgTimeControllers) {
        c.dispose();
      }
    }
    if (_maxPatientsControllers.isNotEmpty) {
      for (var c in _maxPatientsControllers) {
        c.dispose();
      }
    }

    _avgTimeControllers = List.generate(
      schedules.length,
      (index) => TextEditingController(
        text: schedules[index].averageConsultationTime.toString(),
      ),
    );
    _maxPatientsControllers = List.generate(
      schedules.length,
      (index) => TextEditingController(
        text: schedules[index].maxVisits.toString(),
      ),
    );
  }

  AvailabilityScheduleClinicModel _copyWith(
    AvailabilityScheduleClinicModel old, {
    String? startTime,
    String? endTime,
    bool? isVacation,
    int? avgTime,
    int? maxVisits,
  }) {
    return AvailabilityScheduleClinicModel(
      scheduleId: old.scheduleId,
      day: old.day,
      startTime: startTime ?? old.startTime,
      endTime: endTime ?? old.endTime,
      isVacation: isVacation ?? old.isVacation,
      averageConsultationTime: avgTime ?? old.averageConsultationTime,
      maxVisits: maxVisits ?? old.maxVisits,
    );
  }

  Future<void> _selectTime(
      BuildContext context, int index, bool isStart) async {
    if (days[index].isVacation) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.tr('cannot_set_time_vacation_day')),
          backgroundColor: context.colorScheme.error,
        ),
      );
      return;
    }

    final currentTime =
        isStart ? days[index].startTime : days[index].endTime;
    final timeParts = currentTime.split(':');

    final TimeOfDay initialTime = TimeOfDay(
      hour: int.parse(timeParts[0]),
      minute: int.parse(timeParts[1]),
    );

    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (picked != null) {
      setState(() {
        final formatted = _formatTime(picked);
        days[index] = isStart
            ? _copyWith(days[index], startTime: formatted)
            : _copyWith(days[index], endTime: formatted);
      });
    }
  }

  String _formatTime(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00';
  }

  void _saveAvailability() {
    for (int i = 0; i < days.length; i++) {
      final avgTime = int.tryParse(_avgTimeControllers[i].text) ??
          days[i].averageConsultationTime;
      final maxVisits =
          int.tryParse(_maxPatientsControllers[i].text) ?? days[i].maxVisits;

      if (days[i].isVacation) {
        days[i] = _copyWith(
          days[i],
          startTime: '00:00:00',
          endTime: '00:00:00',
          avgTime: avgTime,
          maxVisits: maxVisits,
        );
      } else {
        days[i] = _copyWith(
          days[i],
          avgTime: avgTime,
          maxVisits: maxVisits,
        );
      }
    }

    context.read<AvailabilityClinicBloc>().add(
          UpdateAvailabilityClinicScheduleEvent(availabilitySchedules: days),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: SafeArea(
        child: BlocListener<AvailabilityClinicBloc, AvailabilityClinicState>(
          listener: (context, state) {
            if (state is AvailabilityClinicLoaded && _initialized) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    context.tr('availability_updated_successfully'),
                  ),
                  backgroundColor: context.colorScheme.primary,
                ),
              );
            } else if (state is AvailabilityClinicError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: context.colorScheme.error,
                ),
              );
            } else if (state is AvailabilityClinicLoaded && !_initialized) {
              setState(() {
                days = List.from(state.availabilitySchedule);
                _initializeControllers(days);
                _initialized = true;
              });
            }
          },
          child: BlocBuilder<AvailabilityClinicBloc, AvailabilityClinicState>(
            builder: (context, state) => _buildContent(context, state),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, AvailabilityClinicState state) {
    if (state is AvailabilityClinicLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is AvailabilityClinicError) {
      _initialized = false;
      return _buildErrorState(context, state.message);
    }

    if (state is AvailabilityClinicLoaded) {
      return _buildLoadedState(context);
    }

    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            color: context.colorScheme.error,
            size: 48.w,
          ),
          SizedBox(height: 16.h),
          Text(
            context.tr('error_loading_availability'),
            style: context.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            message,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.error,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          CustomPrimaryButton(
            text: context.tr('retry'),
            onTap: () {
              context
                  .read<AvailabilityClinicBloc>()
                  .add(GetAvailabilityClinicScheduleEvent());
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLoadedState(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.tr('availability_settings'),
              style: context.textTheme.displaySmall!.copyWith(
                color: context.colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40.h),
            ...List.generate(days.length, (index) {
              return AvailabilityDayCard(
                day: days[index],
                index: index,
                avgTimeController: _avgTimeControllers[index],
                maxPatientsController: _maxPatientsControllers[index],
                onDayUpdated: (updatedDay) {
                  setState(() {
                    days[index] = updatedDay;
                  });
                },
                onSelectTime: (dayIndex, isStart) =>
                    _selectTime(context, dayIndex, isStart),
              );
            }),
            SizedBox(height: 16.h),
            CustomPrimaryButton(
              text: context.tr('save_availability'),
              onTap: _saveAvailability,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}