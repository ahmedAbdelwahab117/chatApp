import 'package:chat/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  CustomTextFiled(
      {super.key, this.onChange, required this.text, this.obscure = false});
  final String text;
  final bool obscure;
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
        obscureText: obscure,
        onChanged: onChange,
        decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(color: AppColor.white),
            border: const OutlineInputBorder()),
      ),
    );
  }
}
