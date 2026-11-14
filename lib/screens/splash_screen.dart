import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8EC),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.eco,
              size: 90,
              color: Color(0xFF087443),
            ),
            const SizedBox(height: 15),
            const Text(
              'UmaSenso',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF087443),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Connecting Farmers and Communities',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 35),
            const CircularProgressIndicator(
              color: Color(0xFF087443),
            ),
          ],
        ),
      ),
    );
  }
}