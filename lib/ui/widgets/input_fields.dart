import 'package:flutter/material.dart';

class ApnaTextFormEmailField extends StatelessWidget {
  final TextEditingController? controller;

  const ApnaTextFormEmailField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    final emptyEmailMessage = 'Email is required';
    final emailRegex = r'^[^@]+@[^@]+\.[^@]+';
    final invalidEmailMessage = 'Enter a valid email';

    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        prefixIcon: Icon(Icons.email_outlined),
        prefixIconColor: Colors.grey,
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return emptyEmailMessage;
        } else if (!RegExp(emailRegex).hasMatch(value)) {
          return invalidEmailMessage;
        }
        return null;
      },
    );
  }
}

class ApnaTextFormPasswordField extends StatelessWidget {
  final TextEditingController? controller;

  const ApnaTextFormPasswordField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    final emptyPasswordMessage = 'Enter Password';
    final invalidPasswordMessage = 'Password must be at least 6 characters';

    return TextFormField(
      controller: controller,
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return emptyPasswordMessage;
        } else if (value.length < 6) {
          return invalidPasswordMessage;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: Icon(Icons.lock_outline),
        prefixIconColor: Colors.grey,
        border: OutlineInputBorder(),
      ),
    );
  }
}
