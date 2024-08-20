import 'package:chat/ConstantFile.dart';
import 'package:chat/presentation/view/Screens/Login_Screen.dart';
import 'package:chat/presentation/view/widgets/Custom_Button.dart';
import 'package:chat/presentation/view/widgets/Custom_Icon.dart';
import 'package:chat/presentation/view/widgets/Custom_Text.dart';
import 'package:chat/presentation/view/widgets/Custom_Text_Filed.dart';
import 'package:chat/presentation/view/widgets/Custom_Title.dart';
import 'package:chat/utils/app_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Regsterpage extends StatefulWidget {
  Regsterpage({super.key});
  static String id = 'RegsterPage';

  @override
  State<Regsterpage> createState() => _RegsterpageState();
}

class _RegsterpageState extends State<Regsterpage> {
  String? email;

  bool isLoading = false;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

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
                text: 'REGISTER',
              ),
              CustomTextFiled(
                text: 'Email',
                onChange: (data) {
                  email = data;
                },
              ),
              CustomTextFiled(
                obscure: true,
                text: 'Password',
                onChange: (data) {
                  password = data;
                },
              ),
              CustomButton(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    isLoading = true;
                    setState(() {});
                    try {
                      final credential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: email!,
                        password: password!,
                      );
                      Navigator.pushNamed(context, Chat.id, arguments: email);
                      Navigator.pop(context);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        snakeBarMsg(
                            context, 'The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        snakeBarMsg(context,
                            'The account already exists for that email.');
                      }
                    }
                    isLoading = false;
                    setState(() {});
                  } else {
                    snakeBarMsg(context, 'there was an error');
                  }
                },
                text: 'Register',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account",
                    style: TextStyle(
                        color: AppColor.white, fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Login'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void snakeBarMsg(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }
}
