import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';

class CustomRadioButton<T> extends StatefulWidget {
  final T? initialValue;
  final Function(T?) onChanged;
  final List<CustomRadioItem<T>> items;
  final Axis direction;
  final double spacing;

  const CustomRadioButton({
    super.key,
    this.initialValue,
    required this.onChanged,
    required this.items,
    this.direction = Axis.horizontal,
    this.spacing = 12,
  });

  @override
  State<CustomRadioButton<T>> createState() => _CustomRadioButtonState<T>();
}

class _CustomRadioButtonState<T> extends State<CustomRadioButton<T>> {
  late T? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: widget.direction,
      children: List.generate(widget.items.length, (index) {
        final item = widget.items[index];
        final isSelected = _selectedValue == item.value;
        
        return widget.direction == Axis.horizontal
            ? Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: index < widget.items.length - 1 ? widget.spacing.w : 0,
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedValue = item.value;
                      });
                      widget.onChanged(item.value);
                    },
                    borderRadius: BorderRadius.circular(8.r),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: isSelected
                            ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.05)
                            : Colors.transparent,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio<T>(
                            value: item.value,
                            groupValue: _selectedValue,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value;
                              });
                              widget.onChanged(value);
                            },
                            activeColor: Theme.of(context).colorScheme.primary,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            item.label,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: isSelected
                                  ? context.colorScheme.primary
                                  : context.colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Padding(
                padding: EdgeInsets.only(
                  bottom: index < widget.items.length - 1 ? widget.spacing.h : 0,
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedValue = item.value;
                    });
                    widget.onChanged(item.value);
                  },
                  borderRadius: BorderRadius.circular(8.r),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.05)
                          : Colors.transparent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio<T>(
                          value: item.value,
                          groupValue: _selectedValue,
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value;
                            });
                            widget.onChanged(value);
                          },
                          activeColor: Theme.of(context).colorScheme.primary,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          item.label,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? context.colorScheme.primary
                                : context.colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }
}

class CustomRadioItem<T> {
  final T value;
  final String label;

  const CustomRadioItem({
    required this.value,
    required this.label,
  });
}