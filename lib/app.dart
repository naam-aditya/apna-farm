import 'package:apna_farm/ui/screen/auth/signin/sign_in.dart';
import 'package:apna_farm/ui/widgets/nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ApnaFarm extends StatelessWidget {
  const ApnaFarm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Apna Farm',
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User? user = snapshot.data;
            return user == null
                ? const ApnaSignInScreen()
                : const ApnaBottomNavigationBar();
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
