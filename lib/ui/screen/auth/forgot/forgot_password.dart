import 'package:apna_farm/service/auth_service.dart';
import 'package:apna_farm/ui/screen/auth/signin/sign_in.dart';
import 'package:apna_farm/ui/widgets/input_fields.dart';
import 'package:flutter/material.dart';

class ApnaForgotPasswordScreen extends StatefulWidget {
  const ApnaForgotPasswordScreen({super.key});

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => ApnaForgotPasswordScreen());

  @override
  State<ApnaForgotPasswordScreen> createState() =>
      _ApnaForgotPasswordScreenState();
}

class _ApnaForgotPasswordScreenState extends State<ApnaForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final AuthService _authService = AuthService();

  void sendOtpForPasswordReset() {
    String email = _emailController.text;

    try {
      _authService.sendPasswordResetEmail(email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Password reset email sent! Check you inbox.'),
        ),
      );

      Navigator.push(context, ApnaSignInScreen.route());
    } catch (error) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: const Text('Something went Wrong')));
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
                'Reset Password',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 28),
              Form(
                child: Column(
                  children: [
                    ApnaTextFormEmailField(controller: _emailController),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        minimumSize: const Size(double.infinity, 58),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: sendOtpForPasswordReset,
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 17),
                      ),
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
