import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta/core/extensions/context_extensions.dart';
import 'package:roshetta/features/widgets/custom_img.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "نظام إداره العياده ",
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colorScheme.primary,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_outlined,
            color: context.colorScheme.scrim,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings_outlined, color: context.colorScheme.scrim),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.logout, color: context.colorScheme.scrim),
        ),
        SizedBox(width: 16.w),
        CustomImage(
          imagePath:
              "https://i.pinimg.com/1200x/7d/cb/a1/7dcba1185f62ae8e7ee801a1de182c77.jpg",
          width: 50,
          height: 50,
        ),
      ],
    );
  }
}
