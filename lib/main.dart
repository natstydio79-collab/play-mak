import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const PlayMakApp());
}

class PlayMakApp extends StatelessWidget {
  const PlayMakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Play Mak',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
