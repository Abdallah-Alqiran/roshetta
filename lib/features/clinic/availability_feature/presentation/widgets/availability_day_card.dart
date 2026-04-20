import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/core/localization/app_localizations.dart';
import 'package:roshetta/features/clinic/availability_feature/data/model/availability_schedule_clinic_model.dart';
import 'package:roshetta/features/widgets/custom_text_form_field.dart';

class AvailabilityDayCard extends StatefulWidget {
  final AvailabilityScheduleClinicModel day;
  final int index;
  final TextEditingController avgTimeController;
  final TextEditingController maxPatientsController;
  final Function(AvailabilityScheduleClinicModel) onDayUpdated;
  final Function(int, bool) onSelectTime;

  const AvailabilityDayCard({
    super.key,
    required this.day,
    required this.index,
    required this.avgTimeController,
    required this.maxPatientsController,
    required this.onDayUpdated,
    required this.onSelectTime,
  });

  @override
  State<AvailabilityDayCard> createState() => _AvailabilityDayCardState();
}

class _AvailabilityDayCardState extends State<AvailabilityDayCard> {
  late bool isActive;

  @override
  void initState() {
    super.initState();
    isActive = !widget.day.isVacation;
  }

  @override
  void didUpdateWidget(covariant AvailabilityDayCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.day != widget.day && oldWidget.day.isVacation != widget.day.isVacation) {
      setState(() {
        isActive = !widget.day.isVacation;
      });
    }
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceVariant.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.day.day,
                style: context.textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Switch.adaptive(
                value: isActive,
                onChanged: (value) {
                  setState(() {
                    isActive = value;
                  });
                  widget.onDayUpdated(_copyWith(widget.day, isVacation: !value));
                },
              ),
            ],
          ),
          if (isActive) ...[
            SizedBox(height: 20.h),
            Row(
              children: [
                _timeTile(
                  context,
                  'start_time',
                  _formatTimeForDisplay(widget.day.startTime),
                  () => widget.onSelectTime(widget.index, true),
                ),
                SizedBox(width: 12.w),
                _timeTile(
                  context,
                  'end_time',
                  _formatTimeForDisplay(widget.day.endTime),
                  () => widget.onSelectTime(widget.index, false),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    controller: widget.avgTimeController,
                    txt: context.tr('avg_time_per_patient'),
                    hint: '30',
                    prefixIcon: Icons.schedule,
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: CustomTextFormField(
                    controller: widget.maxPatientsController,
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
  }

  Widget _timeTile(BuildContext context, String label, String time,
      VoidCallback onTap) {
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
              Text(context.tr(label),
                  style: context.textTheme.labelSmall),
              Text(time,
                  style: context.textTheme.bodyLarge!.copyWith(
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTimeForDisplay(String time) {
    final parts = time.split(':');
    if (parts.length >= 2) {
      return '${parts[0]}:${parts[1]}';
    }
    return time;
  }
}
