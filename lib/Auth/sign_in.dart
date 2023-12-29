import 'package:firebase_practice/Global/global.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  signInWithGoogle(context);
                  const CircularProgressIndicator.adaptive();
                },
                child: const Text('Sign in With Google')),
          )
        ],
      ),
    );
  }
}
