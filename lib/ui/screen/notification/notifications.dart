import 'package:apna_farm/ui/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class ApnaNotificationScreen extends StatelessWidget {
  const ApnaNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApnaAppBar(),
      body: SingleChildScrollView(),
    );
  }
}