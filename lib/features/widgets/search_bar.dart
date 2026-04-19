import 'package:flutter/material.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/core/utils/get_responsive_size.dart';

class CustomSearchBarr extends StatefulWidget {
  final String hint;
  final double? w;
  final double? h;
  final double? r;
  final Color? color;
  final Color? fillColor;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController controller;
  const CustomSearchBarr({
    super.key,
    required this.hint,
    this.w,
    this.h,
    this.r,
    this.color,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
  });

  @override
  State<CustomSearchBarr> createState() => _SearchBar();
}

class _SearchBar extends State<CustomSearchBarr> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
          widget.w ??
          getResponsiveSize(context: context, webSize: 550, mobileSize: 250),
      height: widget.h ?? getResponsiveSize(context: context, webSize: 60, mobileSize: 50),
      child: TextFormField(
        controller: widget.controller,
        style: context.textTheme.labelMedium?.copyWith(
          color: context.colorScheme.onSurface,
          fontSize: getResponsiveSize(
            context: context,
            webSize: 16,
            mobileSize: 14,
          ),
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.fillColor ?? Colors.transparent,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.r ?? 8.0),
            borderSide: BorderSide(
              color: widget.color ?? Colors.grey.shade300,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.r ?? 8.0),
            borderSide: BorderSide(
              color: context.colorScheme.primary,
              width: 1.5,
            ),
          ),
          prefixIcon: widget.prefixIcon != null
              ? Icon(widget.prefixIcon, size: 20)
              : null,
          suffixIcon: widget.suffixIcon != null
              ? Icon(widget.suffixIcon, size: 20)
              : null,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          hintText: widget.hint,
          hintStyle: context.textTheme.labelMedium?.copyWith(
            color: context.colorScheme.onSurface.withValues(alpha: 0.4),
          ),
        ),
        cursorHeight: 24,
        cursorColor: context.colorScheme.primary,
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
