import 'package:chat/ConstantFile.dart';
import 'package:chat/presentation/view/widgets/Custom_Chat.dart';
import 'package:chat/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static String id = 'ChatPage';
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessageCollection);
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kPrimaryImage,
              width: 32,
            ),
            Text(
              'Chat',
              style: TextStyle(color: AppColor.white),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return CustomChat();
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                messages.add({'message': data});

                controller.clear();
              },
              decoration: InputDecoration(
                hintText: 'Send Message',
                suffixIcon: Icon(
                  Icons.send,
                  color: kPrimaryColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: kPrimaryColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
