import 'package:firebase_practice/Global/global.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Dashboard Body'),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                fAuth.signOut();
              },
              child: const Text('Log out'))
        ],
      ),
    );
  }
}
