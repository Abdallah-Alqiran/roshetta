import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';

class CustomImage extends StatelessWidget {
  final String? imagePath;
  final double? width;
  final double? height;
  final double? aspectRatio;
  final BorderRadiusGeometry? borderRadius;

  const CustomImage({
    super.key,
    this.imagePath,
    this.width,
    this.height,
    this.aspectRatio,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final double size = (width ?? height ?? 50);
    final double radius = size / 2;

    return CircleAvatar(
      radius: radius.r,
      backgroundImage: CachedNetworkImageProvider(
        imagePath ??
            'https://i.pinimg.com/736x/77/97/7e/77977e0f51ec76e51b1360e5f0685d13.jpg',
      ),
      onBackgroundImageError: (_, __) {},
      child: (imagePath == null || imagePath!.isEmpty)
          ? Icon(
              Icons.person,
              color: context.colorScheme.outline,
              size: radius.r,
            )
          : null,
    );
  }
}
