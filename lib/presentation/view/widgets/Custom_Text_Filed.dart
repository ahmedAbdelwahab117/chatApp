import 'package:chat/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  CustomTextFiled({
    super.key,
    this.onChange,
    required this.text,
  });
  final String text;
  Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: TextFormField(
        validator: (data) {
          if (data!.isEmpty) {
            return 'enter your data';
          }
        },
        onChanged: onChange,
        decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(color: AppColor.white),
            border: const OutlineInputBorder()),
      ),
    );
  }
}
