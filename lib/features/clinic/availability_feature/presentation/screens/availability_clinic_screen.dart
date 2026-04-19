import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/core/localization/app_localizations.dart';
import 'package:roshetta/features/clinic/availability_feature/data/model/availability_schedule_clinic_model.dart';
import 'package:roshetta/features/widgets/custom_primary_button.dart';
import 'package:roshetta/features/widgets/custom_text_form_field.dart';

class AvailabilityClinicScreen extends StatefulWidget {
  const AvailabilityClinicScreen({super.key});

  @override
  State<AvailabilityClinicScreen> createState() => _AvailabilityClinicScreenState();
}

class _AvailabilityClinicScreenState extends State<AvailabilityClinicScreen> {
  late List<AvailabilityScheduleClinicModel> days;
  late List<TextEditingController> _avgTimeControllers;
  late List<TextEditingController> _maxPatientsControllers;

  @override
  void initState() {
    super.initState();

    days = [
      AvailabilityScheduleClinicModel(
        day: 'monday',
        startTime: '09:00',
        endTime: '17:00',
        isVacation: 'false',
        averageConsultationTime: '30',
        maxVisits: '10',
      ),
    ];

    _avgTimeControllers = List.generate(
      days.length, 
      (index) => TextEditingController(text: days[index].averageConsultationTime)
    );
    _maxPatientsControllers = List.generate(
      days.length, 
      (index) => TextEditingController(text: days[index].maxVisits)
    );
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

  
  AvailabilityScheduleClinicModel _copyWith(
    AvailabilityScheduleClinicModel old, {
    String? startTime,
    String? endTime,
    String? isVacation,
    String? avgTime,
    String? maxVisits,
  }) {
    return AvailabilityScheduleClinicModel(
      day: old.day,
      startTime: startTime ?? old.startTime,
      endTime: endTime ?? old.endTime,
      isVacation: isVacation ?? old.isVacation,
      averageConsultationTime: avgTime ?? old.averageConsultationTime,
      maxVisits: maxVisits ?? old.maxVisits,
    );
  }

  Future<void> _selectTime(BuildContext context, int index, bool isStart) async {
    final currentTime = isStart ? days[index].startTime : days[index].endTime;
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
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  void _saveAvailability() {
    
    for (int i = 0; i < days.length; i++) {
      days[i] = _copyWith(
        days[i],
        avgTime: _avgTimeControllers[i].text,
        maxVisits: _maxPatientsControllers[i].text,
      );
    }

    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.tr('availability_updated_successfully')),
        backgroundColor: context.colorScheme.primary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
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
                  final day = days[index];
                  final bool isActive = day.isVacation == 'false';

                  return Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      color: context.colorScheme.surfaceVariant.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              context.tr(day.day),
                              style: context.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600),
                            ),
                            Switch.adaptive(
                              value: isActive,
                              onChanged: (value) {
                                setState(() {
                                  days[index] = _copyWith(day, isVacation: value ? 'false' : 'true');
                                });
                              },
                            ),
                          ],
                        ),
                        if (isActive) ...[
                          SizedBox(height: 20.h),
                          Row(
                            children: [
                              _timeTile(context, 'start_time', day.startTime, () => _selectTime(context, index, true)),
                              SizedBox(width: 12.w),
                              _timeTile(context, 'end_time', day.endTime, () => _selectTime(context, index, false)),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                  controller: _avgTimeControllers[index],
                                  txt: context.tr('avg_time_per_patient'),
                                  hint: '30',
                                  prefixIcon: Icons.schedule,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: CustomTextFormField(
                                  controller: _maxPatientsControllers[index],
                                  txt: context.tr('max_patients'),
                                  hint: '10',
                                  prefixIcon: Icons.groups,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
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
        ),
      ),
    );
  }

  Widget _timeTile(BuildContext context, String label, String time, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: context.colorScheme.background,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: context.colorScheme.outlineVariant),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.tr(label), style: context.textTheme.labelSmall),
              Text(time, style: context.textTheme.bodyLarge!.copyWith(color: context.colorScheme.primary, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}