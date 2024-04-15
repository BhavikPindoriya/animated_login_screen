import 'package:animatedlogin/myapp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  /// InheritedWidget style accessor to our State object.
  static _MyAppState? of(BuildContext context) {
    return context.findAncestorStateOfType<_MyAppState>();
  }
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: false,
        brightness: ThemeData.light().brightness,
      ),
      // Light theme settings

      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,

        useMaterial3: false,
        brightness: ThemeData.dark().brightness,

        // Dark theme settings
      ),
      themeMode: _themeMode,
      home: const SignupScreen(),
    );
  }
}
