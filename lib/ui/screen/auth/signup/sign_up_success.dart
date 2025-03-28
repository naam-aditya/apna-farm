import 'package:flutter/material.dart';

class ApnaSignUpSuccessScreen extends StatelessWidget {
  const ApnaSignUpSuccessScreen({super.key});

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const ApnaSignUpSuccessScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Account Successfully Created!',
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
