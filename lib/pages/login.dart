import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: [
      // Image.asset(),
      const Text('Sign In.',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50)),
      const SizedBox(height: 50)
    ]))));
  }
}
