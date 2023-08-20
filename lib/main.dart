import 'package:flutter/material.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/core/theme/theme.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/product/navigation/route_names.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/product/navigation/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ProjectTheme(themeMode: ProjectThemeMode.light).themeData,
      routes: NavigationRoutes().routes,
      initialRoute: ProjectRoutes.formPage.name,
    );
  }
}
