import 'package:chat/ConstantFile.dart';
import 'package:chat/presentation/view/Screens/Regster_Screen.dart';
import 'package:chat/presentation/view/widgets/Custom_Button.dart';
import 'package:chat/presentation/view/widgets/Custom_Icon.dart';
import 'package:chat/presentation/view/widgets/Custom_Text.dart';
import 'package:chat/presentation/view/widgets/Custom_Text_Filed.dart';
import 'package:chat/presentation/view/widgets/Custom_Title.dart';
import 'package:chat/utils/app_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Chat extends StatefulWidget {
  Chat({super.key});

  static String id = 'LoginPage';
  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              const CustomIcon(),
              const CustomTitle(),
              const SizedBox(
                height: 70,
              ),
              const CustomText(
                text: 'LOGIN',
              ),
              CustomTextFiled(
                onChange: (data) {
                  email = data;
                },
                text: 'Login',
              ),
              CustomTextFiled(
                obscure: true,
                onChange: (data) {
                  password = data;
                },
                text: 'Password',
              ),
              CustomButton(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    isLoading = true;
                    setState(() {});
                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: email!, password: password!);
                      Navigator.pushNamed(context, Chat.id, arguments: email);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        snakeBarMsg2(context, 'No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        snakeBarMsg2(
                            context, 'Wrong password provided for that user.');
                      } else if (e.code == 'invalid-credential') {
                        snakeBarMsg2(
                            context, 'there was an error Invalid-credential');
                      }
                    }
                    isLoading = false;
                    setState(() {});
                  } else {
                    snakeBarMsg2(context, 'there was an error');
                  }
                },
                text: 'Login',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don\'t have an account",
                    style: TextStyle(
                        color: AppColor.white, fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Regsterpage.id);
                    },
                    child: const Text('Regster'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void snakeBarMsg2(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
