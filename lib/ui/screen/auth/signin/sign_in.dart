import 'package:apna_farm/service/auth_service.dart';
import 'package:apna_farm/ui/widgets/input_fields.dart';
import 'package:apna_farm/ui/widgets/nav.dart';
import 'package:apna_farm/ui/screen/auth/forgot/forgot_password.dart';
import 'package:apna_farm/ui/screen/auth/signup/sign_up.dart';
import 'package:flutter/material.dart';

class ApnaSignInScreen extends StatefulWidget {
  const ApnaSignInScreen({super.key});

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const ApnaSignInScreen());

  @override
  State<ApnaSignInScreen> createState() => _ApnaSignInScreenState();
}

class _ApnaSignInScreenState extends State<ApnaSignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  void signIn(context) async {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text('Please enter valid details')),
      );
      return;
    }

    String email = _emailController.text;
    String password = _passwordController.text;

    setState(() {
      _isLoading = true;
    });

    try {
      var user = await _authService.signInWithEmailAndPassword(email, password);
      if (user != null) {
        Navigator.pushAndRemoveUntil(
          context,
          ApnaBottomNavigationBar.route(),
          (route) => false,
        );
      } else {
        throw Exception('Sign In Failed');
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() {
        _isLoading = false;
      });
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
                'Welcome Back!',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 28),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    ApnaTextFormEmailField(controller: _emailController),
                    const SizedBox(height: 16),
                    ApnaTextFormPasswordField(controller: _passwordController),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed:
                              () => Navigator.push(
                                context,
                                ApnaForgotPasswordScreen.route(),
                              ),
                          child: Text('Forgot Password?'),
                        ),
                      ],
                    ),
                    _isLoading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 58),
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            foregroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onPressed: () => signIn(context),
                          child: Text(
                            'Sign In',
                            style: TextStyle(fontSize: 17),
                          ),
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
                          () =>
                              Navigator.push(context, ApnaSignUpScreen.route()),
                      child: Text('Sign Up', style: TextStyle(fontSize: 17)),
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
