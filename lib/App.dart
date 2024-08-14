import 'package:chat/presentation/view/Screens/Chat_Screen.dart';
import 'package:chat/presentation/view/Screens/Login_Screen.dart';
import 'package:chat/presentation/view/Screens/Regster_Screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Chat.id: (context) => Chat(),
        Regsterpage.id: (context) => Regsterpage(),
        Chat.id: (context) => ChatPage(),
      },
      debugShowCheckedModeBanner: false,
      home: Chat(),
    );
  }
}
