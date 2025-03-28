import 'package:apna_farm/service/auth_service.dart';
import 'package:apna_farm/ui/screen/auth/signin/sign_in.dart';
import 'package:apna_farm/ui/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class ApnaProfileScreen extends StatefulWidget {
  const ApnaProfileScreen({super.key});

  @override
  State<ApnaProfileScreen> createState() => _ApnaProfileScreenState();
}

class _ApnaProfileScreenState extends State<ApnaProfileScreen> {
  final AuthService _authService = AuthService();

  void signOut(context) {
    _authService.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      ApnaSignInScreen.route(),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApnaAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Icon(
                              Icons.person,
                              size: 70,
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 26),
                      Column(
                        children: [
                          Text(
                            'User Name',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color:
                                  Theme.of(context).colorScheme.inverseSurface,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              'user@email.com',
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.inverseSurface,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Text(
              //       'Account Information',
              //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              //     ),
              //   ],
              // ),
              ListTile(
                leading: Icon(Icons.settings_outlined, size: 34),
                title: const Text(
                  'Settings',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Configure profile settings'),
              ),
              ListTile(
                leading: Icon(Icons.location_on_outlined, size: 34),
                title: const Text(
                  'Addresses',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('VIew save addresses'),
              ),
              ListTile(
                leading: Icon(Icons.shopping_bag_outlined, size: 34),
                title: const Text(
                  'My Orders',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('View your Orders'),
              ),
              ListTile(
                leading: Icon(Icons.security_outlined, size: 34),
                title: const Text(
                  'Privacy',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Configure your privacy'),
              ),
              ListTile(
                leading: Icon(Icons.vpn_key_outlined, size: 34),
                title: const Text(
                  'Change Password',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Change account password'),
              ),
              const SizedBox(height: 24),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Text(
              //       'Account Information',
              //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              //     ),
              //   ],
              // ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: const Size(double.infinity, 58),
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () => signOut(context),
                child: Text('Log Out', style: TextStyle(fontSize: 17)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
