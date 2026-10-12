import 'package:flutter/material.dart';
import 'package:prj3/views/settings_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'DMSans',
        colorScheme: .fromSeed(seedColor: Color(0xffFAF9F6)),
      ),
      home: const SettingsView(),
    );
  }
}
