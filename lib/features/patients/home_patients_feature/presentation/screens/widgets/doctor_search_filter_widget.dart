import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/core/localization/app_localizations.dart';

class DoctorSearchFilterWidget extends StatefulWidget {
  const DoctorSearchFilterWidget({super.key});

  @override
  State<DoctorSearchFilterWidget> createState() =>
      _DoctorSearchFilterWidgetState();
}

class _DoctorSearchFilterWidgetState extends State<DoctorSearchFilterWidget> {
  final TextEditingController _doctorNameController = TextEditingController();
  final TextEditingController _specializationController =
      TextEditingController();

  @override
  void dispose() {
    _doctorNameController.dispose();
    _specializationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 1,
            child: _buildInputColumn(
              context: context,
              label: context.tr('doctor_name'),
              hint: context.tr('search_by_name'),
              icon: Icons.search,
              controller: _doctorNameController,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            flex: 1,
            child: _buildInputColumn(
              context: context,
              label: context.tr('specialization'),
              hint: context.tr('choose_specialization'),
              icon: Icons.medical_services_outlined,
              controller: _specializationController,
            ),
          ),
          SizedBox(width: 16.w),
          ElevatedButton.icon(
            onPressed: () {
              // TODO: Implement search functionality
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colorScheme.primary,
              foregroundColor: context.colorScheme.onPrimary,
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 32.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              elevation: 0,
            ),
            icon: Icon(Icons.search, size: 20.sp),
            label: Text(
              context.tr('search'),
              style: context.textTheme.titleMedium?.copyWith(
                color: context.colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputColumn({
    required BuildContext context,
    required String label,
    required String hint,
    required IconData icon,
    bool isDropdown = false,
    TextEditingController? controller,
    VoidCallback? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8.h, right: 4.w),
          child: Text(
            label,
            style: context.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colorScheme.scrim,
            ),
          ),
        ),
        isDropdown
            ? InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  height: 56.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: context.colorScheme.scrim.withValues(alpha: 0.1),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          hint,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.labelLarge?.copyWith(
                            color: context.colorScheme.scrim.withValues(
                              alpha: 0.4,
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        icon,
                        color: context.colorScheme.scrim.withValues(alpha: 0.4),
                        size: 20.sp,
                      ),
                    ],
                  ),
                ),
              )
            : TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: context.textTheme.labelLarge?.copyWith(
                    color: context.colorScheme.scrim.withValues(alpha: 0.4),
                  ),
                  suffixIcon: Icon(
                    icon,
                    color: context.colorScheme.scrim.withValues(alpha: 0.4),
                    size: 20.sp,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: context.colorScheme.scrim.withValues(alpha: 0.1),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: context.colorScheme.scrim.withValues(alpha: 0.1),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: context.colorScheme.primary.withValues(alpha: 0.5),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
