import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:skillboxfirebaseapp/screens/login_screen.dart';
import 'package:skillboxfirebaseapp/screens/signup_screen.dart';
import 'package:skillboxfirebaseapp/screens/todolist_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple
        ),
        useMaterial3: true,
      ),
      // home: const TodoListScreen(),
      routes: {
        '/': (context) => const LoginScreen(),
        '/login': (context) => const LoginScreen(),
        'signUp': (context) => const SignUpScreen(),
        '/home': (context) => const TodoListScreen(),
      },
    );
  }
}
