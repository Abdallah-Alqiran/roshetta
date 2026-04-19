import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';

class CustomImage extends StatelessWidget {
  final String? imagePath;
  final double? width;
  final double? height;

  const CustomImage({super.key, this.imagePath, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    final double size = (width ?? height ?? 50);

    if (imagePath == null || imagePath!.trim().isEmpty) {
      return _buildPlaceholder(context, size);
    }

    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: imagePath!,
        width: size.w,
        height: size.w,
        fit: BoxFit.cover,

        placeholder: (context, url) => SizedBox(
          width: size.w,
          height: size.w,
          child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
        ),

        errorWidget: (context, url, error) {
          print("IMAGE ERROR: $error");
          return _buildPlaceholder(context, size);
        },
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context, double size) {
    return Container(
      width: size.w,
      height: size.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.colorScheme.surface,
      ),
      child: Icon(
        Icons.person,
        color: context.colorScheme.outline,
        size: (size / 2).r,
      ),
    );
  }
}
