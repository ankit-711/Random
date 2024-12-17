import 'package:flutter/material.dart';
import 'package:seawindtask/chat_screen.dart';
import 'package:seawindtask/post_api_screen.dart';
import 'package:seawindtask/user_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Screen',
      debugShowCheckedModeBanner: false,
      home: UserList(),
    );
  }
}

