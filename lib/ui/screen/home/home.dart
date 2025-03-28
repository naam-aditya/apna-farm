import 'package:apna_farm/ui/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class ApnaHomeScreen extends StatefulWidget {
  const ApnaHomeScreen({super.key});

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const ApnaHomeScreen());

  @override
  State<ApnaHomeScreen> createState() => _ApnaHomeScreenState();
}

class _ApnaHomeScreenState extends State<ApnaHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApnaAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              SearchBar(
                hintText: 'Search',
                leading: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(Icons.search),
                ),
                elevation: WidgetStateProperty.all(0),
                backgroundColor: WidgetStateProperty.all(Colors.white),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Image(
                        image: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/3982/3982173.png',
                        ),
                      ),
                      Column(
                        children: [const Text('Sunny Day'), const Text('32`C')],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
