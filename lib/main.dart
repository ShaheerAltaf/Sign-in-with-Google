import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_practice/Auth/sign_in.dart';
import 'package:firebase_practice/Global/global.dart';
import 'package:firebase_practice/Screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firbase Practice',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: fAuth.currentUser != null ? const Dashboard() : const SignIn(),
    );
  }
}
