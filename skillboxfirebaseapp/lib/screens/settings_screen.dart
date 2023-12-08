import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skillboxfirebaseapp/screens/login_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings'
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text('First ListTile'),
            Divider(),
            ElevatedButton(
              onPressed: () {
                // Exit from account !!!
                _firebaseAuth.signOut();
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                // Navigator.pushAndRemoveUntil(
                //   context, 
                //   '/login', // TODO: Debug this route !!!
                //   // MaterialPageRoute(builder: (context) => const LoginScreen()), 
                //   (route) => false);
              }, 
              child: Text('Exit')
            )
          ],
        ),
      ),
    );
  }
}