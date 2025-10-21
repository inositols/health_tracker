import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:assignment/views/main_navigation_view.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health & Fitness Tracker',
      debugShowCheckedModeBanner: false,
      // ignore: deprecated_member_use
      useInheritedMediaQuery: true,
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFF6B35),
          secondary: Color(0xFF4CAF50),
          surface: Color(0xFF1E1E1E),
        ),
        fontFamily: 'SF Pro Display',
        useMaterial3: true,
      ),
      home: const MainNavigationView(),
    );
  }
}
