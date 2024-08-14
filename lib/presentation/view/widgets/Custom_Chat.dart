import 'package:chat/ConstantFile.dart';
import 'package:chat/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomChat extends StatelessWidget {
  const CustomChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          padding: EdgeInsets.only(bottom: 28, left: 16, right: 16, top: 28),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(28),
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            ),
          ),
          child: Text(
            'Hello , Iam New User Here',
            style: TextStyle(color: AppColor.white),
          ),
        ),
      ),
    );
  }
}
