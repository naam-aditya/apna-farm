import 'package:apna_farm/service/auth_service.dart';
import 'package:apna_farm/ui/screen/auth/signin/sign_in.dart';
// import 'package:apna_farm/ui/screen/auth/signup/sign_up_success.dart';
import 'package:apna_farm/ui/widgets/input_fields.dart';
import 'package:apna_farm/ui/widgets/nav.dart';
import 'package:flutter/material.dart';

class ApnaSignUpScreen extends StatefulWidget {
  const ApnaSignUpScreen({super.key});

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const ApnaSignUpScreen());

  @override
  State<ApnaSignUpScreen> createState() => _ApnaSignUpScreenState();
}

class _ApnaSignUpScreenState extends State<ApnaSignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  void signUp(context) async {
    String email = _emailController.text;
    String password = _passwordController.text;

    var user = await _authService.signUpWithEmailAndPassword(email, password);
    if (user != null) {
      Navigator.pushAndRemoveUntil(
        context,
        ApnaBottomNavigationBar.route(),
        (route) => false,
      );
    } else {
      throw Exception('Sign In Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Create Account',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 28),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        prefixIcon: Icon(Icons.person_outline),
                        prefixIconColor: Colors.grey,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ApnaTextFormEmailField(controller: _emailController),
                    const SizedBox(height: 16),
                    ApnaTextFormPasswordField(controller: _passwordController),
                    const SizedBox(height: 36),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 58),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () => signUp(context),
                      child: Text('Sign Up', style: TextStyle(fontSize: 17)),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        minimumSize: const Size(double.infinity, 58),
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        foregroundColor:
                            Theme.of(context).colorScheme.onSurface,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed:
                          () => Navigator.pushAndRemoveUntil(
                            context,
                            ApnaSignInScreen.route(),
                            (Route<dynamic> route) => false,
                          ),
                      child: Text('Sign In', style: TextStyle(fontSize: 17)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
