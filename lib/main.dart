import 'package:flutter/material.dart';
import 'app_shared.dart';
import 'screens/splash_screen.dart';

void main() => runApp(const UmaSensoApp());

class UmaSensoApp extends StatelessWidget {
  const UmaSensoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UmaSenso',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: cream,
        colorScheme: ColorScheme.fromSeed(seedColor: forest, primary: forest),
        appBarTheme: const AppBarTheme(backgroundColor: cream, foregroundColor: ink),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFDCE9D5)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFDCE9D5)),
          ),
        ),
      ),
     home: const SplashScreen(),
    );
  }
}
