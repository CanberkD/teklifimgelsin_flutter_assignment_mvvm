import 'package:flutter/material.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/core/theme/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ProjectTheme(themeMode: ProjectThemeMode.light).themeData,
      home: const Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
