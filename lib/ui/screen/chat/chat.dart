import 'package:flutter/material.dart';

class ApnaChatScreen extends StatelessWidget {
  const ApnaChatScreen({super.key});

  static Route route() =>
      MaterialPageRoute(builder: (_) => const ApnaChatScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: TextField(
        decoration: InputDecoration(prefixIcon: Icon(Icons.emoji_emotions)),
      ),
    );
  }
}
