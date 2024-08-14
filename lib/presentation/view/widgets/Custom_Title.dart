import 'package:chat/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Frindely',
          style: TextStyle(
              fontFamily: 'DM Serif Display',
              fontSize: 32,
              color: AppColor.white),
        ),
        Text(
          ' Chat',
          style: TextStyle(
              fontFamily: 'DM Serif Display',
              fontSize: 32,
              color: AppColor.white),
        ),
      ],
    );
  }
}
