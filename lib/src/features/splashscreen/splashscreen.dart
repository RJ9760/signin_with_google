import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo/src/features/auth/presentation/screens/login_screen.dart';
import 'package:todo/src/features/homescreen/homescreen.dart';

class Splachscreen extends StatefulWidget {
  const Splachscreen({super.key});

  @override
  State<Splachscreen> createState() => _SplachscreenState();
}

class _SplachscreenState extends State<Splachscreen> {
  @override
    void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      // Check if a current active session exists
      final currentUser = Supabase.instance.client.auth.currentSession;

      if (currentUser != null) {
        // User is logged in, navigate to Home Screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Homescreen()), 
        );
      } else {
        // User is not logged in, navigate to Login Screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Loginscreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'TODO APP',
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}